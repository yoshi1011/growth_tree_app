// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

class FileDownloadIcon extends StatelessWidget {
  const FileDownloadIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const Icon(
          Icons.download,
          size: 30,
          color: GrowthTreeColors.black,
        ),
      ],
    );
  }
}
