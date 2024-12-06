import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_navi.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Profil ekrani"),
        ),
        bottomNavigationBar: BottomNavi());
  }
}
