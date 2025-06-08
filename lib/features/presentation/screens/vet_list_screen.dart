import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';
import 'package:new_vetmobile_app/features/presentation/screens/news_text.dart';
import 'package:new_vetmobile_app/features/presentation/screens/vet_alert.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/back.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/custom_text_field.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/logo.dart';
import 'package:new_vetmobile_app/features/presentation/widgets/navigated_button.dart';

class VetListScreen extends StatefulWidget {
  const VetListScreen({super.key});

  @override
  State<VetListScreen> createState() => _VetListScreenState();
}

class _VetListScreenState extends State<VetListScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isTextEmpty = true; 

  @override
  void initState() {
    super.initState();
    
    _controller.addListener(() {
      setState(() {
        isTextEmpty = _controller.text.isEmpty; 
      });
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Ветеринарга билдирүү таштоо', style: AppTextStyle.style5),
              SizedBox(height: 10),
              CustomTextField(
                prefixIcon: Image.asset('assets/images/person.png'),
                hintText: 'Аты жөнү',
                trailing: Image.asset('assets/images/check.png'),
              ),
              CustomTextField(
                prefixIcon: Image.asset('assets/images/phone.png'),
                hintText: 'Телефон номуруңуз',
                trailing: Image.asset('assets/images/false.png'),
              ),
              SizedBox(height: 20),
            Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextField(
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  isTextEmpty = text.isEmpty;
                });
              },
              decoration: InputDecoration(
                
                hintText: "Text",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
                prefixIcon: isTextEmpty ? Icon(Icons.edit, color: Colors.grey) : null,
              ),
            ),
          ),
        ),
             
              SizedBox(height: 6),
              Center(
                child: NavigatedButton(
                  onPressed: () {
                    String message = _controller.text;
                    if (message.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VetAlert()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Билдирүүнү киргизиңиз')),
                      );
                    }
                  },
                  title: 'Жиберүү',
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color.fromRGBO(1, 165, 96, 1)),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Сүрөт жүктөө',
                        style: AppTextStyle.style3,
                      ),
                      icon: Image.asset('assets/images/camera.png'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color.fromRGBO(1, 165, 96, 1)),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Баасы',
                        style: AppTextStyle.style3,
                      ),
                      icon: Image.asset('assets/images/price.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(1, 165, 96, 1),
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsText()),
              );
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/homeicon.png'),
              label: 'Үй',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/newsicon.png'),
              label: 'Жаңылыктар',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/veticon.png'),
              label: 'Ветеринар',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Контроллерди жабуу
    super.dispose();
  }
}