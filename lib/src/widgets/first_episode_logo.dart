import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';

class FirstEpisodeLogo extends StatelessWidget {
  const FirstEpisodeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'CryPay',
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: FirstEpisodeSizes.xxLarge,
      ),
    );
  }
}
