import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

class GoogleLoginButton extends StatelessWidget {
  final bool isSignUp;

  const GoogleLoginButton({Key? key, this.isSignUp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/google.svg',
            semanticsLabel: 'google-login',
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            isSignUp ? 'Continue with Google' : 'Sign in with Google',
            style: TextStyle(
                color: GrowthTreeColors.darkGray,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        side: const BorderSide(width: 1, color: GrowthTreeColors.darkGray),
      ),
    );
  }
}
