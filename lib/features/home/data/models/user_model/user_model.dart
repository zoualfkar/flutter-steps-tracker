
import 'package:json_annotation/json_annotation.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{

  String? id;
  String? name;
  int? count;
  int? totalCount;
  int? healthPoint;


  UserModel(this.id, this.name, this.count, this.totalCount, this.healthPoint);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);


}

extension MapToDomain on UserModel {

  UserEntity  toDomain(){
    return UserEntity(
      id: id??'',
      name: name??'',
      count: count??0,
      totalCount: totalCount??0,
        healthPoint: healthPoint??0
    );
  }
}