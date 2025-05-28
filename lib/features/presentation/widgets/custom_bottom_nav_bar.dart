import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<String> icons = [
    'assets/images/homeicon.png',
    'assets/images/newsicon.png',
    'assets/images/veticon.png',
  ];
int selectedIndex = 0;

void onItemTapped(int index) {
  setState(() {
    selectedIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(1, 165, 96, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            bool isSelected = widget.selectedIndex == index;
            return GestureDetector(
              onTap: () => widget.onItemTapped(index),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: isSelected
                    ? const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      )
                    : null,
                child: Image.asset(
                  icons[index],
                 
                  height: 36,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}