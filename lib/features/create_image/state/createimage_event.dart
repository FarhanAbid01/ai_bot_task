import 'dart:io';

// Events
abstract class ImageTextEvent {}

class ImageSelected extends ImageTextEvent {
  final File image;
  ImageSelected(this.image);
}

class TextChanged extends ImageTextEvent {
  final String text;
  TextChanged(this.text);
}


class OnGenerateImage extends ImageTextEvent {}
