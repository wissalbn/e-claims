class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone':phone,
        'password':password,
      };
}
