import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';

class HorsesScreen extends StatefulWidget {
  const HorsesScreen({super.key});

  @override
  State<HorsesScreen> createState() => _HorsesScreenState();
}

class _HorsesScreenState extends State<HorsesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Жылкы'),
    );
  }
}