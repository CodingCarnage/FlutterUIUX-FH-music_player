import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => this._isPlaying;

  set isPlaying(bool isPlaying) {
    this._isPlaying = isPlaying;
    notifyListeners();
  }

  AnimationController _animationController;

  AnimationController get animationController => this._animationController;

  set animationController(AnimationController animationController) {
    this._animationController = animationController;
  }
}