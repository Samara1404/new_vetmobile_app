import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/features/presentation/screens/last_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/vet_last_screen.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class VetAlert extends StatefulWidget {
  const VetAlert({super.key});

  @override
  State<VetAlert> createState() => _VetAlertState();
}

class _VetAlertState extends State<VetAlert> {
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/vsmalltext.png'),
              SizedBox(height: 20),
              NavigatedButton(
                  onPressed: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LastScreen())));
                  },
                  title: 'Go')
            ],
          ),
        ));
  }
}
