 class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      // JSONPlaceholder does not provide avatars, so use a generated avatar URL
      avatar: 'https://i.pravatar.cc/150?img=${json['id']}',
    );
  }

  // Compatibility getters so your existing UI can stay unchanged
  String get firstName => name;
  String get lastName => '';
}