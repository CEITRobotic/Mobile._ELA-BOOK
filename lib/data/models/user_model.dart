import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({super.name, super.password, super.email});

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
    );
  }

  User toEntity() {
    return User(name: name, email: email, password: password);
  }
}
