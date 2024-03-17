part of 'gender_bloc.dart';

/// Represents events related to gender selection.
abstract class GenderEvent extends Equatable {
  const GenderEvent();
}

/// Represents the event of selecting a gender.
class SelectGenderEvent extends GenderEvent {
  /// The numerical representation of the selected gender.
  final int genderNum;

  /// The textual representation of the selected gender.
  final String gender;

  /// Constructs a [SelectGenderEvent].
  const SelectGenderEvent(this.genderNum, this.gender);

  @override
  List<Object?> get props => [genderNum, gender];
}
