class Mutations {
  static String createUser = r'''
  mutation CreateUser($user: CreateUserInput) {
  createUser(user: $user) {
    id
  }
}
''';
}
