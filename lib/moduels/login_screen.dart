import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth_finger_face/auth_service.dart';
import 'package:local_auth_finger_face/moduels/private_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: const Text('Local Authentication Example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.lock, size: size.width * 0.3),
              const SizedBox(height: 20),
              const Text(
                  'Tap on the button to authenticate with the device\'s local authentication system.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: size.width,
                child: TextButton(
                  onPressed: () async {
                    bool isAuthenticated = await AuthService.authenticateUser();
                    if (isAuthenticated) {
                      Get.to(() => const PrivateScreen());
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.blue,
                    shadowColor: const Color(0xFF323247),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'LOGIN WITH BIOMETRICS',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
