import 'dart:io';

import 'package:flutter/foundation.dart';

class AddProductBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;

  /// Image
  List<File> chosenImageFileList = [];


  AddProductBloc() {}

  void onImageChosen(File imageFile) {
    chosenImageFileList.add(imageFile);
    chosenImageFileList = List.of(chosenImageFileList);
    notifyListeners();
  }

  void onTapDeleteImage(File imageFile) {
    chosenImageFileList.remove(imageFile);
    chosenImageFileList = List.of(chosenImageFileList);
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(!_disposed) {
      super.notifyListeners();
    }
  }
}