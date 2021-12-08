// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUser$Query$User _$GetUser$Query$UserFromJson(Map<String, dynamic> json) =>
    GetUser$Query$User()
      ..id = json['id'] as String
      ..userType = json['userType'] as String;

Map<String, dynamic> _$GetUser$Query$UserToJson(GetUser$Query$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userType': instance.userType,
    };

GetUser$Query _$GetUser$QueryFromJson(Map<String, dynamic> json) =>
    GetUser$Query()
      ..user =
          GetUser$Query$User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUser$QueryToJson(GetUser$Query instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };

GetPlace$Query$Place _$GetPlace$Query$PlaceFromJson(
        Map<String, dynamic> json) =>
    GetPlace$Query$Place()
      ..id = json['id'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$GetPlace$Query$PlaceToJson(
        GetPlace$Query$Place instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GetPlace$Query _$GetPlace$QueryFromJson(Map<String, dynamic> json) =>
    GetPlace$Query()
      ..place = json['place'] == null
          ? null
          : GetPlace$Query$Place.fromJson(
              json['place'] as Map<String, dynamic>);

Map<String, dynamic> _$GetPlace$QueryToJson(GetPlace$Query instance) =>
    <String, dynamic>{
      'place': instance.place?.toJson(),
    };

GetCheckIns$Query$CheckIn$Place _$GetCheckIns$Query$CheckIn$PlaceFromJson(
        Map<String, dynamic> json) =>
    GetCheckIns$Query$CheckIn$Place()
      ..name = json['name'] as String
      ..latitude = (json['latitude'] as num).toDouble()
      ..longitude = (json['longitude'] as num).toDouble();

Map<String, dynamic> _$GetCheckIns$Query$CheckIn$PlaceToJson(
        GetCheckIns$Query$CheckIn$Place instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

GetCheckIns$Query$CheckIn _$GetCheckIns$Query$CheckInFromJson(
        Map<String, dynamic> json) =>
    GetCheckIns$Query$CheckIn()
      ..id = json['id'] as String
      ..placeId = json['placeId'] as String
      ..place = GetCheckIns$Query$CheckIn$Place.fromJson(
          json['place'] as Map<String, dynamic>)
      ..checkInTime = json['checkInTime'] as int
      ..checkOutTime = json['checkOutTime'] as int?;

Map<String, dynamic> _$GetCheckIns$Query$CheckInToJson(
        GetCheckIns$Query$CheckIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'place': instance.place.toJson(),
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
    };

GetCheckIns$Query _$GetCheckIns$QueryFromJson(Map<String, dynamic> json) =>
    GetCheckIns$Query()
      ..ownCheckIns = (json['ownCheckIns'] as List<dynamic>?)
          ?.map((e) =>
              GetCheckIns$Query$CheckIn.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCheckIns$QueryToJson(GetCheckIns$Query instance) =>
    <String, dynamic>{
      'ownCheckIns': instance.ownCheckIns?.map((e) => e.toJson()).toList(),
    };

CreateUser$Mutation$User _$CreateUser$Mutation$UserFromJson(
        Map<String, dynamic> json) =>
    CreateUser$Mutation$User()..id = json['id'] as String;

Map<String, dynamic> _$CreateUser$Mutation$UserToJson(
        CreateUser$Mutation$User instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateUser$Mutation _$CreateUser$MutationFromJson(Map<String, dynamic> json) =>
    CreateUser$Mutation()
      ..createUser = json['createUser'] == null
          ? null
          : CreateUser$Mutation$User.fromJson(
              json['createUser'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateUser$MutationToJson(
        CreateUser$Mutation instance) =>
    <String, dynamic>{
      'createUser': instance.createUser?.toJson(),
    };

CheckIn$Mutation _$CheckIn$MutationFromJson(Map<String, dynamic> json) =>
    CheckIn$Mutation()..checkIn = json['checkIn'] as bool?;

Map<String, dynamic> _$CheckIn$MutationToJson(CheckIn$Mutation instance) =>
    <String, dynamic>{
      'checkIn': instance.checkIn,
    };

GetPlaceArguments _$GetPlaceArgumentsFromJson(Map<String, dynamic> json) =>
    GetPlaceArguments(
      qrValue: json['qrValue'] as String,
    );

Map<String, dynamic> _$GetPlaceArgumentsToJson(GetPlaceArguments instance) =>
    <String, dynamic>{
      'qrValue': instance.qrValue,
    };

CreateUserArguments _$CreateUserArgumentsFromJson(Map<String, dynamic> json) =>
    CreateUserArguments(
      languageCode: json['languageCode'] as String,
    );

Map<String, dynamic> _$CreateUserArgumentsToJson(
        CreateUserArguments instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
    };

CheckInArguments _$CheckInArgumentsFromJson(Map<String, dynamic> json) =>
    CheckInArguments(
      qrValue: json['qrValue'] as String,
    );

Map<String, dynamic> _$CheckInArgumentsToJson(CheckInArguments instance) =>
    <String, dynamic>{
      'qrValue': instance.qrValue,
    };
