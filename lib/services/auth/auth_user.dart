class AuthUser {
  final String id;
  final String name;
  final String email;
  final bool emailVerified;

  const AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerified = false,
  });

  AuthUser copyWith({
    String? id,
    String? name,
    String? email,
    bool? emailVerified,
  }) {
    return AuthUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }
}
