import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.users.isEmpty) {
      return Center(
        child: Text(
          'No hay personales cargados ahun, agrega para poder visualizarlos',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        final user = userProvider.users[index];
        return _buildUserListItem(context, user);
      },
    );
  }

  Widget _buildUserListItem(BuildContext context, user) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            user.name.substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'Edad: ${user.age}',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildReactionIcon(Icons.thumb_up, Colors.blue),
            SizedBox(width: 8),
            _buildReactionIcon(Icons.favorite, Colors.red),
            SizedBox(width: 8),
            _buildReactionIcon(Icons.sentiment_satisfied, Colors.green),
            SizedBox(width: 8),
            _buildReactionIcon(Icons.sentiment_dissatisfied, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildReactionIcon(IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Agregar la lógica para manejar la reacción del usuario
      },
      child: Icon(
        icon,
        size: 24,
        color: color,
      ),
    );
  }
}
