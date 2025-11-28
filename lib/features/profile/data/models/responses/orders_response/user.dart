class User {
  String? id;
  String? name;
  String? email;
  String? phone;

  User({this.id, this.name, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'email': email,
    'phone': phone,
  };
}
