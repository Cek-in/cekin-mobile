// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUser$Query$User extends JsonSerializable with EquatableMixin {
  GetUser$Query$User();

  factory GetUser$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUser$Query$UserFromJson(json);

  late String id;

  late String userType;

  @override
  List<Object?> get props => [id, userType];
  @override
  Map<String, dynamic> toJson() => _$GetUser$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUser$Query extends JsonSerializable with EquatableMixin {
  GetUser$Query();

  factory GetUser$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUser$QueryFromJson(json);

  late GetUser$Query$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$GetUser$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPlace$Query$Place extends JsonSerializable with EquatableMixin {
  GetPlace$Query$Place();

  factory GetPlace$Query$Place.fromJson(Map<String, dynamic> json) =>
      _$GetPlace$Query$PlaceFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$GetPlace$Query$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPlace$Query extends JsonSerializable with EquatableMixin {
  GetPlace$Query();

  factory GetPlace$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPlace$QueryFromJson(json);

  GetPlace$Query$Place? place;

  @override
  List<Object?> get props => [place];
  @override
  Map<String, dynamic> toJson() => _$GetPlace$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCheckIns$Query$CheckIn$Place extends JsonSerializable
    with EquatableMixin {
  GetCheckIns$Query$CheckIn$Place();

  factory GetCheckIns$Query$CheckIn$Place.fromJson(Map<String, dynamic> json) =>
      _$GetCheckIns$Query$CheckIn$PlaceFromJson(json);

  late String name;

  late double latitude;

  late double longitude;

  @override
  List<Object?> get props => [name, latitude, longitude];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCheckIns$Query$CheckIn$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCheckIns$Query$CheckIn extends JsonSerializable with EquatableMixin {
  GetCheckIns$Query$CheckIn();

  factory GetCheckIns$Query$CheckIn.fromJson(Map<String, dynamic> json) =>
      _$GetCheckIns$Query$CheckInFromJson(json);

  late String id;

  late String placeId;

  late GetCheckIns$Query$CheckIn$Place place;

  late int checkInTime;

  int? checkOutTime;

  @override
  List<Object?> get props => [id, placeId, place, checkInTime, checkOutTime];
  @override
  Map<String, dynamic> toJson() => _$GetCheckIns$Query$CheckInToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCheckIns$Query extends JsonSerializable with EquatableMixin {
  GetCheckIns$Query();

  factory GetCheckIns$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCheckIns$QueryFromJson(json);

  List<GetCheckIns$Query$CheckIn>? ownCheckIns;

  @override
  List<Object?> get props => [ownCheckIns];
  @override
  Map<String, dynamic> toJson() => _$GetCheckIns$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$Mutation$User extends JsonSerializable with EquatableMixin {
  CreateUser$Mutation$User();

  factory CreateUser$Mutation$User.fromJson(Map<String, dynamic> json) =>
      _$CreateUser$Mutation$UserFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$CreateUser$Mutation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$Mutation extends JsonSerializable with EquatableMixin {
  CreateUser$Mutation();

  factory CreateUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateUser$MutationFromJson(json);

  CreateUser$Mutation$User? createUser;

  @override
  List<Object?> get props => [createUser];
  @override
  Map<String, dynamic> toJson() => _$CreateUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckIn$Mutation extends JsonSerializable with EquatableMixin {
  CheckIn$Mutation();

  factory CheckIn$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CheckIn$MutationFromJson(json);

  bool? checkIn;

  @override
  List<Object?> get props => [checkIn];
  @override
  Map<String, dynamic> toJson() => _$CheckIn$MutationToJson(this);
}

final GET_USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUser'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'userType'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetUserQuery extends GraphQLQuery<GetUser$Query, JsonSerializable> {
  GetUserQuery();

  @override
  final DocumentNode document = GET_USER_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetUser';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetUser$Query parse(Map<String, dynamic> json) =>
      GetUser$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetPlaceArguments extends JsonSerializable with EquatableMixin {
  GetPlaceArguments({required this.qrValue});

  @override
  factory GetPlaceArguments.fromJson(Map<String, dynamic> json) =>
      _$GetPlaceArgumentsFromJson(json);

  late String qrValue;

  @override
  List<Object?> get props => [qrValue];
  @override
  Map<String, dynamic> toJson() => _$GetPlaceArgumentsToJson(this);
}

final GET_PLACE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetPlace'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'qrValue')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'place'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'qrValue'),
                  value: VariableNode(name: NameNode(value: 'qrValue')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetPlaceQuery extends GraphQLQuery<GetPlace$Query, GetPlaceArguments> {
  GetPlaceQuery({required this.variables});

  @override
  final DocumentNode document = GET_PLACE_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetPlace';

  @override
  final GetPlaceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetPlace$Query parse(Map<String, dynamic> json) =>
      GetPlace$Query.fromJson(json);
}

final GET_CHECK_INS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCheckIns'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'ownCheckIns'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'placeId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'place'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'latitude'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'longitude'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'checkInTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'checkOutTime'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetCheckInsQuery
    extends GraphQLQuery<GetCheckIns$Query, JsonSerializable> {
  GetCheckInsQuery();

  @override
  final DocumentNode document = GET_CHECK_INS_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetCheckIns';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetCheckIns$Query parse(Map<String, dynamic> json) =>
      GetCheckIns$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateUserArguments extends JsonSerializable with EquatableMixin {
  CreateUserArguments({required this.languageCode});

  @override
  factory CreateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateUserArgumentsFromJson(json);

  late String languageCode;

  @override
  List<Object?> get props => [languageCode];
  @override
  Map<String, dynamic> toJson() => _$CreateUserArgumentsToJson(this);
}

final CREATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'languageCode')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createUser'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'languageCode'),
                  value: VariableNode(name: NameNode(value: 'languageCode')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class CreateUserMutation
    extends GraphQLQuery<CreateUser$Mutation, CreateUserArguments> {
  CreateUserMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CreateUser';

  @override
  final CreateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateUser$Mutation parse(Map<String, dynamic> json) =>
      CreateUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CheckInArguments extends JsonSerializable with EquatableMixin {
  CheckInArguments({required this.qrValue});

  @override
  factory CheckInArguments.fromJson(Map<String, dynamic> json) =>
      _$CheckInArgumentsFromJson(json);

  late String qrValue;

  @override
  List<Object?> get props => [qrValue];
  @override
  Map<String, dynamic> toJson() => _$CheckInArgumentsToJson(this);
}

final CHECK_IN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CheckIn'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'qrValue')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'checkIn'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'qrValue'),
                  value: VariableNode(name: NameNode(value: 'qrValue')))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class CheckInMutation extends GraphQLQuery<CheckIn$Mutation, CheckInArguments> {
  CheckInMutation({required this.variables});

  @override
  final DocumentNode document = CHECK_IN_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CheckIn';

  @override
  final CheckInArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CheckIn$Mutation parse(Map<String, dynamic> json) =>
      CheckIn$Mutation.fromJson(json);
}
