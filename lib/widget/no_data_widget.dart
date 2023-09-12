import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No restaurant found', style: Theme.of(context).textTheme.titleLarge,),
        const Text('Try different keyword',
            textAlign: TextAlign.center),
      ],
    );
  }
}
