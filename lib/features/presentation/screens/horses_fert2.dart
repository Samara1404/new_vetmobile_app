import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class HorsesFert2 extends StatefulWidget {
  const HorsesFert2({super.key});

  @override
  State<HorsesFert2> createState() => _HorsesFert2State();
}

class _HorsesFert2State extends State<HorsesFert2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Уруктандыруу ',
        leading: const Back(),
        actions: const [Logo()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('Тема', style: AppTextStyle.style8),
              ),
              SizedBox(height: 16),
              Container(
                child:
                    Image.asset('assets/images/horsesfert2.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 24),
              Image.asset('assets/images/lvstext2.png'),
              Padding(padding: EdgeInsetsGeometry.all(20),
              child: Column(
                children: [
                  Align(
                alignment: Alignment.topLeft,
                child: Text('Тема', style: AppTextStyle.style8),
              ),
              SizedBox(height: 16),
              Container(
                child:
                    Image.asset('assets/images/grasslast.png', fit: BoxFit.cover),
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
