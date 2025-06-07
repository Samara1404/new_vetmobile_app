import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/text_field_edit.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/text_field_name.dart';

class UserAccountEdit extends StatefulWidget {
  const UserAccountEdit({super.key});

  @override
  State<UserAccountEdit> createState() => _UserAccountEditState();
}

class _UserAccountEditState extends State<UserAccountEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: Back(),
        title: 'Профилди ондоо',
        actions: [Logo()], key: null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/useraccount.png'),
              ),
            ),
            SizedBox(height: 20),
            Text('Алымканов Марсбек Турсуналиевич', style: AppTextStyle.style8),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text('Толук аты', style: AppTextStyle.style3),
            ),
            TextFieldName(hintText: 'Алымканов Марсбек '),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text('Тулган датасы', style: AppTextStyle.style3),
            ),
            TextFieldEdit(
              suffixIcon: Image.asset('assets/images/notes.png'),
              hintText: '4 май, 1976',
            ),
            SizedBox(height: 30),
            Center(
              child: NavigatedButton(
                onPressed: () {
                  context.push('/menu');
                },
                title: 'Сактоо',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
