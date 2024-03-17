import 'dart:developer';
import 'dart:io';
import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:ai_bot_task/core/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_event.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_state.dart';

/// A [Bloc] responsible for managing the state of the image and text in the create image feature.
class ImageTextBloc extends Bloc<ImageTextEvent, ImageTextState> {
  HTTPRequestProvider _httpRequestProvider;
  ImageTextBloc(this._httpRequestProvider) : super(const ImageTextState(image: null, text: '')) {
    on<ImageTextEvent>((event, emit) async {
      if (event is ImageSelected) {
        emit(state.copyWith(image: event.image , isLoading: false));
      } else if (event is TextChanged) {
        emit(state.copyWith(text: event.text , isLoading: false));
      }
      if(event is OnGenerateImage){
        emit(state.copyWith(isLoading: true));
        var body = {
          "image": state.image?.path,
          "prompt" : "woman",
          "gender": PrefUtils().getGenderSelected(),
          "text": state.text==''?'':state.text
        };
        await _httpRequestProvider.makePOSTAPICall(url: "/characters/profile-images", bodyParams: body).then((value) {
          log('image is saved ${value}');
          emit(state.copyWith(isLoading: false));
        });
      }

    });
  }
}
