// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoListModel _$MemoListModelFromJson(Map<String, dynamic> json) =>
    MemoListModel(
      memos: (json['memos'] as List<dynamic>)
          .map((e) => MemoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemoListModelToJson(MemoListModel instance) =>
    <String, dynamic>{'memos': instance.memos};
