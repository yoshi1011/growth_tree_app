// Flutter imports:
import 'dart:convert';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import '../../../models/user.dart';
import '../../../providers/user_state_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/form/outlined_text_field.dart';
import '../../../widgets/text/l_text.dart';
import '../../../widgets/text/s_text.dart';

class ProfileSetting extends HookConsumerWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? _user = ref.watch(userStateProvider.notifier).user;
    
    final _firstNameController = useTextEditingController(text: _user?.firstName);
    final _lastNameController = useTextEditingController(text: _user?.lastName);
    final _birthYearConfirmController = useTextEditingController(text: _user?.birthday.year.toString());
    final _birthMonthConfirmController = useTextEditingController(text: _user?.birthday.month.toString());
    final _birthDayConfirmController = useTextEditingController(text: _user?.birthday.day.toString());
    final _joinedYearConfirmController = useTextEditingController(text: _user?.joinedDate?.year.toString());
    final _joinedMonthConfirmController = useTextEditingController(text: _user?.joinedDate?.month.toString());
    final _joinedDayConfirmController = useTextEditingController(text: _user?.joinedDate?.day.toString());

    final imageUrl = _user?.imageUrl;

    final ImagePicker _picker = ImagePicker();

    return Container(
      width: 864,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(
            color: GrowthTreeColors.lightGray,
            width: 1,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LText(
            'プロフィール',
            fontColor: GrowthTreeColors.black,
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 722,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
                    backgroundColor: GrowthTreeColors.darkGray,
                    radius: 50,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () async {
                        final XFile? uploadedImage = await _picker
                            .pickImage(source: ImageSource.gallery);
                        final byteImage = await uploadedImage!.readAsBytes();
                        final byte = base64Encode(byteImage);
                        await ref.read(userStateProvider.notifier).updateImage(byte);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SText(
                    '氏名',
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 340,
                        child: OutlinedTextField(
                          controller: _firstNameController,
                          labelText: 'FirstName',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 340,
                        child: OutlinedTextField(
                          controller: _lastNameController,
                          labelText: 'LastName',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SText('生年月日', fontWeight: FontWeight.normal,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: OutlinedTextField(
                          controller: _birthYearConfirmController,
                          labelText: '年',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 90,
                        child: OutlinedTextField(
                          controller: _birthMonthConfirmController,
                          labelText: '月',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 90,
                        child: OutlinedTextField(
                          controller: _birthDayConfirmController,
                          labelText: '日',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SText('入社日', fontWeight: FontWeight.normal,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: OutlinedTextField(
                          controller: _joinedYearConfirmController,
                          labelText: '年',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 90,
                        child: OutlinedTextField(
                          controller: _joinedMonthConfirmController,
                          labelText: '月',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 90,
                        child: OutlinedTextField(
                          controller: _joinedDayConfirmController,
                          labelText: '日',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: BasicButton(
                      labelName: '保存',
                      color: GrowthTreeColors.blue,
                      onPressed: () {
                        // ref.read(userStateProvider).
                        showSnackbar('プロフィール情報を保存しました', context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
