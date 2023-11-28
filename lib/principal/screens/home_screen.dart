import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/user_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Text(
              'Listado de Personal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 183, 58, 58),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Abre una barra de búsqueda (puedes implementar la lógica de búsqueda aquí)
              showSearch(context: context, delegate: UserSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Agrega la lógica de filtrado aquí
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personales inscritos',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                Row(
                  children: [
                    _buildIconButton(Icons.sort, 'Ordenar', () {
                      // Agrega la lógica de ordenación aquí
                      _showSortingOptions(context);
                    }),
                    SizedBox(width: 8),
                    _buildIconButton(Icons.refresh, 'Actualizar', () {
                      // Agrega la lógica de actualización aquí
                      Provider.of<UserProvider>(context, listen: false).loadUsers();
                    }),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _showAddUserDialog(context);
            },
            tooltip: 'Agregar Usuario',
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              // Agrega la lógica de alguna otra acción aquí
              _showCustomActionDialog(context);
            },
            tooltip: 'Otra Acción',
            child: Icon(Icons.star),
            backgroundColor: Colors.orange,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback onPressed) {
    return Tooltip(
      message: label,
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        int age = 0;

        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.person_add),
              SizedBox(width: 8),
              Text(
                'Agregar Nuevo Pesonal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa el nombre',
                  icon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Edad',
                  hintText: 'Ingresa la edad',
                  icon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).addUser(name, age);
                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 3,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSortingOptions(BuildContext context) {
    // Implementa el diálogo de opciones de ordenación aquí
    // Puedes usar un AlertDialog o BottomSheet según tus preferencias
  }

  void _showFilterOptions(BuildContext context) {
    // Implementa el diálogo de opciones de filtrado aquí
    // Puedes usar un AlertDialog o BottomSheet según tus preferencias
  }

  void _showCustomActionDialog(BuildContext context) {
    // Agrega la lógica de alguna otra acción personalizada aquí
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Acción Personalizada',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('Aquí puedes agregar tu propia acción especial.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
  
}

class UserSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implementa la lógica de búsqueda y muestra los resultados
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Muestra sugerencias mientras escribes en la barra de búsqueda
    return Container();
  }
}
