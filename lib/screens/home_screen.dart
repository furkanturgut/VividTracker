import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_app/widgets/bottom_navi.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),

      // AppBar
      appBar: AppBar(
        title: const Text('Vivid Tracker'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              color: const Color(0xFFF5F5F7),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Color(0xFF9D4EDD),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Color(0xFF9D4EDD),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              iconColor: Color(0xFF9D4EDD),
              textColor: Colors.black,
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                context.go("/home");
              },
            ),
            ListTile(
              iconColor: Color(0xFF9D4EDD),
              textColor: Colors.black,
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profile'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              iconColor: Color(0xFF9D4EDD),
              textColor: Colors.black,
              leading: const Icon(CupertinoIcons.search),
              title: const Text('History'),
              onTap: () {
                context.go("/search");
              },
            ),
            ListTile(
              iconColor: Color(0xFF9D4EDD),
              textColor: Colors.black,
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Takvim widget'ı
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color(0xFF9D4EDD),
                selectedTextColor: Colors.white,
                height: 88,
                width: 60,
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),

            // Seçilen Tarihi Göster
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Seçilen Tarih: ${_selectedDate.toLocal()}".split(' ')[0],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Hedef eklemek için buton ve Lottie animasyonu
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF9D4EDD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // DotLottieLoader ile animasyon
                  SizedBox(
                    height: 40, // Animasyonun yüksekliğini sınırlayın
                    width: 40, // Animasyonun genişliğini sınırlayın
                    child: DotLottieLoader.fromAsset(
                      "assets/motions/create_task.lottie", // Lottie dosyanızın yolu
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                        if (dotlottie != null) {
                          return Lottie.memory(
                              dotlottie.animations.values.single);
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Buton
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Şeffaf buton arka planı
                      shadowColor: Colors.transparent, // Gölgeyi kaldır
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Create Task',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Özel Alt Navigasyon Çubuğu
      bottomNavigationBar: BottomNavi(),
    );
  }
}
