import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../1_states/memo_list_state.dart';
import '../../1_domain/1_entities/memo_list_entity.dart';
import '../2_providers/memo_providers.dart';

part 'memo_list_notifier.g.dart';

/// メモリストの状態を管理するNotifier
/// 
/// メモリストの取得、更新の操作を管理し、
/// UIに対してMemoListStateを提供します。
@riverpod
class MemoListNotifier extends _$MemoListNotifier {
  @override
  MemoListState build() {
    // 初期状態を返す
    return const MemoListState.initial();
  }

  /// メモリストを取得
  Future<void> getMemoList() async {
    // ローディング状態に変更
    state = const MemoListState.loading();

    try {
      // UseCaseを取得
      final getMemoListUseCase = ref.read(getMemoListUseCaseProvider);
      
      // メモリストを取得
      final memoList = await getMemoListUseCase.call();
      
      // 成功状態に変更
      state = MemoListState.loaded(memos: memoList.memos);
    } catch (e) {
      // エラー状態に変更
      state = MemoListState.error(e.toString());
    }
  }

  /// メモリストを更新
  /// 
  /// [memoList] 更新するメモリストエンティティ
  Future<void> updateMemoList(MemoListEntity memoList) async {
    // ローディング状態に変更
    state = const MemoListState.loading();

    try {
      // UseCaseを取得
      final updateMemoListUseCase = ref.read(updateMemoListUseCaseProvider);
      
      // メモリストを更新
      final updatedMemoList = await updateMemoListUseCase.call(memoList);
      
      // 成功状態に変更
      state = MemoListState.loaded(memos: updatedMemoList.memos);
    } catch (e) {
      // エラー状態に変更
      state = MemoListState.error(e.toString());
    }
  }

  /// メモリストを再読み込み
  Future<void> refresh() async {
    await getMemoList();
  }

  /// 指定されたIDのメモを削除
  /// 
  /// [id] 削除対象のメモID
  Future<void> deleteMemo(String id) async {
    try {
      // UseCaseを取得
      final deleteMemoUseCase = ref.read(deleteMemoUseCaseProvider);
      
      // メモを削除
      await deleteMemoUseCase.call(id);
      
      // メモリストを再読み込みして最新状態に更新
      await getMemoList();
    } catch (e) {
      // エラー状態に変更
      state = MemoListState.error(e.toString());
      rethrow; // 呼び出し元でエラーハンドリングできるように再スロー
    }
  }

  /// 状態を初期化
  void reset() {
    state = const MemoListState.initial();
  }
}