import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';

class AuthenticationPageBase extends StatelessWidget {
  const AuthenticationPageBase({
    Key? key,
    required this.body,
    required this.primaryAction,
    required this.secondaryAction,
  }) : super(key: key);

  final Widget body;
  final AuthActionItem primaryAction;
  final AuthActionItem secondaryAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(FirstEpisodeSizes.large)
            .copyWith(top: FirstEpisodeSizes.none),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _buildSloganAndLogo(),
            ),
            const SizedBox(height: FirstEpisodeSizes.xxLarge),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    body,
                    const SizedBox(height: FirstEpisodeSizes.medium),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: FirstEpisodeColors.orange,
                            foregroundColor: FirstEpisodeColors.white,
                            textStyle:
                                context.textTheme.bodyLarge.bold?.copyWith(
                              color: FirstEpisodeColors.white,
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: primaryAction.onPressed,
                          child: primaryAction.isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : Text(primaryAction.text),
                        ),
                        const SizedBox(height: FirstEpisodeSizes.medium),
                        _buildSecondaryActionButton(context),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryActionButton(BuildContext context) {
    return FirstEpisodeClickableText(
      text: secondaryAction.text,
      secondaryText: secondaryAction.secondaryText,
      onPressed: secondaryAction.onPressed,
    );
  }

  Widget _buildSloganAndLogo({EdgeInsets? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(FirstEpisodeSizes.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: _buildTitleWidget),
          const FirstEpisodeLogo(),
        ],
      ),
    );
  }

  Widget _buildTitleWidget(BuildContext context) {
    final style = context.textTheme.titleMedium.bold?.copyWith(
      color: FirstEpisodeColors.grey,
    );
    return RichText(
      text: TextSpan(
        style: style,
        text: 'All your money\nIn one app\n',
        children: [
          TextSpan(
            text: 'Simple. Fast. Secure.',
            style: style?.copyWith(
              color: FirstEpisodeColors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
