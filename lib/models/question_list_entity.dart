import 'package:json_annotation/json_annotation.dart';

part 'question_list_entity.g.dart';


@JsonSerializable()
class QuestionListEntity extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  QuestionListEntity(this.code,this.msg,this.data,);

  factory QuestionListEntity.fromJson(Map<String, dynamic> srcJson) => _$QuestionListEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QuestionListEntityToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'question')
  String question;

  Data(this.id,this.question,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class QuestionListModel{
  List<Data> data;
  QuestionListModel(this.data);
  factory QuestionListModel.fromJson(List json){
    return QuestionListModel(
      json.map((e) => Data.fromJson(e)).toList()
    );
  }
}