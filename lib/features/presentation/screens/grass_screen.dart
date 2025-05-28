import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class GrassScreen extends StatefulWidget {
  const GrassScreen({super.key});

  @override
  State<GrassScreen> createState() => _GrassScreenState();
}

class _GrassScreenState extends State<GrassScreen> {
  final List<String> images = [
    'assets/images/grass1.png',
    'assets/images/grass2.png',
    'assets/images/grass3.png',
  ];

  final List<String> titles = ['Тоют', 'Тоют', 'Тоют'];

  final List<String> subtitles = [
    'Lorem Ipsum is simply\ndummy text of the',
    'Lorem Ipsum is simply\ndummy text of the',
    'Lorem Ipsum is simply\ndummy text of the',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Back(),
        ),
        title: 'Тоют',
        actions: [Logo()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Тема', style: AppTextStyle.style8),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/greengrass.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Lorem Ipsum is simply\ndummy text of the'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Color.fromRGBO(1, 165, 96, 1)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 22),
                    child: ListTile(
                      leading: Image.asset(images[index]),
                      title: Text(titles[index]),
                      subtitle: Text(subtitles[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(1, 165, 96, 1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/homeicon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/newsicon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/veticon.png'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
