// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ms_question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsQuestionEntity _$MsQuestionEntityFromJson(Map<String, dynamic> json) =>
    MsQuestionEntity(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MsQuestionEntityToJson(MsQuestionEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as String,
      json['category'] as String,
      json['question'] as String,
      json['answer'] as String,
      json['tip'] as String,
      json['level'] as String,
      json['tag'] as String,
      json['author'] as String,
      json['createtime'] as String,
      json['updatetime'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'question': instance.question,
      'answer': instance.answer,
      'tip': instance.tip,
      'level': instance.level,
      'tag': instance.tag,
      'author': instance.author,
      'createtime': instance.createtime,
      'updatetime': instance.updatetime,
      'image': instance.image,
    };
