import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/header/header_widget.dart';
import '../widgets/notification_bar/notification_bar_widget.dart';
import '../widgets/side_menu/side_menu_widget.dart';

class WorkspaceScreen extends ConsumerWidget {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: Text('workspace'),
    );
  }
}

