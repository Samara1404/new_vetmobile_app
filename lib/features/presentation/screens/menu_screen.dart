import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/features/presentation/screens/news_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/vet_screen.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> images = [
    'assets/images/about.png',
    'assets/images/grass.png',
    'assets/images/fertilization.png',
    'assets/images/desease.png',
    'assets/images/livestock.png',
    'assets/images/sheep.png',
    'assets/images/horses.png',
    'assets/images/hens.png',
  ];

  final List<String> routes = [
    '/about',
    '/grass',
    '/fertilization',
    '/disease',
    '/livestock',
    '/sheep',
    '/horses',
    '/hens',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Меню',
        leading: const Back(),
        actions: const [Logo()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(routes[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(1, 165, 96, 1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/homeicon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => NewsScreen())));
              }, icon: Image.asset('assets/images/newsicon.png'),),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => VetScreen())));
              }, icon: Image.asset('assets/images/veticon.png'),),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int p1) {}
}
