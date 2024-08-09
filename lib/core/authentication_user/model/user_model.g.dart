// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      crush: json['crush'] as String?,
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'crush': instance.crush,
      'deviceToken': instance.deviceToken,
    };
