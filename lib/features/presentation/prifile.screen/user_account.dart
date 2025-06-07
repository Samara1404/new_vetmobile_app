import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final List<String> images = [
    'assets/images/email.png',
    'assets/images/icon.png',
    'assets/images/settings.png',
  ];

  final List<String> titles = ['alimkang@mail.com', '0707000000', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: Back(),
        title: 'Колдонуучу',
        actions: [Logo()], key: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/useraccount.png'),
              ),
            ),
            SizedBox(height: 10),
            Text('Алымканов Марсбек Турсуналиевич', style: AppTextStyle.style8),
            Center(child: Text('46 жаш', style: AppTextStyle.style8)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset(images[index]),
                        title: Text(titles[index]),
                        trailing: IconButton(onPressed: () {
                          context.push('/user-account');
                        }, icon: Icon(Icons.arrow_forward_ios),),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 312,

              child: Image.asset('assets/images/elipse.png', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
