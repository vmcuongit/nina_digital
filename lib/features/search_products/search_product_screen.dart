import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';

class SearchProductScreen extends StatelessWidget with FormMixins {
  const SearchProductScreen({super.key});

  static const String nameRoute = 'search';
  static const String pathRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTextFormField(
          context,
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
        centerTitle: false,
      ),
      body: Center(
        child: Text('Nội dung tìm kiếm'),
      ),
    );
  }
}
