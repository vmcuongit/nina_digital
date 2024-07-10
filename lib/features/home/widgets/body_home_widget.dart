part of '../home_screen.dart';

class _BodyHomeWidget extends StatelessWidget {
  const _BodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _SliderWidget(),
        ],
      ),
    );
  }
}
