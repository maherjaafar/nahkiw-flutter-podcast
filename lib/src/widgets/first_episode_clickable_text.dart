import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';

class FirstEpisodeClickableText extends StatelessWidget {
  const FirstEpisodeClickableText({
    Key? key,
    required this.text,
    required this.onPressed,
    this.secondaryText,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final String? secondaryText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        context.textTheme.bodyLarge.bold?.copyWith(
          color: FirstEpisodeColors.grey,
        );
    return TextButton(
      onPressed: onPressed,
      child: secondaryText == null
          ? Text(text, style: style)
          : RichText(
              text: TextSpan(
                style: style?.copyWith(
                  color: FirstEpisodeColors.grey,
                ),
                text: text,
                children: [
                  TextSpan(
                    text: ' $secondaryText',
                    style: style?.copyWith(
                      color: FirstEpisodeColors.purple,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
