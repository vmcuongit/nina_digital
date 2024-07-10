part of '../home_screen.dart';

class _SliderWidget extends StatefulWidget {
  const _SliderWidget({super.key});

  @override
  State<_SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<_SliderWidget> {
  final PageController _pageController = PageController(initialPage: 0);

  Widget _itemSlide({required String image}) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 220,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              _itemSlide(image: '${MediaAssets.images}/slide1.jpg'),
              _itemSlide(image: '${MediaAssets.images}/slide2.jpg'),
              _itemSlide(image: '${MediaAssets.images}/slide3.jpg'),
            ],
          ),
        ),
        Positioned(
            bottom: 30,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 3,
                    dotWidth: 15,
                    dotColor: Colors.white.withOpacity(0.4),
                    activeDotColor: Colors.white,
                    expansionFactor: 2,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
