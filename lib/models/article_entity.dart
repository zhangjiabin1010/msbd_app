import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';


@JsonSerializable()
class ArticleEntity extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  ArticleEntity(this.code,this.msg,this.data,);

  factory ArticleEntity.fromJson(Map<String, dynamic> srcJson) => _$ArticleEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'createtime')
  String createtime;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'like')
  int like;

  @JsonKey(name: 'comment')
  int comment;

  Data(this.id,this.title,this.createtime,this.author,this.like,this.comment,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class ArticleListModel{
  List<Data> data;
  ArticleListModel(this.data);
  factory ArticleListModel.fromJson(List json){
    return ArticleListModel(
      json.map((i)=>Data.fromJson((i))).toList());
  }

}
