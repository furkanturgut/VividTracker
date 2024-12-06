import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SizedBox.expand(
        child: Container(
          // width: double.infinity,
          child: Column(
            children: [
              // Logo bölümü
              Expanded(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/designer.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Yükleme ikonu
              InkWell(
                onTap: () => context.go("/home"),
                child: SizedBox(
                  width: 200,
                  child: DotLottieLoader.fromAsset(
                      "assets/motions/loading.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  }),
                ),
              ),

              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
