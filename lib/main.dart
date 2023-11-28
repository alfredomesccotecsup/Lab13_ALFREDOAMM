import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'principal/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Provider Example',
        theme: _buildThemeData(),
        home: HomeScreen(),
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      primaryColor: Colors.indigo, // Cambiado a un tono más oscuro
      colorScheme: _buildColorScheme(),
      fontFamily: 'Roboto',
      textTheme: _buildTextTheme(),
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
    );
  }

  ColorScheme _buildColorScheme() {
    return ColorScheme.fromSwatch(
      primarySwatch: Colors.indigo, // Cambiado para coincidir con el color primario
      accentColor: Colors.amber,
      brightness: Brightness.light,
    );
  }

  TextTheme _buildTextTheme() {
    return TextTheme(
      headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
      subtitle1: TextStyle(fontSize: 16, color: Colors.black54),
      bodyText1: TextStyle(fontSize: 18, color: Colors.grey[800]), // Cambiado a gris oscuro
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.indigo, // Cambiado a un tono más oscuro
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber, // Botón de color ámbar
        onPrimary: Colors.black, // Texto en color negro
        elevation: 3, // Sutil sombra
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.amber, width: 2.0),
      ),
      labelStyle: TextStyle(color: Colors.indigo), // Color de la etiqueta
    );
  }
}
