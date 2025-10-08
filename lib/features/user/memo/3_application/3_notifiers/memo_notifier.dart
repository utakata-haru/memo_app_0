import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../1_states/memo_state.dart';
import '../2_providers/memo_providers.dart';

part 'memo_notifier.g.dart';

/// 単一メモの状態を管理するNotifier
/// 
/// メモの取得、作成、更新、削除の操作を管理し、
/// UIに対してMemoStateを提供します。
@riverpod
class MemoNotifier extends _$MemoNotifier {
  @override
  MemoState build() {
    // 初期状態を返す
    return const MemoState.initial();
  }

  /// 指定されたIDのメモを取得
  /// 
  /// [id] 取得対象のメモID
  Future<void> getMemo(String id) async {
    // ローディング状態に変更
    state = const MemoState.loading();

    try {
      // UseCaseを取得
      final getMemoUseCase = ref.read(getMemoUseCaseProvider);
      
      // メモを取得
      final memo = await getMemoUseCase.call(id);
      
      // 成功状態に変更
      state = MemoState.loaded(memo);
    } catch (e) {
      // エラー状態に変更
      state = MemoState.error(e.toString());
    }
  }

  /// 新しいメモを作成
  /// 
  /// [content] メモの内容
  Future<void> createMemo(String content) async {
    // ローディング状態に変更
    state = const MemoState.loading();

    try {
      // UseCaseを取得
      final createMemoUseCase = ref.read(createMemoUseCaseProvider);
      
      // メモを作成
      final createdMemo = await createMemoUseCase.call(content);
      
      // 成功状態に変更
      state = MemoState.loaded(createdMemo);
    } catch (e) {
      // エラー状態に変更
      state = MemoState.error(e.toString());
    }
  }

  /// 既存のメモを更新
  /// 
  /// [id] 更新対象のメモID
  /// [content] 新しいメモの内容
  Future<void> updateMemo(String id, String content) async {
    // ローディング状態に変更
    state = const MemoState.loading();

    try {
      // UseCaseを取得
      final updateMemoUseCase = ref.read(updateMemoUseCaseProvider);
      
      // メモを更新
      final updatedMemo = await updateMemoUseCase.call(id, content);
      
      // 成功状態に変更
      state = MemoState.loaded(updatedMemo);
    } catch (e) {
      // エラー状態に変更
      state = MemoState.error(e.toString());
    }
  }

  /// 指定されたIDのメモを削除
  /// 
  /// [id] 削除対象のメモID
  Future<void> deleteMemo(String id) async {
    // ローディング状態に変更
    state = const MemoState.loading();

    try {
      // UseCaseを取得
      final deleteMemoUseCase = ref.read(deleteMemoUseCaseProvider);
      
      // メモを削除
      await deleteMemoUseCase.call(id);
      
      // 初期状態に戻す（削除後はメモが存在しない）
      state = const MemoState.initial();
    } catch (e) {
      // エラー状態に変更
      state = MemoState.error(e.toString());
    }
  }

  /// 状態を初期化
  void reset() {
    state = const MemoState.initial();
  }
}