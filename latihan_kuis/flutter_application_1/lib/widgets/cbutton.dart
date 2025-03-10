
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 96, 79, 147),
        ),
        onPressed: onPressed,
        child: Text(text, 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
