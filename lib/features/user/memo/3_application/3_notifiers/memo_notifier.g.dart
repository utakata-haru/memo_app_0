// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memoNotifierHash() => r'ff9c4d70a1bf35b460e40501d36b5e0c30ec22d1';

/// 単一メモの状態を管理するNotifier
///
/// メモの取得、作成、更新、削除の操作を管理し、
/// UIに対してMemoStateを提供します。
///
/// Copied from [MemoNotifier].
@ProviderFor(MemoNotifier)
final memoNotifierProvider =
    AutoDisposeNotifierProvider<MemoNotifier, MemoState>.internal(
      MemoNotifier.new,
      name: r'memoNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$memoNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MemoNotifier = AutoDisposeNotifier<MemoState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
