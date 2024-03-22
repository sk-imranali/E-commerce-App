import 'package:ecommerce/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  if (kIsWeb) {
    await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCMJE10bORdxL1Tmp1ZjvqmpasIqODMpkE",
      appId: "1:441322940715:web:93baf7d070380cc22b3d6e",
      messagingSenderId: "441322940715",
      projectId: "e-commarce-acca7",
    ),
    );
  }
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
