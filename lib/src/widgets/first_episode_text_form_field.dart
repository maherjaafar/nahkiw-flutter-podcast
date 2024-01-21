import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_validator/email_validator.dart';

class FirstEpisodeTextFormField extends StatefulWidget {
  const FirstEpisodeTextFormField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  factory FirstEpisodeTextFormField.name({
    Key? key,
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return FirstEpisodeTextFormField(
      key: key,
      hintText: hintText,
      controller: controller,
      validator: validator ??
          (name) {
            if (name?.isEmpty ?? true) {
              return 'Please enter your $hintText';
            }
            return null;
          },
    );
  }
  factory FirstEpisodeTextFormField.email({
    Key? key,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return FirstEpisodeTextFormField(
      key: key,
      hintText: hintText ?? 'Email',
      controller: controller,
      validator: validator ??
          (email) {
            if (email?.isEmpty ?? true) {
              return 'Please enter your email';
            }
            if (EmailValidator.validate(email!) == false) {
              return 'Please enter a valid email';
            }

            return null;
          },
    );
  }

  factory FirstEpisodeTextFormField.password({
    Key? key,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return FirstEpisodeTextFormField(
      key: key,
      hintText: hintText ?? 'Password',
      obscureText: true,
      isPassword: true,
      controller: controller,
      validator: validator ??
          (password) {
            if (password?.isEmpty ?? true) {
              return 'Please enter your password';
            }
            if (password!.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
    );
  }

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<FirstEpisodeTextFormField> createState() =>
      _FirstEpisodeTextFormFieldState();
}

class _FirstEpisodeTextFormFieldState extends State<FirstEpisodeTextFormField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: context.textTheme.bodyLarge.bold?.copyWith(
        color: FirstEpisodeColors.grey,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: !widget.isPassword
            ? null
            : IconButton(
                onPressed: () {
                  setState(() => obscureText = !obscureText);
                  debugPrint('obscureText: ${widget.obscureText}');
                },
                icon: Icon(
                  !obscureText ? Icons.visibility : Icons.visibility_off,
                  color: FirstEpisodeColors.grey,
                ),
              ),
      ),
    );
  }
}
