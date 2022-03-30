import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/frame/header_widget.dart';
import 'package:growth_tree_app/widgets/frame/side_menu_widget.dart';

class CurriculumsScreen extends StatelessWidget {
  const CurriculumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
    );
  }
}
