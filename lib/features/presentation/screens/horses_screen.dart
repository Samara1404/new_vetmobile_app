import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class HorsesScreen extends StatefulWidget {
  const HorsesScreen({super.key});

  @override
  State<HorsesScreen> createState() => _HorsesScreenState();
}

class _HorsesScreenState extends State<HorsesScreen> {
    final List<String> images = [
    'assets/images/lvsicon1.png',
    'assets/images/lvsicon2.png',
    'assets/images/lvsicon3.png',
  ];

  final List<String> titles = ['Тоюттануусу', 'Ооруусу', 'Уруктандыруу'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: CustomAppBar(
      
        title: 'Жылкы',
        leading: const Back(),
        actions: const [Logo()],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(26),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 145,
                  child: Image.asset('assets/images/livesstock2.png'),
                ),
                SizedBox(
                  width: 130,
                  height: 130,
                  child: Image.asset('assets/images/assets/images/mhorse.png'),
                ),
              ],
            ),
            SizedBox(height: 60),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(color: Color.fromRGBO(1, 165, 96, 1)),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Image.asset(images[index], color: Color.fromRGBO(1, 165, 96, 1)),
                          title: Text(titles[index]),
                         
                        ),
                      );
                    },
                  ),
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