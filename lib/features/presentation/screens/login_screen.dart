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

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: Back(),
          title: '',
          actions: [Logo()],
          key: null,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              // Ийгиликтүү кирүүдөн кийин кийинки экранга өтүү
              context.push('/menu'); // Мисалы, меню экранына өтүү
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Кирүү ийгиликтүү! User ID: ${state.userId}')),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ката: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Сиздин номериңиз', style: AppTextStyle.style3),
                      ),
                    ),
                    CustomTextField(
                      controller: _phoneController,
                      prefixIcon: Image.asset('assets/images/phone.png'),
                      hintText: '996224051404',
                      trailing: null,
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
                      controller: _passwordController,
                      prefixIcon: Image.asset('assets/images/visible.png'),
                      hintText: '************',
                      trailing: null,
                      obscureText: true, // Сырсөздү жашыруу үчүн
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
                    NavigatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                _phoneController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                      title: 'Кирүү',
                    ),
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
                    SizedBox(height: 20),
                    GoogleButton(),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/copyright.png')),
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
