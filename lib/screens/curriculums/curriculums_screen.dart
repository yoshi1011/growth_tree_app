import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../providers/loading_state_provider.dart';
import '../../view_models/curriculum_list_view_model.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import '../../models/table_items/curriculum_item.dart';
import '../../utils/constants.dart';
import '../../widgets/frame/list_page_frame.dart';

class CurriculumsScreen extends HookConsumerWidget {
  const CurriculumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _curriculumListProvider = ref.read(curriculumListProvider.notifier);
    final _curriculumList = ref.watch(curriculumListProvider.notifier).curriculums;

    final snapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider.notifier)
            .whileLoading(_curriculumListProvider.list);
      }, []),
    );

    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: (() {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            var result = _curriculumList != null ?
            _curriculumList.when(success: (data) {
              if(data.isNotEmpty) {
                List<CurriculumItem> curriculumItems = data.map((curriculum) => CurriculumItem.fromCurriculum(curriculum)).toList();
                return ListPageFrame(
                  title: 'カリキュラム',
                  // NOTE: columnNamesおよびcolumnWidthsは定数で定義したほうがわかりやすそう
                  columnNames: CurriculumColumnNames,
                  columnWidths: CurriculumColumnWidths,
                  dataList: curriculumItems,
                );
              } else {
                return const Text('data error');
              }
            }, error: (error){
              return const Text('errorerror');
            }) : const SizedBox();
            return result;

          case ConnectionState.none:
            const Text('error');
            break;
          case ConnectionState.active:
            // TODO: Handle this case.
            break;
        }
      })(),
    );
  }
}
