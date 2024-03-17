import 'dart:io';

import 'package:ai_bot_task/common/utils/color.dart';
import 'package:ai_bot_task/common/widgets/primary_button.dart';
import 'package:ai_bot_task/constans/strings.dart';
import 'package:ai_bot_task/features/ai_Image/ai_image.dart';
import 'package:ai_bot_task/features/create_image/create_image_proivder.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_bloc.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_event.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_state.dart';
import 'package:ai_bot_task/features/create_image/widgets/createimage_appbar.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class CreateimageWidget extends StatefulWidget {
  CreateimageWidget({super.key});

  @override
  State<CreateimageWidget> createState() => _CreateimageWidgetState();
}

class _CreateimageWidgetState extends State<CreateimageWidget> {
  final picker = ImagePicker();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Consumer<CreateImageProvider>(
        builder: (context, createImageVm , child) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            body: BlocBuilder<ImageTextBloc, ImageTextState>(
                builder: (context, state) {
              print("here is the result ${state.image}");
              return LoadingOverlay(
                isLoading: createImageVm.isLoading,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const CreateiamgeAppbar(),
                            Container(
                                // width: getProportionateWidth(366),
                                height: 245.h,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xff202021),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AutoSizeText(
                                          Strings.faceimage,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        state.image == null &&
                                                state.image
                                                    .toString()
                                                    .contains('null')
                                            ? Container()
                                            : GestureDetector(
                                                onTap: () {
                                                  BlocProvider.of<ImageTextBloc>(
                                                          context)
                                                      .add(ImageSelected(
                                                          File("null")));
                                                },
                                                child: const AutoSizeText(
                                                  Strings.clearimage,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    state.image == null ||
                                            state.image.toString().contains('null')
                                        ? Align(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  // width: getProportionateWidth(334),
                                                  height: 170.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(16),
                                                    color: const Color(0xff45454554),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      final pickedFile =
                                                          await picker.pickImage(
                                                              source: ImageSource
                                                                  .gallery);
                                                      if (pickedFile != null) {
                                                        BlocProvider.of<
                                                                    ImageTextBloc>(
                                                                context)
                                                            .add(ImageSelected(File(
                                                                pickedFile.path)));
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(
                                                              "assets/images/select_image.svg"),
                                                          SizedBox(
                                                            height:
                                                                10.h,
                                                          ),
                                                          const Text(
                                                            Strings.uploadimage,
                                                            style: TextStyle(
                                                              color:
                                                                  Color(0xff9C9DA2),
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Container(
                                                width: 188,
                                                height: 170.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                    child: Image.file(
                                                      state.image!,
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                            ),
                                          ),
                                  ],
                                )),
                            SizedBox(height: 20.h),
                            Container(
                                width: double.infinity,
                                height: 245.h,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xff202021),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AutoSizeText(
                                      Strings.imageprompt,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          height: 170.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: const Color(0xff45454554),
                                          ),
                                          child: const TextField(
                                            style: TextStyle(color: Colors.white),
                                            minLines: 1,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              hintMaxLines: 3,
                                              hintText: Strings.hinttext,
                                              hintStyle: TextStyle(
                                                color: Color(0xff9C9DA2),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          )),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: PrimaryButton(
                            onPressed: () async {
                             await createImageVm.createImage(image:  state.image?.path,  text: state.text??'').then((value) {

                                  Get.bottomSheet(AiImagePage());

                             });



                            },
                            fillColor: AppColor.selectedBtnColor,
                            child: const AutoSizeText(
                              'Generate',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.selectedBtnTxtColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }
      );
    });
  }
}
