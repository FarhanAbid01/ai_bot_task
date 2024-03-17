import 'dart:async';
import 'dart:developer';

import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:ai_bot_task/core/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gender_event.dart';

part 'gender_state.dart';

/// Handles business logic for gender-related events and states.
class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final HTTPRequestProvider _httpRequestProvider;
  /// Constructs a [GenderBloc] with an initial state.
  GenderBloc( this._httpRequestProvider) : super(GenderState()) {
    // Define event handlers
    on<SelectGenderEvent>(_onGenderSelection);
  }

  /// Event handler for [SelectGenderEvent].
  Future<void> _onGenderSelection(
    SelectGenderEvent event,
    Emitter<GenderState> emit,
  ) async {

   // Login to get token
   _httpRequestProvider?.login().then((value) async {

     // Set the token in shared preferences
     await PrefUtils().setUserToken(value['accessToken']);
     log('this is our token ${value['accessToken']}');
   });

    // Emit a new state with updated gender selection
    emit(state.copyWith(genderSelect: event.genderNum));
  }
}
