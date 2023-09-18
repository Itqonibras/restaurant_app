import 'package:flutter/material.dart';

class CustomCardMedium extends StatelessWidget {
  final String text;

  const CustomCardMedium({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 160,
                  color: const Color(0xFFE7E7E7),
                  child: Image.asset(
                    'assets/images/foodanddrink.png',
                    scale: 5,
                    color: const Color(0xFFCECECE),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 40,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
