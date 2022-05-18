// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../icon/file_download_icon.dart';
import '../text/xs_text.dart';

class AttachmentCard extends StatefulWidget {
  final String name;

  const AttachmentCard({Key? key, required this.name}) : super(key: key);

  @override
  State<AttachmentCard> createState() => _AttachmentCardState();
}

class _AttachmentCardState extends State<AttachmentCard> {
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (_) => _changeOpacity(),
      child: Stack(
        children: [
          // 外枠
          Container(
            width: 100,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFEEEEEE),
                width: 1,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: const Color(0x00000000).withOpacity(0.25),
                ),
              ],
            ),
            // 内側のアイコンやファイル名
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.insert_drive_file_outlined,
                  size: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                XsText(widget.name),
              ],
            ),
          ),
          // Hover時に表示されるダウンロードアイコン
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(milliseconds: 200),
            child: Stack(
              alignment: const Alignment(0, 0),
              children: [
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const FileDownloadIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
