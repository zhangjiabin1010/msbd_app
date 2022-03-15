// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListEntity _$QuestionListEntityFromJson(Map<String, dynamic> json) =>
    QuestionListEntity(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionListEntityToJson(QuestionListEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
