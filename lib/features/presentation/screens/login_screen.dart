import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_text_field.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/google_button.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
 
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(leading: Back(), title: '', actions: [Logo()], key: null,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text('Өткөрүп жиберүү', style: AppTextStyle.style4),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Сиздин номериңиз', style: AppTextStyle.style3),
              ),
            ),
            CustomTextField(
              prefixIcon: Image.asset('assets/images/phone.png'),
              hintText: '996224051404',
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Сыр сөз', style: AppTextStyle.style3),
              ),
            ),
            CustomTextField(
              prefixIcon: Image.asset('assets/images/visible.png'),
              hintText: '************',
            ),
              Padding(
              padding: const EdgeInsets.only(top: 8, right: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => context.push('/forgot-password'),
                  child: Text(
                    'Сыр сөзду унуттуңузбу?',

                    style: AppTextStyle.style4,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            NavigatedButton(onPressed: () {}, title: 'Кирүү'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Аккаунтуңуз жокпу?'),
                Text.rich(
                  TextSpan(
                    text: ' Ушул ',
                    children: [
                      TextSpan(
                        text: 'жерден',
                        style: const TextStyle(
                          color: Color.fromRGBO(1, 165, 96, 1),
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                context.push('/forgot-pass');
                              },
                      ),
                      const TextSpan(text: ' катталыңыз'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(1, 165, 96, 1),
                    indent: 40,
                    endIndent: 10,
                  ),
                ),
                Text('Же', style: AppTextStyle.style6),
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(1, 165, 96, 1),
                    indent: 10,
                    endIndent: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GoogleButton(
              
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Image.asset('assets/images/copyright.png')),

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
