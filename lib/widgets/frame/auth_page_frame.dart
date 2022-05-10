import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/colors.dart';

class AuthPageFrame extends HookConsumerWidget {
  final String title;
  final Widget body;

  const AuthPageFrame({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'Logo',
                height: 70,
              ),
              const SizedBox(
                height: 50,
              ),
              SelectableText(
                title,
                style: const TextStyle(
                    color: GrowthTreeColors.themeColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: 340,
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
