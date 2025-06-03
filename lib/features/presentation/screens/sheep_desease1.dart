import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class SheepDesease1 extends StatefulWidget {
  const SheepDesease1.SheepDesease1({super.key});

  @override
  State<SheepDesease1> createState() => _SheepDesease1State();
}

class _SheepDesease1State extends State<SheepDesease1> {
  final List<String> images = [
    'assets/images/lvsdes2.png',
    'assets/images/lvsdes3.png',
    'assets/images/lvsdes4.png',
  ];

  final List<String> titles = ['Дарылоо ', 'Дарылоо ', 'Дарылоо '];

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
        title: 'Дарылоо',
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
                    'assets/images/lvsdes1.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Lorem Ipsum is simply\ndummy text of the'),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
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
                    margin: EdgeInsets.symmetric(vertical: 12),
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
        topRight: Radius.circular(30)),
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
