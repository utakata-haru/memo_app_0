import '../../features/user/memo/1_domain/exceptions/memo_validation_exception.dart';

/// メモ関連の入力検証を行うバリデータークラス
/// 
/// このクラスは、メモアプリケーション全体で使用される
/// 共通の検証ロジックを提供します。
class MemoValidator {
  /// メモIDの検証を行います
  /// 
  /// [id] 検証対象のメモID
  /// 
  /// Throws:
  /// - [MemoValidationException] IDが無効な場合
  static void validateMemoId(String id) {
    if (id.isEmpty) {
      throw MemoValidationException.invalidId(id);
    }
  }

  /// メモの内容の検証を行います
  /// 
  /// [content] 検証対象のメモ内容
  /// 
  /// Returns: トリミングされたメモ内容
  /// 
  /// Throws:
  /// - [MemoValidationException] 内容が無効な場合
  static String validateAndTrimMemoContent(String content) {
    if (content.isEmpty) {
      throw MemoValidationException.emptyContent();
    }

    final trimmedContent = content.trim();
    if (trimmedContent.isEmpty) {
      throw MemoValidationException.whitespaceOnlyContent();
    }

    return trimmedContent;
  }

  /// メモの内容の検証のみを行います（トリミングなし）
  /// 
  /// [content] 検証対象のメモ内容
  /// 
  /// Throws:
  /// - [MemoValidationException] 内容が無効な場合
  static void validateMemoContent(String content) {
    if (content.isEmpty) {
      throw MemoValidationException.emptyContent();
    }

    if (content.trim().isEmpty) {
      throw MemoValidationException.whitespaceOnlyContent();
    }
  }
}