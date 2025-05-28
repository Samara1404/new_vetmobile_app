import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_text_field.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(leading: Back(), title: '', actions: [Logo()], key: null,),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, right: 15),

              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Сураныч жаңы код жазыңыз.',
                      style: AppTextStyle.style5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
              prefixIcon: Image.asset('assets/images/lock.png'),
              hintText: 'Жаңы код',
            ),
            SizedBox(height: 6),
            CustomTextField(
              prefixIcon: Image.asset('assets/images/lock.png'),
              hintText: 'Жаңы кодду кайталаңыз',
            ),
            SizedBox(height: 10),
            NavigatedButton(onPressed: () {
              context.push('/user');
            }, title: 'Сыр сөздү алмаштыруу'),
          ],
        ),
      ),
    );
  }
}