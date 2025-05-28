import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class HensScreen extends StatefulWidget {
  const HensScreen({super.key});

  @override
  State<HensScreen> createState() => _HensScreenState();
}

class _HensScreenState extends State<HensScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Тоок',
      leading: Back(),
      actions: [Logo()],
      ),
    );
  }
}
