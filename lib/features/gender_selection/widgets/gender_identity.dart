import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:ai_bot_task/features/create_image/widgets/create_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/color.dart';
import '../../../common/widgets/primary_button.dart';
import '../states/gender_bloc.dart';
import 'gender_widget.dart';

class GenderIdentityPage extends StatefulWidget {
  const GenderIdentityPage({super.key});
  @override
  State<GenderIdentityPage> createState() => _GenderIdentityPageState();
}

class _GenderIdentityPageState extends State<GenderIdentityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: BlocBuilder<GenderBloc, GenderState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: GenderWidget(
                      icon: 'assets/images/boy.png',
                      name: 'Boy',
                      isSelected: state.genderSelect == 0,
                      onTap: () async {

                        context
                            .read<GenderBloc>()
                            .add(const SelectGenderEvent(0, 'Boy'));
                        await PrefUtils().genderSelected('Male');
                      },
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: GenderWidget(
                      icon: 'assets/images/girl1.jpeg',
                      name: 'Girl',
                      isSelected: state.genderSelect == 1,
                      onTap: () async {

                        context
                            .read<GenderBloc>()
                            .add(const SelectGenderEvent(1, 'Girl'));

                        await PrefUtils().genderSelected('Female');
                      },
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: GenderWidget(
                      icon: 'assets/images/non_binary.png',
                      name: 'Non-Binary',
                      isSelected: state.genderSelect == 2,
                      onTap: () async {
                        context
                            .read<GenderBloc>()
                            .add(const SelectGenderEvent(2, 'Non-Binary'));

                        await PrefUtils().genderSelected('Non-Binary');
                      },
                    ))
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                PrimaryButton(
                  onPressed: state.genderSelect! >= 0
                      ? () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateimageWidget()),
                            (route) => false,
                          );
                        }
                      : null,
                  fillColor: state.genderSelect! >= 0
                      ? AppColor.selectedBtnColor
                      : AppColor.unselectedBtnColor,
                  child: AutoSizeText(
                    'Start',
                    style: TextStyle(
                        color: state.genderSelect! >= 0
                            ? AppColor.selectedBtnTxtColor
                            : AppColor.unselectedBtnTxtColor),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
