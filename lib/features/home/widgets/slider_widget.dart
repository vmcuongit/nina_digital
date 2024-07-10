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
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: FlutterCarousel(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 300),
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: 1,
          slideIndicator: CircularSlideIndicator(
            indicatorBackgroundColor: Colors.white.withOpacity(0.4),
            currentIndicatorColor: Colors.white,
          ),
        ),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return _itemSlide(image: '${MediaAssets.images}/slide$i.jpg');
            },
          );
        }).toList(),
      ),
    );
  }
}
