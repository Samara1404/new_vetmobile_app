import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      Text('Кош келдиңиз!', style: AppTextStyle.style1),
                      Text(
                        'Мал жандыгыңызды\nасыроону биз менен\nбаштаңыз.',
                        style: AppTextStyle.style2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              NavigatedButton(
                onPressed: () {
                  context.push('/login');
                },
                title: 'Баштоо',
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/images/mainpic.png',
                fit: BoxFit.contain,
                width: double.infinity,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}