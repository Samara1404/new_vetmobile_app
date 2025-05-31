import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/screens/flash_screen.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/error.png'),
        SizedBox(height: 40),
        Text('Sorry!', style: AppTextStyle.style9),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'The page you are looking for doesn’t exist or another  error occered',
            style: AppTextStyle.style8,
          ),
        ),
        SizedBox(height: 40),
        NavigatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FlashScreen())));
            },
            title: 'Go back')
      ],
    ));
  }
}
