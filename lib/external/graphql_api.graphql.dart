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

  late String firstName;

  late String lastName;

  late String email;

  String? phone;

  late String userType;

  @override
  List<Object?> get props => [id, firstName, lastName, email, phone, userType];
  @override
  Map<String, dynamic> toJson() => _$GetUser$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUser$Query extends JsonSerializable with EquatableMixin {
  GetUser$Query();

  factory GetUser$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUser$QueryFromJson(json);

  GetUser$Query$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$GetUser$QueryToJson(this);
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
class CreateUserInput extends JsonSerializable with EquatableMixin {
  CreateUserInput(
      {required this.firstName,
      required this.languageCode,
      required this.lastName});

  factory CreateUserInput.fromJson(Map<String, dynamic> json) =>
      _$CreateUserInputFromJson(json);

  late String firstName;

  late String languageCode;

  late String lastName;

  @override
  List<Object?> get props => [firstName, languageCode, lastName];
  @override
  Map<String, dynamic> toJson() => _$CreateUserInputToJson(this);
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
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'phone'),
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
class CreateUserArguments extends JsonSerializable with EquatableMixin {
  CreateUserArguments({this.user});

  @override
  factory CreateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateUserArgumentsFromJson(json);

  final CreateUserInput? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$CreateUserArgumentsToJson(this);
}

final CREATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'user')),
            type: NamedTypeNode(
                name: NameNode(value: 'CreateUserInput'), isNonNull: false),
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
                  name: NameNode(value: 'user'),
                  value: VariableNode(name: NameNode(value: 'user')))
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
