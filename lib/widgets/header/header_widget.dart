// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:growth_tree_app/utils/colors.dart';

import '../../models/user.dart';
import '../../providers/user_state_provider.dart';

class HeaderWidget extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  HeaderWidgetState createState() => HeaderWidgetState();
}

class HeaderWidgetState extends ConsumerState<HeaderWidget> {
  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleEndDrawerButton() {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final User? _user = ref.watch(userStateProvider.notifier).user;
    final imageUrl = _user?.imageUrl;

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: GrowthTreeColors.darkGray,
        onPressed: _handleDrawerButton,
      ),
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        semanticsLabel: 'logo',
        height: 35,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: GrowthTreeColors.darkGray,
            size: 36,
          ),
          onPressed: _handleEndDrawerButton,
        ),
        const SizedBox(
          width: 15,
        ),
        CircleAvatar(
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          backgroundColor: Colors.black54,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
