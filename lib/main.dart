import 'package:demo/screens/car_form/form_provider.dart';
import 'package:demo/screens/dashboard/dashboard_provider.dart';
import 'package:demo/screens/dashboard/dashboard_vu.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'screens/login/login_provider.dart';
import 'screens/signup/signup_provider.dart';
import 'screens/signup/signup_vu.dart';
import 'session/user_session.dart';

void main() async {
  //    Checking user session...

  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getExternalStorageDirectory();
  final filePath = '${directory!.path}/';
  var val = await UserSession().initialize(filePath);
  var session = await UserSession().getSession();
  if (session == null) {
    runApp(const GoToSignUp()); // if No Session is stored...
  } else {
    runApp(const GoToDashBoard()); // if Session is stored...
  }
}

class GoToSignUp extends StatelessWidget {
  const GoToSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Login()),
        ChangeNotifierProvider(create: (context) => SignUp()),
        ChangeNotifierProvider(create: (context) => DashBoard()),
        ChangeNotifierProvider(create: (context) => CarForm(null))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpScreen(),
      ),
    );
  }
}

class GoToDashBoard extends StatelessWidget {
  const GoToDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Login()),
        ChangeNotifierProvider(create: (context) => SignUp()),
        ChangeNotifierProvider(create: (context) => DashBoard()),
        ChangeNotifierProvider(create: (context) => CarForm(null))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashBoardScreen(),
      ),
    );
  }
}
