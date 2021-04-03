import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => this._isPlaying;

  set isPlaying(bool isPlaying) {
    this._isPlaying = isPlaying;
    notifyListeners();
  }

  Duration _songDuration = new Duration(milliseconds: 0);

  Duration get songDuration => this._songDuration;

  set songDuration(Duration songDuration) {
    this._songDuration = songDuration;
    notifyListeners();
  }

  Duration _songCurrentTime = new Duration(milliseconds: 0);

  Duration get songCurrentTime => this._songCurrentTime;

  set songCurrentTime(Duration songCurrentTime) {
    this._songCurrentTime = songCurrentTime;
    notifyListeners();
  }

  double get songPercentage => (this._songDuration.inSeconds > 0) 
                               ? this._songCurrentTime.inSeconds / this._songDuration.inSeconds 
                               : 0;

  String printDuration(Duration duration) {
    String twoDigits(int number) {
      if (number >= 10)
        return '$number';
      return '0$number';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get songCurrentDuration => this.printDuration(this._songCurrentTime);

  AnimationController _animationController;

  AnimationController get animationController => this._animationController;

  set animationController(AnimationController animationController) {
    this._animationController = animationController;
  }
}