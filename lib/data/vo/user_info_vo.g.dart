// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoVO _$UserInfoVOFromJson(Map<String, dynamic> json) {
  return UserInfoVO(
      json['userCode'] as String,
      json['nameCn'] as String,
      json['nameEn'] as String,
      json['nickname'] as String,
      json['isDimission'] as String,
      json['education'] as String,
      json['seniority'] as String,
      json['sex'] as int,
      json['age'] as int,
      json['countryCode'] as String,
      json['provinceCode'] as String,
      json['cityCode'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['address'] as String,
      json['employeeNum'] as String,
      json['position'] as String,
      json['professionalPost'] as String,
      json['companyCode'] as String,
      json['departmentCode'] as String,
      json['sources'] as String,
      json['description'] as String,
      json['telPhone'] as String,
      json['companyId'] as int,
      json['deptParentCode'] as String,
      json['deptNameCn'] as String,
      json['deptNameEn'] as String,
      json['deptPath'] as String,
      json['deptPathName'] as String,
      json['companyNameCn'] as String,
      json['companyNameEn'] as String,
      json['companyAddress'] as String,
      json['areaId'] as String,
      json['permission'] as Map<String, dynamic>)
    ..id = json['id'] as int
    ..isDeleted = json['isDeleted'] as bool
    ..createdBy = json['createdBy'] as String
    ..creationTime = json['creationTime'] == null
        ? null
        : DateTime.parse(json['creationTime'] as String)
    ..updatedBy = json['updatedBy'] as String
    ..updateTime = json['updateTime'] == null
        ? null
        : DateTime.parse(json['updateTime'] as String);
}

Map<String, dynamic> _$UserInfoVOToJson(UserInfoVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDeleted': instance.isDeleted,
      'createdBy': instance.createdBy,
      'creationTime': instance.creationTime?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updateTime': instance.updateTime?.toIso8601String(),
      'userCode': instance.userCode,
      'nameCn': instance.nameCn,
      'nameEn': instance.nameEn,
      'nickname': instance.nickname,
      'isDimission': instance.isDimission,
      'education': instance.education,
      'seniority': instance.seniority,
      'sex': instance.sex,
      'age': instance.age,
      'countryCode': instance.countryCode,
      'provinceCode': instance.provinceCode,
      'cityCode': instance.cityCode,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'employeeNum': instance.employeeNum,
      'position': instance.position,
      'professionalPost': instance.professionalPost,
      'companyCode': instance.companyCode,
      'departmentCode': instance.departmentCode,
      'sources': instance.sources,
      'description': instance.description,
      'telPhone': instance.telPhone,
      'companyId': instance.companyId,
      'deptParentCode': instance.deptParentCode,
      'deptNameCn': instance.deptNameCn,
      'deptNameEn': instance.deptNameEn,
      'deptPath': instance.deptPath,
      'deptPathName': instance.deptPathName,
      'companyNameCn': instance.companyNameCn,
      'companyNameEn': instance.companyNameEn,
      'companyAddress': instance.companyAddress,
      'areaId': instance.areaId,
      'permission': instance.permission
    };
