import 'package:json_annotation/json_annotation.dart';

part 'ms_question_entity.g.dart';

@JsonSerializable()
class MsQuestionEntity extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  MsQuestionEntity(
    this.code,
    this.msg,
    this.data,
  );

  factory MsQuestionEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$MsQuestionEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MsQuestionEntityToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'question')
  String question;

  @JsonKey(name: 'answer')
  String answer;

  @JsonKey(name: 'tip')
  String tip;

  @JsonKey(name: 'level')
  String level;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'createtime')
  String createtime;

  @JsonKey(name: 'updatetime')
  String updatetime;

  @JsonKey(name: 'image')
  String image;

  Data(
    this.id,
    this.category,
    this.question,
    this.answer,
    this.tip,
    this.level,
    this.tag,
    this.author,
    this.createtime,
    this.updatetime,
    this.image,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
