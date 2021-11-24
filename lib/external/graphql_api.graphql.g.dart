// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUser$Query$User _$GetUser$Query$UserFromJson(Map<String, dynamic> json) =>
    GetUser$Query$User()
      ..id = json['id'] as String
      ..firstName = json['firstName'] as String
      ..lastName = json['lastName'] as String
      ..email = json['email'] as String
      ..phone = json['phone'] as String?
      ..userType = json['userType'] as String;

Map<String, dynamic> _$GetUser$Query$UserToJson(GetUser$Query$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
    };

GetUser$Query _$GetUser$QueryFromJson(Map<String, dynamic> json) =>
    GetUser$Query()
      ..user = json['user'] == null
          ? null
          : GetUser$Query$User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUser$QueryToJson(GetUser$Query instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
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

CreateUserInput _$CreateUserInputFromJson(Map<String, dynamic> json) =>
    CreateUserInput(
      firstName: json['firstName'] as String,
      languageCode: json['languageCode'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$CreateUserInputToJson(CreateUserInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'languageCode': instance.languageCode,
      'lastName': instance.lastName,
    };

CreateUserArguments _$CreateUserArgumentsFromJson(Map<String, dynamic> json) =>
    CreateUserArguments(
      user: json['user'] == null
          ? null
          : CreateUserInput.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserArgumentsToJson(
        CreateUserArguments instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };
