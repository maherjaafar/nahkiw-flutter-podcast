import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

class ConfirmationEmailSentPage extends StatelessWidget {
  const ConfirmationEmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {
                    // Android: Will open mail app or show native picker.
                    // iOS: Will open mail app if single mail app found.
                    var result = await OpenMailApp.openMailApp();

                    // If no mail apps found, show error
                    if (!result.didOpen && !result.canOpen) {
                      showNoMailAppsDialog(context);

                      // iOS: if multiple mail apps found, show dialog to select.
                      // There is no native intent/default app system in iOS so
                      // you have to do it yourself.
                    } else if (!result.didOpen && result.canOpen) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return MailAppPickerDialog(
                            mailApps: result.options,
                          );
                        },
                      );
                    }
                  },
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

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
