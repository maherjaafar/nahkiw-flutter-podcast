import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationPageBase(
      primaryAction: AuthActionItem(
        text: 'Sign In',
        onPressed: () {},
      ),
      secondaryAction: AuthActionItem(
        text: 'Don\'t have an account?',
        secondaryText: 'Register now',
        onPressed: () {
          context.goNamed(FirstEpisodeRouteNames.signUp);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: Column(
              children: [
                FirstEpisodeTextFormField.email(),
                FirstEpisodeTextFormField.password(),
              ],
            ).separatedBy(FirstEpisodeSizes.medium),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FirstEpisodeSizes.medium,
            ),
            child: _buildForgetPasswordTextButton,
          ),
        ],
      ),
    );
  }

  Widget get _buildForgetPasswordTextButton {
    return FirstEpisodeClickableText(
      text: 'Forget password?',
      secondaryText: 'Reset',
      onPressed: () {
        debugPrint('Forget password tapped');
      },
    );
  }
}
