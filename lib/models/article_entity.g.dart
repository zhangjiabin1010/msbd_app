// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleEntity _$ArticleEntityFromJson(Map<String, dynamic> json) =>
    ArticleEntity(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleEntityToJson(ArticleEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['title'] as String,
      json['createtime'] as String,
      json['author'] as String,
      json['like'] as int,
      json['comment'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createtime': instance.createtime,
      'author': instance.author,
      'like': instance.like,
      'comment': instance.comment,
    };

ArticleListModel _$ArticleListModelFromJson(Map<String, dynamic> json) =>
    ArticleListModel(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleListModelToJson(ArticleListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
