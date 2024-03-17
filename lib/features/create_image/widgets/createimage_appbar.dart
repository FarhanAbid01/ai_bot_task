import 'package:ai_bot_task/constans/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateiamgeAppbar extends StatelessWidget {
  const CreateiamgeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.close,
            color: Colors.white,
            size: 24.sp,
          ),
          const AutoSizeText(
            Strings.createimage,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
