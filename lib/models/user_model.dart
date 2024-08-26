class UserModel {
  final String userName, email, token;

  UserModel({
    required this.userName,
    required this.email,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      email: map['email'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'token': token,
    };
  }
}
