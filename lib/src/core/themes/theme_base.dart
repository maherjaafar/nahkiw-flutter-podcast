import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildThemeBase(Brightness brightness) {
  final baseTheme = ThemeData(brightness: brightness);
  final textTheme = GoogleFonts.poppinsTextTheme(baseTheme.textTheme);
  return baseTheme.copyWith(
    textTheme: textTheme,
    inputDecorationTheme: _buildInputDecorationTheme(textTheme),
  );
}

InputDecorationTheme _buildInputDecorationTheme(
  TextTheme textTheme,
) {
  final textStyle = textTheme.bodyLarge.bold;
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: FirstEpisodeBorder.defaultRadius,
    ),
    contentPadding: const EdgeInsets.all(FirstEpisodeSizes.medium),
    fillColor: FirstEpisodeColors.lightBlue,
    filled: true,
    hintStyle: textStyle?.copyWith(
      color: FirstEpisodeColors.grey,
    ),
    errorStyle: textStyle?.copyWith(
      color: FirstEpisodeColors.grey80,
    ),
  );
}
