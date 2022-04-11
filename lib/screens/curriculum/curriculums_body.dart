import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/constants.dart';
import 'package:growth_tree_app/widgets/frame/list_page_frame.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurriculumsBody extends HookConsumerWidget {
  const CurriculumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListPageFrame(
      title: 'カリキュラム',
      // NOTE: columnNamesおよびcolumnWidthsは定数で定義したほうがわかりやすそう
      columnNames: CurriculumColumnNames,
      columnWidths: CurriculumColumnWidths,
    );
  }
}
