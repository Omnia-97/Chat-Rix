class UserModel {
  static const String collectionName = 'users';
  String id;
  String userName;
  String email;
  UserModel({
    required this.id,
    required this.userName,
    required this.email,
  });
  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userName: json['userName'],
          email: json['email'],
        );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
    };
  }
}
