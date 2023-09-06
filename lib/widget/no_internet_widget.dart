import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wifi_off_rounded, size: 40,),
        Text('Oops!', style: Theme.of(context).textTheme.titleLarge,),
        const Text('It seems you are not connected with internet\n'
            'Check your internet and try again',
            textAlign: TextAlign.center),
        OutlinedButton(
            onPressed: () {
              Provider.of<RestaurantProvider>(context, listen: false).refresh();
            },
            child: const Text('Try again'),
        ),
      ],
    );
  }
}
