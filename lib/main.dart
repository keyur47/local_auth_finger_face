import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth_finger_face/moduels/login_screen.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          // initialRoute: Routes.home,
          // getPages: Routes.route,
        );
      },
    );
  }
}
