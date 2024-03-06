class UserList {
  late String id;
  late String name;
  late String user;
  late String password;

  UserList(this.id, this.name, this.user, this.password);

  static UserList fromMap(Map map) {
    return UserList(
      map['id'] as String,
      map['name'] as String,
      map['user'] as String,
      map['password'] as String,
    );
  }
}
