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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../../bloc/auth/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();
  bool showCodeField = false; 
  String? verificationId; 

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  
  // Future<void> _signInWithPhone(String phoneNumber) async {
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber, 
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //         context.read<AuthBloc>().add(AuthSuccessEvent(FirebaseAuth.instance.currentUser?.uid));
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         context.read<AuthBloc>().add(AuthFailureEvent('Ырастоо ишке ашкан жок: ${e.message}'));
  //       },
  //       codeSent: (String verId, int? resendToken) {
  //         setState(() {
  //           verificationId = verId;
  //           showCodeField = true; 
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verId) {
  //         verificationId = verId;
  //       },
  //     );
  //   } catch (e) {
  //     context.read<AuthBloc>().add(AuthFailureEvent('Ката: $e'));
  //   }
  // }

  
  // Future<void> _verifyCode(String smsCode) async {
  //   if (verificationId == null) return;
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId!,
  //       smsCode: smsCode,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     context.read<AuthBloc>().add(AuthSuccessEvent(FirebaseAuth.instance.currentUser?.uid));
  //   } catch (e) {
  //     context.read<AuthBloc>().add(AuthFailureEvent('Код ырастоодо ката: $e'));
  //   }
  // }

  
  Future<bool> _checkPassword(String phoneNumber, String password) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$phoneNumber");
    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
      return userData['password'] == password;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: const Back(),
          title: '',
          actions: const [Logo()],
          key: null,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.push('/menu');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Кирүү ийгиликтүү! User ID: ${state.userId ?? "Unknown"}')),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ката: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Padding(
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
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Сиздин номериңиз', style: AppTextStyle.style3),
                      ),
                    ),
                    CustomTextField(
                      controller: _phoneController,
                      prefixIcon: Image.asset('assets/images/phone.png'),
                      hintText: '+996224051404',
                      trailing: null,
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Сыр сөз', style: AppTextStyle.style3),
                      ),
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      prefixIcon: Image.asset('assets/images/visible.png'),
                      hintText: '********',
                      trailing: null,
                      obscureText: true,
                    ),
                    // SMS код талаасы (динамикалык)
                    if (showCodeField) ...[
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('SMS код', style: AppTextStyle.style3),
                        ),
                      ),
                      CustomTextField(
                        controller: _codeController,
                        prefixIcon: const Icon(Icons.sms),
                        hintText: 'Кодду киргизиңиз',
                        trailing: null,
                        keyboardType: TextInputType.number,
                      ),
                    ],
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
                    const SizedBox(height: 8),
                    NavigatedButton(
                      onPressed: () async {
                        if (_phoneController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                          // Сырсөздү текшерүү
                          bool isPasswordCorrect = await _checkPassword(
                            _phoneController.text,
                            _passwordController.text,
                          );
                          if (!isPasswordCorrect) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Сыр сөз туура эмес!')),
                            );
                            return;
                          }

                          // SMS ырастоо жөнөтүү
                          // if (!showCodeField) {
                          //   _signInWithPhone(_phoneController.text);
                          // } else {
                          //   // SMS кодду ырастоо
                          //   _verifyCode(_codeController.text);
                          // }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Телефон номери жана сыр сөз толтуруңуз!')),
                          );
                        }
                      },
                      title: showCodeField ? 'Ырастоо' : 'Кирүү',
                    ),
                    const SizedBox(height: 20),
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
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push('/register');
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
                    const SizedBox(height: 20),
                    GoogleButton(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/copyright.png'),
                          ),
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
          },
        ),
      ),
    );
  }
}