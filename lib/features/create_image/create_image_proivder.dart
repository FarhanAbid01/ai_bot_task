import 'dart:developer';

import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:ai_bot_task/core/api_client.dart';
import 'package:flutter/material.dart';

class CreateImageProvider with ChangeNotifier{
  HTTPRequestProvider httpRequestProvider = HTTPRequestProvider();
  bool isLoading = false;
  List<String?> images = [];
  /// Create an image with the given [image] and [text].
   Future createImage({ String? image,  String? text}) async {
     isLoading = true;
      notifyListeners();
     var body = {
       "image": image??'',
       "prompt" : "woman",
       "gender": PrefUtils().getGenderSelected(),
       "text": text??'',
     };
     await httpRequestProvider.makePOSTAPICall(url: "/characters/profile-images", bodyParams: body).then((value) {
       log('image is saved ${value}');
       value['result'].forEach((element) {
         images.add(element);
       });

        isLoading = false;
        notifyListeners();
     });
}
  }