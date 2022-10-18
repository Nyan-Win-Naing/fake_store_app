import 'dart:io';

import 'package:flutter/foundation.dart';

class CategoryBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;

  /// Image
  File chosenImageFile;

  CategoryBloc() {
    print("Category Bloc Constructor works............");
  }


  void onImageChosen(File imageFile) {
    chosenImageFile = imageFile;
    notifyListeners();
  }

  void onTapDeleteImage() {
    chosenImageFile = null;
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