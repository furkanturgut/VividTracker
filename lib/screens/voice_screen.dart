import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_navi.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Ses ekrani"),
        ),
        bottomNavigationBar: BottomNavi());
  }
}
