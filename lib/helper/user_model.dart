


import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserModel{
  int? id;
  int? user_id;
  String? name;
  String? content;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? latitude;
  num? longitude;

  UserModel({this.id, this.name,
    this.longitude, this.latitude, this.createdAt, this.content, this.updatedAt,this.user_id, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}