/// アプリケーション全体で使用される基底例外クラス
/// 
/// すべてのカスタム例外はこのクラスを継承する必要があります。
/// 共通のエラー処理機能を提供します。
abstract class AppException implements Exception {
  /// エラーメッセージ
  final String message;
  
  /// エラーコード（オプション）
  final String? code;
  
  /// 元の例外（オプション）
  final Exception? cause;

  const AppException(
    this.message, {
    this.code,
    this.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('$runtimeType: $message');
    
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    
    if (cause != null) {
      buffer.write(' caused by: $cause');
    }
    
    return buffer.toString();
  }
}