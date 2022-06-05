// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../text/title_text.dart';

class BaseFrame extends StatelessWidget {
  final String title;
  final Widget contentWidget;

  const BaseFrame({
    Key? key,
    required this.title,
    required this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 864,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: TitleText(title),
            ),
            const SizedBox(
              height: 40,
            ),
            contentWidget,
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
