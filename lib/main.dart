import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:dama/routes/app_router.dart';
import 'package:dama/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp( MyApp(sharedPreferences: sharedPreferences,));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late AppService appService;

  @override
  void initState() {
    appService = AppService(widget.sharedPreferences);
    super.initState();
  }

  void onStartUp() async {
    await appService.onAppStart();
  }

  void onAuthStateChange(bool login) {
    appService.loginState = login;
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<AppService>(create: (_) => appService),
        Provider<AppRouter>(create: (_) => AppRouter(appService)),
      ],
      child: ProgressHud(
        isGlobalHud: true,
        child: Builder(
          builder: (context) {
            final GoRouter goRouter =
                Provider.of<AppRouter>(context, listen: false).router;

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Dama',
              routerConfig: goRouter,
            );
          }
        ),
      ),
    );
  }
}
