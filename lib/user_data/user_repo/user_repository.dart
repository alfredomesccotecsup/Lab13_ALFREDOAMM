import '../models/user.dart';

class UserRepository {
  List<User> getUsers() {
    return [
      User(id: '1', name: 'Ejemplo de usurio 01', age: 23),
      User(id: '2', name: 'Ejemplo de usurio 02', age: 34),
    ];
  }
}

//ejemplo de usuarios litados