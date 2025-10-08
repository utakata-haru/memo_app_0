import 'app_exception.dart';

/// リソースが見つからない場合のエラーを表す例外クラス
/// 
/// 指定されたIDやキーに対応するデータが存在しない場合にスローされます。
class NotFoundException extends AppException {
  /// 見つからなかったリソースの種類（例：'memo', 'user'）
  final String? resourceType;
  
  /// 見つからなかったリソースのID
  final String? resourceId;

  const NotFoundException(
    super.message, {
    this.resourceType,
    this.resourceId,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('NotFoundException: $message');
    
    if (resourceType != null) {
      buffer.write(' (type: $resourceType)');
    }
    
    if (resourceId != null) {
      buffer.write(' (id: $resourceId)');
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