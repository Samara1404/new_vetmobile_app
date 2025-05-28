import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class SheepScreen extends StatefulWidget {
  const SheepScreen({super.key});

  @override
  State<SheepScreen> createState() => _SheepScreenState();
}

class _SheepScreenState extends State<SheepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Кой эчкилер',
      leading: Back(),
      actions: [Logo()],
      ),
    );
  }
}