import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class VetLastScreen extends StatefulWidget {
  const VetLastScreen({super.key});

  @override
  State<VetLastScreen> createState() => _VetLastScreenState();
}

class _VetLastScreenState extends State<VetLastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Back(),
        ),
        title: 'Ветеринар',
        actions: [Logo()],
      ),
      body: Center(
        child: Container(
          child: Image.asset('assets/images/vlasttext.png'),
        ),
      ),
    );
  }
}
