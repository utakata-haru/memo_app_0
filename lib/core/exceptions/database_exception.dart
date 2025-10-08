import 'app_exception.dart';

/// データベース関連のエラーを表す例外クラス
/// 
/// ローカルデータベースの操作に関する問題が発生した場合にスローされます。
class DatabaseException extends AppException {
  /// データベース操作の種類（例：'insert', 'update', 'delete', 'select'）
  final String? operation;

  const DatabaseException(
    super.message, {
    this.operation,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('DatabaseException: $message');
    
    if (operation != null) {
      buffer.write(' (operation: $operation)');
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