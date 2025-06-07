import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/screens/news_text.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<String> images = [
    'assets/images/beautiful1.png',
    'assets/images/beautiful2.png',
    'assets/images/beautiful3.png',
  ];

  final List<String> titles = ['Тоют', 'Тоют', 'Тоют'];

  final List<String> subtitles = [
    'Lorem Ipsum is simply\ndummy text of the',
    'Lorem Ipsum is simply\ndummy text of the',
    'Lorem Ipsum is simply\ndummy text of the',
  ];
  final List<Widget> pages = [
    const NewsText(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Back(),
        ),
        title: 'Жанылыктар',
        actions: [Logo()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Тема', style: AppTextStyle.style8),
              ),
            ),
            Image.asset('assets/images/btftext1.png'),
            SizedBox(height: 16),
            Column(
              children: [
                Image.asset(
                  'assets/images/beautiful.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
              ],
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
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: ListTile(
                        leading: Image.asset(images[index]),
                        title: Text(titles[index]),
                        subtitle: Text(subtitles[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pages[index]),
                          );
                        }),
                  );
                },
              ),
            ),
          ],
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
              icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => NewsText())));
                },
                icon: Image.asset('assets/images/newsicon.png'),
              ),
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
