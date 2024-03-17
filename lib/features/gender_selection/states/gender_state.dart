part of 'gender_bloc.dart';

/// Represents the state of gender selection.
class GenderState extends Equatable {
  /// The numerical representation of the selected gender.
  final int? genderSelect;


  bool? isLoading;

  /// The textual representation of the selected gender.
  final String? gender;

  /// Constructs a [GenderState] with optional parameters.
   GenderState({
    this.genderSelect = -1,
    this.gender = '',
    this.isLoading = false,
  });

  /// Creates a new [GenderState] based on existing state but with modified properties.
  GenderState copyWith({
    int? genderSelect,
    String? gender,
    bool? isLoading
  }) {
    return GenderState(
      genderSelect: genderSelect ?? this.genderSelect,
      gender: gender ?? this.gender,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [genderSelect, gender];
}
