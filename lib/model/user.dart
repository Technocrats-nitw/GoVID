class User {
  final String id;
  final String name;
  final String imagePath;
  final String role;

  const User({
    this.id = '',
    this.name = '',
    this.imagePath = '',
    this.role = '',
  });

  User copy({
    String id,
    String name,
    String imagePath,
    String role,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        role: role ?? this.role,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        imagePath: json['imagePath'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imagePath': imagePath,
        'role': role,
      };

  @override
  String toString() => 'User{id: $id, name: $name,role: $role}';
}
