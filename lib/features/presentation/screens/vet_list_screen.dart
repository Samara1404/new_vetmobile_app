import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/screens/last_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/news_text.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_text_field.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class VetListScreen extends StatefulWidget {
  const VetListScreen({super.key});

  @override
  State<VetListScreen> createState() => _VetListScreenState();
}

class _VetListScreenState extends State<VetListScreen> {
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
        title: 'Ветеринар',
        actions: [Logo()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  Text('Ветеринарга билдирүү таштоо', style: AppTextStyle.style5),
                  SizedBox(height: 10),
                  CustomTextField(
                    prefixIcon: Image.asset('assets/images/person.png'),
                    hintText: 'Аты жөнү',
                    trailing: Image.asset('assets/images/check.png'),
                  ),
                  CustomTextField(
                    prefixIcon: Image.asset('assets/images/phone.png'),
                    hintText: 'Телефон номуруңуз',
                    trailing: Image.asset('assets/images/false.png'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 180,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/pencil.png'),
                            SizedBox(width: 10),
                            Text(
                              'Text',
                              style: AppTextStyle.style3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Center(
                child: NavigatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LastScreen())));
                    },
                    title: 'Жиберүү'),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(                  
                          color: Color.fromRGBO(1, 165, 96, 1),
                        ),
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30)),
                      onPressed: () {},
                      label: Text(
                        'Сүрөт жүктөө',
                        style: AppTextStyle.style3,
                      ),
                      icon: Image.asset('assets/images/camera.png'),
                    ),
                    SizedBox(width: 10),
                      ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(                  
                          color: Color.fromRGBO(1, 165, 96, 1),
                        ),
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30)),
                      onPressed: () {},
                      label: Text(
                        'Баасы',
                        style: AppTextStyle.style3,
                      ),
                      icon: Image.asset('assets/images/price.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
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
