import 'package:equatable/equatable.dart';
import 'dart:io';

/// Represents the state of an image with associated text.
class ImageTextState extends Equatable {
  /// The image file.
  final File? image;

  /// The text associated with the image.
  final String text;

  final bool isLoading;

  /// Creates a new instance of [ImageTextState].
  ///
  /// The [image] parameter represents the image file, and the [text] parameter represents the associated text.
  const ImageTextState({required this.image, required this.text , this.isLoading = false});

  /// Creates a copy of this [ImageTextState] instance with the specified changes.
  ///
  /// The [image] parameter, if provided, will replace the current image file.
  /// The [text] parameter, if provided, will replace the current associated text.
  ImageTextState copyWith({File? image, String? text, required bool isLoading}) {
    return ImageTextState(
      image: image ?? this.image,
      text: text ?? this.text,
    );
  }


  @override
  List<Object?> get props => [image, text];
}


