import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController? _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation? get animation => this._animation;

  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s

    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState

        update();
      });
    _animationController!.forward();
    // start our animation
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
  }

  void stopPrograss() {
    // because once user press any option then it will run
    // It will stop the counter
    _animationController!.stop();
    update();
  }

  void ResetPrograss() {
    // because once user press any option then it will run
    // It will stop the counter
    _animationController!.reset();
    _animationController!.forward();
    update();
  }
}
