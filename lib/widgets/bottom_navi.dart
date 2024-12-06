import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavi extends StatelessWidget {
  const BottomNavi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F7),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Ana Sayfa Butonu
          IconButton(
            icon: const Icon(CupertinoIcons.home),
            iconSize: 24,
            color: Colors.black,
            onPressed: () {
              context.go('/home');
            },
          ),
          // Keşfet Butonu
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            iconSize: 24,
            color: Colors.black,
            onPressed: () {
              context.go('/search');
            },
          ),
          // Profil Butonu
          IconButton(
            icon: const Icon(CupertinoIcons.person),
            iconSize: 24,
            color: Colors.black,
            onPressed: () {
              context.go('/profile');
            },
          ),
        ],
      ),
    ); // Noktalı virgül eklendi
  }
}
