import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationEmailSentPage extends ConsumerWidget {
  const ConfirmationEmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: FirstEpisodeSizes.large),
                Container(
                  width: width * 0.3,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(FirstEpisodeSizes.medium),
                  decoration: const BoxDecoration(
                    color: FirstEpisodeColors.lightPurple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(FirstEpisodeSizes.medium),
                    ),
                  ),
                  child: const Icon(
                    Icons.email_outlined,
                    color: FirstEpisodeColors.purple,
                    size: FirstEpisodeSizes.xxxLarge,
                  ),
                ),
                Text(
                  'Confirm your email',
                  style: textTheme.bodyLarge.bold?.copyWith(
                    color: FirstEpisodeColors.black,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.6,
                  child: Text(
                    'We have sent a verification email to your email address.',
                    style: textTheme.bodySmall?.copyWith(
                      color: FirstEpisodeColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: FirstEpisodeSizes.medium),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.7, 50),
                  ),
                  onPressed: () {},
                  child: const Text('Open Email App'),
                ),
                FirstEpisodeClickableText(
                  text: 'Verify later',
                  textStyle: textTheme.bodySmall.bold?.copyWith(
                    color: FirstEpisodeColors.grey80,
                  ),
                  onPressed: () {},
                ),
              ],
            ).separatedBy(FirstEpisodeSizes.medium),
          );
        },
      ),
    );
  }
}
