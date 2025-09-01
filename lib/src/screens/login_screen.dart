import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          buttonElement(bloc)
        ],
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, asyncSnapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: asyncSnapshot.error?.toString()
          ),
        );
      }
    );
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, asyncSnapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'your password',
            labelText: 'Enter Password',
            errorText: asyncSnapshot.error?.toString()
          ),
        );
      }
    );
  }

  buttonElement(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, asyncSnapshot) {
        final bool isValid = asyncSnapshot.hasData && asyncSnapshot.data == true;
        return ElevatedButton(
          onPressed: isValid ? bloc.submit : null,
          child: Text('Submit'),
        );
      }
    );
  }
}