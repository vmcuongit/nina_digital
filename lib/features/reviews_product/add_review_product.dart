import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:image_picker/image_picker.dart';

import '../../shared/extensions/context_ext.dart';
import '../../shared/mixins/form_mixin.dart';

part 'widgets/rating_bar_widget.dart';
part 'widgets/images_attach_widget.dart';

final GlobalKey<FormState> _keyFrmReview = GlobalKey<FormState>();

class AddReviewProduct extends ConsumerWidget with FormMixins {
  const AddReviewProduct({super.key, required this.id});

  static const String nameRoute = 'add-reviews-product';
  static const String pathRoute = '/add-reviews-product/:id';
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá sản phẩm'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Form(
            key: _keyFrmReview,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đánh giá cho sản phẩm iPhone 14 Pro Max VN/A 256Gb',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                _RatingBarWidget(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Mời bạn chia sẻ thêm cảm nhận',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextFormField(
                  context,
                  hintText: 'Viết cảm nhận...',
                  maxLines: 6,
                  borderRadius: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Không bỏ trống'),
                    FormBuilderValidators.minLength(20,
                        errorText: 'Vui lòng nhập hơn 20 ký tự'),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Gửi ảnh thực tế (tối đa 4 ảnh)',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 15,
                ),
                _ImagesAttachWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: context.getViewPaddingBottom()),
        child: customButton(
          context,
          text: 'Gửi đánh giá',
          background: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onTap: () {
            _submitReview(ref);
          },
        ),
      ),
    );
  }
}

_submitReview(WidgetRef ref) {
  if (_keyFrmReview.currentState!.validate()) {
    print('ok');
  }
}
