import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/header/header_widget.dart';
import 'package:growth_tree_app/widgets/notification_bar/notification_bar_widget.dart';
import 'package:growth_tree_app/widgets/side_menu/side_menu_widget.dart';

class CurriculumsScreen extends StatelessWidget {
  const CurriculumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
    );
  }
}
