part of '../home_screen.dart';

class _SearchHomeWidget extends StatelessWidget with FormMixins {
  const _SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(SearchProductScreen.pathRoute);
      },
      child: customTextFormField(
        context,
        enabled: false,
        hintText: 'Tìm kiếm',
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        fillColor: const Color(0xffF5F5F5),
        borderColor: const Color(0xffF5F5F5),
        borderRadius: 10,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: icons.Search(
            color: Colors.grey,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset('${MediaAssets.icons}/filter.svg'),
        ),
      ),
    );
  }
}
