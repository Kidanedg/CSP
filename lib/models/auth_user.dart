class AuthUser {
  final String id;
  final String fullName;
  final String email;
  final String? photoUrl;

  const AuthUser({
    required this.id,
    required this.fullName,
    required this.email,
    this.photoUrl,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  AuthUser copyWith({
    String? id,
    String? fullName,
    String? email,
    String? photoUrl,
  }) {
    return AuthUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
