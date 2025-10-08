import 'package:freezed_annotation/freezed_annotation.dart';
import '../../1_domain/1_entities/memo_entity.dart';

part 'memo_list_state.freezed.dart';

/// メモリストの状態を表すクラス
/// 
/// メモのリストに関する非同期処理の状態を管理します。
@freezed
class MemoListState with _$MemoListState {
  /// 初期状態
  const factory MemoListState.initial() = MemoListStateInitial;
  
  /// ローディング状態
  const factory MemoListState.loading() = MemoListStateLoading;
  
  /// データ読み込み完了状態
  const factory MemoListState.loaded({
    required List<MemoEntity> memos,
  }) = MemoListStateLoaded;
  
  /// エラー状態
  const factory MemoListState.error(String message) = MemoListStateError;
}

/// MemoListStateの拡張メソッド
extension MemoListStateX on MemoListState {
  /// 現在ローディング中かどうか
  bool get isLoading => this is MemoListStateLoading;
  
  /// エラー状態かどうか
  bool get hasError => this is MemoListStateError;
  
  /// データが読み込まれているかどうか
  bool get hasData => this is MemoListStateLoaded;
  
  /// メモリストを取得（ある場合）
  List<MemoEntity> get memos => mapOrNull(
    loaded: (state) => state.memos,
  ) ?? [];
  
  /// エラーメッセージを取得（ある場合）
  String? get errorMessage => mapOrNull(
    error: (state) => state.message,
  );
  
  /// メモリストが空かどうか
  bool get isEmpty => memos.isEmpty;
  
  /// メモの件数を取得
  int get count => memos.length;
}