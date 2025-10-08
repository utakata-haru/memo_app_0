import '../../../../../core/exceptions/app_exception.dart';

/// メモ操作に関するエラーを表す例外クラス
/// 
/// メモの作成、更新、削除などの操作で問題が発生した場合にスローされます。
class MemoOperationException extends AppException {
  /// 失敗した操作の種類（例：'create', 'update', 'delete'）
  final String operation;

  const MemoOperationException(
    super.message, {
    required this.operation,
    super.code,
    super.cause,
  });

  /// メモの作成に失敗した場合の例外を作成
  factory MemoOperationException.createFailed(String reason) {
    return MemoOperationException(
      'メモの作成に失敗しました: $reason',
      operation: 'create',
      code: 'MEMO_CREATE_FAILED',
    );
  }

  /// メモの更新に失敗した場合の例外を作成
  factory MemoOperationException.updateFailed(String id, String reason) {
    return MemoOperationException(
      'メモ(ID: $id)の更新に失敗しました: $reason',
      operation: 'update',
      code: 'MEMO_UPDATE_FAILED',
    );
  }

  /// メモの削除に失敗した場合の例外を作成
  factory MemoOperationException.deleteFailed(String id, String reason) {
    return MemoOperationException(
      'メモ(ID: $id)の削除に失敗しました: $reason',
      operation: 'delete',
      code: 'MEMO_DELETE_FAILED',
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('MemoOperationException: $message');
    buffer.write(' (operation: $operation)');
    
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    
    if (cause != null) {
      buffer.write(' caused by: $cause');
    }
    
    return buffer.toString();
  }
}