class AuthModel {
  final id;
  final email;

  AuthModel({required this.id, required this.email});

  factory AuthModel.fromJson(final id, final email) =>
      AuthModel(id: id, email: email);
}
