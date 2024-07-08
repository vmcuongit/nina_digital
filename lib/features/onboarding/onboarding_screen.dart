import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../localizations/language_ext.dart';
import '../../shared/constants/media_assets.dart';
import '../home/home_screen.dart';
import 'providers/page_onboarding_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String nameRoute = 'onboarding';
  static const String pathRoute = '/onboarding';

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  final List<Map> _listPage = [
    {
      'image': '${MediaAssets.onboarding}/img1.jpg',
      'description':
          'Chúng tôi cung cấp sản phẩm chất lượng cao chỉ dành cho bạn'
    },
    {
      'image': '${MediaAssets.onboarding}/img2.jpg',
      'description':
          'Sự hài lòng của bạn là ưu tiên số một của chúng tôi dành cho bạn'
    },
    {
      'image': '${MediaAssets.onboarding}/img3.jpg',
      'description':
          'Hãy cùng APP Digital đáp ứng nhu cầu công nghệ của bạn ngay bây giờ'
    },
  ];

  Widget _pageItem({required String image, String? description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          padding: const EdgeInsets.only(bottom: 160, left: 25, right: 25),
          child: Text(
            description ?? '',
            style:
                const TextStyle(color: Colors.white, fontSize: 20, height: 1.8),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ),
      ),
    );
  }

  _onPageChange(int index) {
    ref.read(pageOnboardingProvider.notifier).updatePage(currentPage: index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  _onClickButton() {
    final page = ref.watch(pageOnboardingProvider) + 1;
    if (page == _listPage.length) {
      ref.read(appSettingProvider.notifier).setOnboardingLoaded();
      context.go(HomeScreen.pathRoute);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      int currentPage = (_pageController.page?.toInt() ?? 0) + 1;
      ref
          .read(pageOnboardingProvider.notifier)
          .updatePage(currentPage: currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        body: PageView.builder(
          controller: _pageController,
          itemCount: _listPage.length,
          itemBuilder: (context, index) {
            final item = _listPage[index];
            return _pageItem(
                image: item['image'], description: item['description']);
          },
          onPageChanged: _onPageChange,
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmoothPageIndicator(
              controller: _pageController, // PageController
              count: _listPage.length,
              effect: ExpandingDotsEffect(
                  dotColor: Colors.white.withOpacity(0.5),
                  activeDotColor: Colors.white,
                  dotHeight: 5,
                  dotWidth: 10), // your preferred effect
              onDotClicked: _onPageChange,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 35, left: 50, right: 50),
              child: ElevatedButton(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 12),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                onPressed: _onClickButton,
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final page = ref.watch(pageOnboardingProvider) + 1;
                    return (page == _listPage.length)
                        ? Text(
                            context.translate.batdau,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          )
                        : Text(context.translate.tieptuc,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
