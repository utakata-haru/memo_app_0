import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../1_domain/1_entities/memo_entity.dart';
import '../2_molecules/error_display.dart';

import '../1_atoms/action_button.dart';

/// メモの編集・作成を行うOrganismコンポーネント
/// 
/// メモの入力フィールド、保存・キャンセルボタン、エラー表示を管理します。
class MemoEditor extends HookWidget {
  /// 編集対象のメモ（新規作成の場合はnull）
  final MemoEntity? memo;
  
  /// 外部から渡されるテキストコントローラー（オプション）
  final TextEditingController? textController;
  
  /// 保存ボタンが押された時のコールバック
  final void Function(String content)? onSave;
  
  /// キャンセルボタンが押された時のコールバック
  final VoidCallback? onCancel;
  
  /// ローディング状態
  final bool isLoading;
  
  /// エラーメッセージ
  final String? errorMessage;

  const MemoEditor({
    super.key,
    this.memo,
    this.textController,
    this.onSave,
    this.onCancel,
    this.isLoading = false,
    this.errorMessage,
  });

  /// 編集モードかどうか
  bool get isEditMode => memo != null;

  @override
  Widget build(BuildContext context) {
    // 外部からコントローラーが渡された場合はそれを使用、そうでなければ内部で作成
    final internalController = useTextEditingController(
      text: memo?.context ?? '',
    );
    final controller = textController ?? internalController;

    // エラー状態の表示
    if (errorMessage != null) {
      return ErrorDisplay(
        message: errorMessage!,
        onRetry: () {
          // エラー状態をクリアするためのコールバックが必要
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 説明テキスト
          Text(
            isEditMode 
                ? 'メモの内容を編集してください' 
                : '新しいメモの内容を入力してください',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          
          // メモ入力フィールド
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  enabled: !isLoading,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'ここにメモを入力してください...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // アクションボタン
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: 'キャンセル',
                  style: ActionButtonStyle.secondary,
                  onPressed: isLoading ? null : onCancel,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ActionButton(
                  label: isEditMode ? '更新' : '保存',
                  style: ActionButtonStyle.primary,
                  onPressed: isLoading 
                      ? null 
                      : () => onSave?.call(controller.text),
                  isLoading: isLoading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}