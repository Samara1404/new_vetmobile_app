import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class HensFert2 extends StatefulWidget {
  const HensFert2({super.key});

  @override
  State<HensFert2> createState() => _HensFert2State();
}

class _HensFert2State extends State<HensFert2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Тоют ',
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
                    Image.asset('assets/images/ncorn.png', fit: BoxFit.cover),
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
