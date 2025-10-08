import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../3_application/3_notifiers/memo_notifier.dart';

import '../1_widgets/3_organisms/memo_editor.dart';
import '../1_widgets/2_molecules/confirmation_dialog.dart';
import '../../../../../core/routing/app_routes.dart';

/// メモの作成・編集を行うページ
/// 
/// 新規メモの作成または既存メモの編集機能を提供します。
/// memoIdが指定されている場合は編集モード、未指定の場合は作成モードとなります。
class MemoEditPage extends HookConsumerWidget {
  /// 編集対象のメモID（新規作成の場合はnull）
  final String? memoId;

  const MemoEditPage({
    super.key,
    this.memoId,
  });

  /// 編集モードかどうか
  bool get isEditMode => memoId != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoState = ref.watch(memoNotifierProvider);
    final textController = useTextEditingController();

    // 編集モードの場合、既存のメモ内容を設定
    // 新規作成モードの場合は状態をリセット
    useEffect(() {
      Future.microtask(() {
        if (isEditMode) {
          ref.read(memoNotifierProvider.notifier).getMemo(memoId!);
        } else {
          // 新規作成モードの場合は状態をリセット
          ref.read(memoNotifierProvider.notifier).reset();
          textController.clear(); // テキストフィールドもクリア
        }
      });
      return null;
    }, [memoId]); // memoIdが変更された時に再実行

    // メモが読み込まれた時にテキストフィールドに設定
    useEffect(() {
      memoState.whenOrNull(
        loaded: (memo) {
          if (isEditMode) {
            // 編集モードの場合、メモの内容をテキストフィールドに設定
            textController.text = memo.context;
          }
        },
      );
      return null;
    }, [memoState]);

    return PopScope(
      canPop: false, // デフォルトの戻る動作を無効化
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // スワイプジェスチャーや戻るボタンが押された時に破棄確認を表示
          _showDiscardConfirmation(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEditMode ? 'メモを編集' : 'メモを作成'),
        ),
        body: memoState.when(
           initial: () => MemoEditor(
             isLoading: false,
             textController: textController, // テキストコントローラーを渡す
             onSave: (content) => _saveMemo(context, ref, content),
             onCancel: () => _showDiscardConfirmation(context),
           ),
           loading: () => MemoEditor(
             isLoading: true,
             textController: textController, // テキストコントローラーを渡す
             onSave: (content) => _saveMemo(context, ref, content),
             onCancel: () => _showDiscardConfirmation(context),
           ),
           loaded: (memo) => MemoEditor(
             memo: memo,
             isLoading: false,
             textController: textController, // テキストコントローラーを渡す
             onSave: (content) => _saveMemo(context, ref, content),
             onCancel: () => _showDiscardConfirmation(context),
           ),
           error: (message) => MemoEditor(
             errorMessage: message,
             isLoading: false,
             textController: textController, // テキストコントローラーを渡す
             onSave: (content) => _saveMemo(context, ref, content),
             onCancel: () => _showDiscardConfirmation(context),
           ),
         ),
      ),
    );
  }



  /// メモの保存処理
  void _saveMemo(
    BuildContext context,
    WidgetRef? ref,
    String content,
  ) async {
    // 内容の検証
    final trimmedContent = content.trim();
    if (trimmedContent.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('メモの内容を入力してください'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      if (isEditMode) {
        // 編集モード：メモを更新
        await ref!.read(memoNotifierProvider.notifier).updateMemo(
          memoId!,
          content,
        );
        
        if (context.mounted) {
          context.go(AppRoutes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('メモを更新しました')),
          );
        }
      } else {
        // 作成モード：新しいメモを作成
        await ref!.read(memoNotifierProvider.notifier).createMemo(
          content,
        );
        
        if (context.mounted) {
          context.go(AppRoutes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('メモを作成しました')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('エラーが発生しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 破棄確認ダイアログの表示
  void _showDiscardConfirmation(BuildContext context) {
    ConfirmationDialog.showDiscard(context).then((confirmed) {
      if (confirmed == true && context.mounted) {
        context.go(AppRoutes.home);
      }
    });
  }
}