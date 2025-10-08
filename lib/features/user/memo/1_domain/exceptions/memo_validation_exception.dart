import '../../../../../core/exceptions/validation_exception.dart';

/// メモのバリデーションエラーを表す例外クラス
/// 
/// メモの内容やIDの検証に失敗した場合にスローされます。
class MemoValidationException extends ValidationException {
  const MemoValidationException(
    super.message, {
    super.fieldName,
    super.code,
    super.cause,
  });

  /// メモIDが無効な場合の例外を作成
  factory MemoValidationException.invalidId(String id) {
    return MemoValidationException(
      'メモIDが無効です: $id',
      fieldName: 'id',
      code: 'INVALID_MEMO_ID',
    );
  }

  /// メモの内容が空の場合の例外を作成
  factory MemoValidationException.emptyContent() {
    return const MemoValidationException(
      'メモの内容が空です',
      fieldName: 'content',
      code: 'EMPTY_MEMO_CONTENT',
    );
  }

  /// メモの内容が空白のみの場合の例外を作成
  factory MemoValidationException.whitespaceOnlyContent() {
    return const MemoValidationException(
      'メモの内容が空白のみです',
      fieldName: 'content',
      code: 'WHITESPACE_ONLY_MEMO_CONTENT',
    );
  }
}