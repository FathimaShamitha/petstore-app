import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utilities/apptheme.dart';
import 'package:provider/provider.dart';

import 'admin/controller/adddetailscontroller.dart';
import 'admin/controller/imagecontroller.dart';
import 'home/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageUpload()),
        ChangeNotifierProvider(create: (context) => AddDetails()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        home: SplashScreenClass(),
      ),
    );
  }
}
