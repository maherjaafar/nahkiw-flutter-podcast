import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController(text: '');
    emailController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authenticationProvider).isLoading;
    return AuthenticationPageBase(
      primaryAction: AuthActionItem(
        isLoading: isLoading,
        text: 'Sign In',
        onPressed: () async {
          if (isLoading) return;
          final email = emailController.text;
          final password = passwordController.text;
          logger
            ..d('Email: $email')
            ..d('Password: $password');
          if (_formKey.currentState?.validate() != true) return;
          ref.read(authenticationProvider.notifier).signInWithEmailAndPassword(
                email: email,
                password: password,
              );
        },
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
            key: _formKey,
            child: Column(
              children: [
                FirstEpisodeTextFormField.email(
                  controller: emailController,
                ),
                FirstEpisodeTextFormField.password(
                  controller: passwordController,
                ),
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
