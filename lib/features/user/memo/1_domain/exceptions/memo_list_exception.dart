import '../../../../../core/exceptions/app_exception.dart';

/// メモリスト操作に関するエラーを表す例外クラス
/// 
/// メモリストの取得や更新などの操作で問題が発生した場合にスローされます。
class MemoListException extends AppException {
  /// 失敗した操作の種類（例：'get', 'update'）
  final String operation;

  const MemoListException(
    super.message, {
    required this.operation,
    super.code,
    super.cause,
  });

  /// メモリストの取得に失敗した場合の例外を作成
  factory MemoListException.getFailed(String reason) {
    return MemoListException(
      'メモリストの取得に失敗しました: $reason',
      operation: 'get',
      code: 'MEMO_LIST_GET_FAILED',
    );
  }

  /// メモリストの更新に失敗した場合の例外を作成
  factory MemoListException.updateFailed(String reason) {
    return MemoListException(
      'メモリストの更新に失敗しました: $reason',
      operation: 'update',
      code: 'MEMO_LIST_UPDATE_FAILED',
    );
  }

  /// 空のメモリストが渡された場合の例外を作成
  factory MemoListException.emptyList() {
    return const MemoListException(
      'メモリストが空です',
      operation: 'validation',
      code: 'EMPTY_MEMO_LIST',
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('MemoListException: $message');
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