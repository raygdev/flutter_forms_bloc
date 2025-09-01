import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({ super.key });
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Bloc Login',
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}