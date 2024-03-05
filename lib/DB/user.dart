class UserList {
  final int id;
  final String name;
  final String user;
  final String password;

  UserList({required this.id, required this.name, required this.user, required this.password});
}

List<UserList> userList = [
  UserList(id: 1, name: 'Admin', user: 'admin', password: '1234'),
  UserList(id: 2, name: 'Alan', user: 'alan', password: '4321'),
];
