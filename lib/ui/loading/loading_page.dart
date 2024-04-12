import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = Provider.of<DarkThemeProvider>(context).darkTheme;
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(
         // backgroundColor: isDarkMode ? kBlueMainDark : kWhite,
        ),
      ),
    );
  }
}
