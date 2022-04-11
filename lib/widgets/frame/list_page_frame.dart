import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:growth_tree_app/widgets/text/title_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListPageFrame extends HookConsumerWidget {
  final String title;
  final List<String> columnNames;
  final List<num> columnWidths;

  const ListPageFrame(
      {Key? key,
      required this.title,
      required this.columnNames,
      required this.columnWidths})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: 864,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: TitleText(title),
            ),
            SizedBox(
              height: 40,
            ),
            Table(
              columnWidths: _setColumnWidths(columnWidths),
              children: <TableRow>[
                _buildHeaderName(
                  columnNames,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<int, FlexColumnWidth> _setColumnWidths(List<num> columnWidths) {
    return columnWidths
        .asMap()
        .map((key, value) => MapEntry(key, FlexColumnWidth(value.toDouble())));
  }

  TableRow _buildHeaderName(List<String> columnNames) {
    final pages = columnNames.map((columnName) {
      return Container(
        alignment: Alignment.center,
        color: GrowthTreeColors.lightThemeColor,
        child: SText(
          columnName,
          fontColor: GrowthTreeColors.themeColor,
          fontWeight: FontWeight.normal,
        ),
      );
    }).toList();
    return TableRow(
      decoration: const BoxDecoration(color: GrowthTreeColors.lightThemeColor),
      children: pages,
    );
  }
}
