part of '../product_detail_screen.dart';

class _ImagesProductWidget extends ConsumerStatefulWidget {
  const _ImagesProductWidget({super.key});

  @override
  ConsumerState createState() => __ImagesProductWidgetState();
}

class __ImagesProductWidgetState extends ConsumerState<_ImagesProductWidget> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 330,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              _itemSlide(image: '${MediaAssets.images}/sp.jpg'),
              _itemSlide(image: '${MediaAssets.images}/sp.jpg'),
              _itemSlide(image: '${MediaAssets.images}/sp.jpg'),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.black.withOpacity(0.2),
            dotWidth: 10,
            dotHeight: 5,
          ),
        ),
      ],
    );
  }

  Widget _itemSlide({required String image}) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
