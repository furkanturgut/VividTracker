import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_navi.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("arama ekrani"),
        ),
        bottomNavigationBar: BottomNavi());
  }
}
