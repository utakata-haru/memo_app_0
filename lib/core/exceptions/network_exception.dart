import 'app_exception.dart';

/// ネットワーク関連のエラーを表す例外クラス
/// 
/// API通信やネットワーク接続に関する問題が発生した場合にスローされます。
class NetworkException extends AppException {
  /// HTTPステータスコード（オプション）
  final int? statusCode;

  const NetworkException(
    super.message, {
    this.statusCode,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('NetworkException: $message');
    
    if (statusCode != null) {
      buffer.write(' (status: $statusCode)');
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