import '../../../../../../../core/exceptions/app_exception.dart';
import '../../../../../../../core/exceptions/database_exception.dart';
import '../../../../../../../core/exceptions/not_found_exception.dart';

/// ローカルデータソース層で発生する例外の基底クラス
/// 
/// データベース操作、ファイルアクセス、SharedPreferencesアクセスなど
/// ローカルストレージに関連するエラーを表現します。
class LocalDataSourceException extends AppException {
  const LocalDataSourceException(
    super.message, {
    super.code,
    super.cause,
  });
}

/// ローカルデータソース層でのデータベース操作に関する例外
/// 
/// coreのDatabaseExceptionを継承し、ローカルデータソース固有の
/// データベースエラーを表現します。
class LocalDatabaseException extends DatabaseException {
  const LocalDatabaseException(
    super.message, {
    super.operation,
    super.code,
    super.cause,
  });
}

/// ローカルデータソース層でのデータが見つからない場合の例外
/// 
/// coreのNotFoundExceptionを継承し、ローカルデータソース固有の
/// データ未発見エラーを表現します。
class LocalDataNotFoundException extends NotFoundException {
  const LocalDataNotFoundException(
    super.message, {
    super.resourceType,
    super.resourceId,
    super.code,
    super.cause,
  });
}

/// データの整合性に関する例外
/// 
/// データベースの制約違反や不正なデータ状態を表現します。
class DataIntegrityException extends LocalDataSourceException {
  /// 整合性違反の種類（例：'unique_constraint', 'foreign_key'）
  final String? violationType;

  const DataIntegrityException(
    super.message, {
    this.violationType,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('DataIntegrityException: $message');
    
    if (violationType != null) {
      buffer.write(' (violation: $violationType)');
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

/// ストレージ容量不足の例外
/// 
/// デバイスの容量不足やストレージアクセス問題を表現します。
class StorageException extends LocalDataSourceException {
  /// ストレージエラーの種類（例：'insufficient_space', 'permission_denied'）
  final String? storageErrorType;

  const StorageException(
    super.message, {
    this.storageErrorType,
    super.code,
    super.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('StorageException: $message');
    
    if (storageErrorType != null) {
      buffer.write(' (error: $storageErrorType)');
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