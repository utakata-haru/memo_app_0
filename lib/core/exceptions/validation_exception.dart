import 'app_exception.dart';

/// バリデーションエラーを表す例外クラス
/// 
/// 入力値の検証に失敗した場合にスローされます。
class ValidationException extends AppException {
  /// バリデーションに失敗したフィールド名
  final String? fieldName;

  const ValidationException(
    super.message, {
    this.fieldName,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('ValidationException: $message');
    
    if (fieldName != null) {
      buffer.write(' (field: $fieldName)');
    }
    
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    
    if (cause != null) {
      buffer.write(' caused by: $cause');
    }
    
    return buffer.toString();
  }
}