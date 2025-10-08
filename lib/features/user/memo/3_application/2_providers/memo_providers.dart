import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Domain層のインポート - 単一メモ
import '../../1_domain/2_repositories/memo_repository.dart';
import '../../1_domain/3_usecases/get_memo_usecase.dart';
import '../../1_domain/3_usecases/create_memo_usecase.dart';
import '../../1_domain/3_usecases/update_memo_usecase.dart';
import '../../1_domain/3_usecases/delete_memo_usecase.dart';

// Domain層のインポート - メモリスト
import '../../1_domain/2_repositories/memo_list_repository.dart';
import '../../1_domain/3_usecases/get_memo_list_usecase.dart';
import '../../1_domain/3_usecases/update_memo_list_usecase.dart';

// Infrastructure層のインポート - 単一メモ
import '../../2_infrastructure/2_data_sources/1_local/memo_local_data_source.dart';
import '../../2_infrastructure/2_data_sources/1_local/memo_local_data_source_impl.dart';
import '../../2_infrastructure/3_repositories/memo_repository_impl.dart';

// Infrastructure層のインポート - メモリスト
import '../../2_infrastructure/3_repositories/memo_list_repository_impl.dart';

// Core層のインポート
import '../../../../../core/providers/database_providers.dart';

part 'memo_providers.g.dart';

// ========================================
// Repository Providers - Single Memo
// ========================================

/// MemoRepositoryの依存性注入
@riverpod
MemoRepository memoRepository(Ref ref) {
  final localDataSource = ref.watch(memoLocalDataSourceProvider);
  return MemoRepositoryImpl(localDataSource);
}

// ========================================
// DataSource Providers - Single Memo
// ========================================

/// MemoLocalDataSourceの依存性注入
@riverpod
MemoLocalDataSource memoLocalDataSource(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return MemoLocalDataSourceImpl(database);
}

// ========================================
// UseCase Providers - Single Memo
// ========================================

/// GetMemoUseCaseの依存性注入
@riverpod
GetMemoUseCase getMemoUseCase(Ref ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return GetMemoUseCase(repository);
}

/// CreateMemoUseCaseの依存性注入
@riverpod
CreateMemoUseCase createMemoUseCase(Ref ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return CreateMemoUseCase(repository);
}

/// UpdateMemoUseCaseの依存性注入
@riverpod
UpdateMemoUseCase updateMemoUseCase(Ref ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return UpdateMemoUseCase(repository);
}

/// DeleteMemoUseCaseの依存性注入
@riverpod
DeleteMemoUseCase deleteMemoUseCase(Ref ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return DeleteMemoUseCase(repository);
}

// ========================================
// Repository Providers - Memo List
// ========================================

/// MemoListRepositoryの依存性注入
@riverpod
MemoListRepository memoListRepository(Ref ref) {
  final localDataSource = ref.watch(memoLocalDataSourceProvider);
  return MemoListRepositoryImpl(localDataSource);
}

// ========================================
// UseCase Providers - Memo List
// ========================================

/// GetMemoListUseCaseの依存性注入
@riverpod
GetMemoListUseCase getMemoListUseCase(Ref ref) {
  final repository = ref.watch(memoListRepositoryProvider);
  return GetMemoListUseCase(repository);
}

/// UpdateMemoListUseCaseの依存性注入
@riverpod
UpdateMemoListUseCase updateMemoListUseCase(Ref ref) {
  final repository = ref.watch(memoListRepositoryProvider);
  return UpdateMemoListUseCase(repository);
}