import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  void Function()? onTap;
  SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: Color.fromARGB(255, 180, 178, 178)),
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 217, 216, 216),
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
