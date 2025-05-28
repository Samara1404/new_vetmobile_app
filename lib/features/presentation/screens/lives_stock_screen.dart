import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class LivesStockScreen extends StatefulWidget {
  const LivesStockScreen({super.key});

  @override
  State<LivesStockScreen> createState() => _LivesStockScreenState();
}

class _LivesStockScreenState extends State<LivesStockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Бодо мал ',
      leading: Back(),
      actions: [Logo()],
      ),
      
    
    );
  }
}