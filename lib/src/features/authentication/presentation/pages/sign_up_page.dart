import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>();

    return AuthenticationPageBase(
      primaryAction: AuthActionItem(
        text: 'Sign Up',
        onPressed: () {
          final isFormValid = formKey.currentState!.validate();
          if (isFormValid) {
            context.goNamed(FirstEpisodeRouteNames.root);
            return;
          }
          showSnackBar(context, 'Please fill up the form');
        },
      ),
      secondaryAction: AuthActionItem(
        text: 'Do you have an account?',
        secondaryText: 'Sign In',
        onPressed: () {
          context.goNamed(FirstEpisodeRouteNames.signIn);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                FirstEpisodeTextFormField.name(
                  hintText: 'Firstname',
                ),
                FirstEpisodeTextFormField.name(
                  hintText: 'Lastname',
                ),
                FirstEpisodeTextFormField.email(),
                FirstEpisodeTextFormField.password(
                  controller: passwordController,
                ),
                FirstEpisodeTextFormField.password(
                  hintText: 'Confirm Password',
                  validator: (value) {
                    if (value?.isEmpty == true ||
                        value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
              ],
            ).separatedBy(FirstEpisodeSizes.medium),
          ),
        ],
      ),
    );
  }
}
