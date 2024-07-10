part of '../home_screen.dart';

class _AdWidget extends StatelessWidget {
  const _AdWidget({super.key});

  Widget _itemSlide({required String image}) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      margin: const EdgeInsets.only(top: 15),
      height: 120,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          _itemSlide(image: '${MediaAssets.images}/slide2.jpg'),
          _itemSlide(image: '${MediaAssets.images}/slide3.jpg'),
          _itemSlide(image: '${MediaAssets.images}/slide1.jpg'),
        ],
      ),
    );
  }
}
