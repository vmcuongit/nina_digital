import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../shared/app_config.dart';
import '../../shared/constants/media_assets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String nameRoute = 'onboarding';
  static const String pathRoute = '/onboarding';

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    ref.read(appSettingProvider.notifier).setOnboardingLoaded();
    context.go(AppConfig.initialPath);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('${MediaAssets.assetsOnboarding}/$assetName',
        width: width);
  }

  final tittleStyle = const TextStyle(
    fontSize: 24.0,
    color: Colors.black,
  );
  final bodyStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.black54,
  );

  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyPadding: EdgeInsets.all(20),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  PageViewModel _pageItem({String? title, String? body, String? image}) {
    return PageViewModel(
      titleWidget: Text(
        title.toString(),
        style: tittleStyle,
        textAlign: TextAlign.center,
      ),
      bodyWidget: Text(
        body.toString(),
        style: bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: _buildImage(image.toString()),
      decoration: pageDecoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        bodyPadding: const EdgeInsets.only(top: 60),
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: false,
        infiniteAutoScroll: false,
        pages: [
          _pageItem(
              title: 'Fractional shares',
              body:
                  'Instead of having to buy an entire share, invest any amount you want.',
              image: 'img1.jpg'),
          _pageItem(
              title: 'Learn as you go',
              body:
                  'Download the Stockpile app and master the market with our mini-lesson.',
              image: 'img2.jpg'),
          _pageItem(
              title: 'Kids and teens',
              body:
                  'Kids and teens can track their stocks 24/7 and place trades that you approve.',
              image: 'img3.jpg'),
          _pageItem(
              title: 'Another title page',
              body: 'Another beautiful body text for this example onboarding.',
              image: 'img2.jpg'),
          _pageItem(
              title: 'Title of last page - reversed',
              body: 'Another beautiful body text for this example onboarding.',
              image: 'img1.jpg'),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
