import 'package:flutter/material.dart';

//TODO: identify what is the difference between error_page and error_state_screen?
class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      body: Center(
        child: Text("Error", style: TextStyle(color: Colors.red),),
      )
    );
  }
}
