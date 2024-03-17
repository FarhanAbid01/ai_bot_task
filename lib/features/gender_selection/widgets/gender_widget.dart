import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/color.dart';

class GenderWidget extends StatelessWidget {
  final String icon;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderWidget(
      {super.key,
      required this.icon,
      required this.name,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isSelected
                ? AppColor.selectedBtnColor
                : const Color(0xff4C4D4F),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              width: 70.w
              ,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(icon)),
              ),
            ),
            SizedBox(
              height: 5.h),
            AutoSizeText(
              name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? AppColor.selectedBtnColor
                      : const Color(0xff4C4D4F)),
            )
          ],
        ),
      ),
    );
  }
}
