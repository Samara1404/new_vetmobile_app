
import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: Back(),
        title: 'Биз жөнүндө',
        actions: [Logo()],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset('assets/images/abouttext.png'),
          ),
      ),
    );
  }
}