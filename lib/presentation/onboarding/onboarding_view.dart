import 'dart:async';

import 'package:advanced_flutter/domain/models/models.dart';
import 'package:advanced_flutter/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:advanced_flutter/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();
  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return StreamBuilder<SliderViewObject>(
      stream: _onBoardingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }


  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if(sliderViewObject == null){
      return const Text('AHMAD');
    }else{
      return Scaffold(
        backgroundColor: ColorsManager.backgroundColor,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (currentIndex) {
            _onBoardingViewModel.onPageChanged(currentIndex);
          },
          itemCount: sliderViewObject.numOfSliders,
          itemBuilder: (context, index) {
            return OnBoardingPage(
              sliderObject: sliderViewObject.sliderObject,
            );
          },
        ),
        bottomSheet: TextButton(
          onPressed: () =>
            Navigator.pushReplacementNamed(context, Routes.loginRoute)
          ,
          child: const Text(AppStrings.skip),
        ),
      );

    }
  }
  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }
}


class OnBoardingPage extends StatelessWidget {
  final SliderObject  sliderObject;
  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        Text(
          sliderObject.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        Text(
          sliderObject.subTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        SvgPicture.asset(sliderObject.imagePath),
      ],
    );
  }
}
