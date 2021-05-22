import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPgae extends StatelessWidget {
  const RootPgae({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return TabPage(snapshot.data);
          } else {
            return LoginPage();
          }
        });
  }
}
