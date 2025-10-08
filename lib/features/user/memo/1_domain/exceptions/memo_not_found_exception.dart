import '../../../../../core/exceptions/not_found_exception.dart';

/// メモが見つからない場合のエラーを表す例外クラス
/// 
/// 指定されたIDのメモが存在しない場合にスローされます。
class MemoNotFoundException extends NotFoundException {
  const MemoNotFoundException(
    super.message, {
    super.resourceId,
    super.code,
    super.cause,
  }) : super(resourceType: 'memo');

  /// 指定されたIDのメモが見つからない場合の例外を作成
  factory MemoNotFoundException.byId(String id) {
    return MemoNotFoundException(
      'ID "$id" のメモが見つかりません',
      resourceId: id,
      code: 'MEMO_NOT_FOUND',
    );
  }

  /// メモリストが見つからない場合の例外を作成
  factory MemoNotFoundException.listNotFound() {
    return const MemoNotFoundException(
      'メモリストが見つかりません',
      code: 'MEMO_LIST_NOT_FOUND',
    );
  }
}