// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memoListNotifierHash() => r'e65ebb1cd45ef015450c73a0bf8742d78f047a58';

/// メモリストの状態を管理するNotifier
///
/// メモリストの取得、更新の操作を管理し、
/// UIに対してMemoListStateを提供します。
///
/// Copied from [MemoListNotifier].
@ProviderFor(MemoListNotifier)
final memoListNotifierProvider =
    AutoDisposeNotifierProvider<MemoListNotifier, MemoListState>.internal(
      MemoListNotifier.new,
      name: r'memoListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$memoListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MemoListNotifier = AutoDisposeNotifier<MemoListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
