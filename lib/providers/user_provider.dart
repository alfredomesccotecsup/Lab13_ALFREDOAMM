import 'package:flutter/material.dart';
import '../user_data/models/user.dart';
import '../user_data/user_repo/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  List<User> _users = [];

  // Getter para obtener la lista de usuarios
  List<User> get users => _users;

  // Método para cargar usuarios desde el repositorio
  Future<void> loadUsers() async {
    try {
      _users = await _userRepository.getUsers();
      notifyListeners();
    } catch (error) {
      // Manejar el error de carga de usuarios
      print('Error al cargar usuarios: $error');
    }
  }

  // Método para agregar un nuevo usuario
  void addUser(String name, int age) {
    // Crear un nuevo usuario
    final newUser = User(id: _users.length.toString(), name: name, age: age);
    _users.add(newUser);
    
    // Notificar a los oyentes que se ha agregado un nuevo usuario
    notifyListeners();
  }
}
