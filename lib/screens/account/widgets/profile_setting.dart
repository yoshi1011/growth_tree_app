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
import '../../../validators/date_validator.dart';
import '../../../validators/required_validator.dart';
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
    final _birthdayController = useTextEditingController(text: _user?.birthdayText);
    final _joinedDateController = useTextEditingController(text: _user?.joinedDateText);

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
                        final base64Image = base64Encode(byteImage);
                        await ref.read(userStateProvider.notifier).updateImage(imageUrl: base64Image);
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
                          validator: RequiredValidator.validate,
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
                          validator: RequiredValidator.validate,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SText('生年月日', fontWeight: FontWeight.normal,),
                  const SizedBox(height: 10,),
                  Container(
                    width: 150,
                    child: OutlinedTextField(
                      controller: _birthdayController,
                      labelText: '年',
                      textInputType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                      validator: DateValidator.validate,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SText('入社日', fontWeight: FontWeight.normal,),
                  const SizedBox(height: 10,),
                  Container(
                    width: 150,
                    child: OutlinedTextField(
                      controller: _joinedDateController,
                      labelText: '年',
                      textInputType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                      validator: DateValidator.validate,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: BasicButton(
                      labelName: '保存',
                      color: GrowthTreeColors.blue,
                      onPressed: () async {
                        await ref.read(userStateProvider.notifier)
                            .updateProfileSetting(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              birthday: _birthdayController.text,
                              joinedDate: _joinedDateController.text,
                            );
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
