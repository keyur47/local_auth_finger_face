import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_finger_face/widget/snackbar.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;

    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();

    //check if user has enabled biometrics.
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Scan your fingerprint/face to authenticate',
            options: const AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true));
      } on PlatformException catch (e) {
        getSnackBar('Something went wrong!!', 'Please try again');
        log("----AuthService Class---->${e.toString()}");
      }
    } else if (isBiometricSupported == false) {
      log("----BIO NOT AVAILABLE----");
      getSnackBar('Ooops!!!', 'Your device does not support BioMetrics!');
    } else if (canCheckBiometrics == false) {
      log("----BIO NOT SETTTTTT----");
      getSnackBar('Ooops!!!', 'You need to set BioMetrics first!');
    }
    return isAuthenticated;
  }
}
