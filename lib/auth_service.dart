import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_home/authentication/sign_in.dart';
import 'package:next_home/authentication/sign_up.dart';
import 'package:next_home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, prefsSnapshot) {
              if (!prefsSnapshot.hasData) {
                return const SizedBox(); // loading state
              }
              final user = FirebaseAuth.instance.currentUser;
              final prefs = prefsSnapshot.data!;
              final storedName = prefs.getString("name") ?? "Guest";
              final String num = user?.phoneNumber ?? "";

              return HomeScreen(name: storedName, num: num);
            },
          );
        } else {
          return SignIn();
        }
      },
    );
  }

  // signInWithGoogle(BuildContext ctx) async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser =
  //   await GoogleSignIn(scopes: <String>["email"]).signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser!.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>
  //       Navigator.of(ctx)
  //           .push(MaterialPageRoute(builder: (_) => HomeScreen())));
  // }

  //Sign out43
  signOut(BuildContext ctx) {
    FirebaseAuth.instance.signOut();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  SignIn()),
            (route) => false);
  }
}