import 'dart:async';

import 'package:advanced_flutter/domain/models/models.dart';
import 'package:advanced_flutter/presentation/base/base_view_model.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends  BaseViewModel
    with OnBoardingViewModelInputs ,OnBoardingViewModelOutputs {

  final StreamController _streamController = StreamController<SliderViewObject>();
  late  List<SliderObject> _list;
  int currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext() {
    currentIndex = ++currentIndex;
    if(currentIndex == _list.length){
      currentIndex = 0;
    }
  }

  @override
  void goPrevious() {
    currentIndex = --currentIndex;
    if(currentIndex == -1){
      currentIndex = _list.length-1;
    }
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);


  //functions
  List<SliderObject> _getSliderData() => [
    SliderObject(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTittle1,
        imagePath: AppAssets.popcornOnBoarding),
    SliderObject(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTittle2,
        imagePath: AppAssets.moneyOnBoarding),
    SliderObject(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTittle3,
        imagePath: AppAssets.restaurantOnBoarding),
  ];
  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[currentIndex], _list.length, currentIndex));
  }

}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
