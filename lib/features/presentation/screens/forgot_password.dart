import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
       leading: Back(),
        title: '',
         actions: [Logo()], key: null,
        ),
       
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
                      'Биз өзгөртүү кодун жибердик.',
                      style: AppTextStyle.style5,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Сиздин катталган электрондук почтанызга же \nтелефон номурунузга  өзгөртүү кодун жиберилди.',
                      style: AppTextStyle.style3,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Image.asset('assets/images/codebox.png'),
            SizedBox(height: 30),
            NavigatedButton(onPressed: () {
                  context.push('/change-password');
            }, title: 'Аткарылды'),
             SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset('assets/images/copyright.png'),
                  const SizedBox(width: 5),
                  Text(
                    'МаралАкгул.Бардык укуктар корголгон',
                    style: AppTextStyle.style6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}