import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/mixins/form_mixin.dart';
import '../account/address/address_detail_screen.dart';

class DoiDiaChiScreen extends ConsumerStatefulWidget {
  const DoiDiaChiScreen({super.key});

  static const String nameRoute = 'change-address';
  static const String pathRoute = '/change-address';

  @override
  ConsumerState createState() => _DoiDiaChiScreenState();
}

class _DoiDiaChiScreenState extends ConsumerState<DoiDiaChiScreen>
    with FormMixins {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa chỉ nhận hàng'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (contextItem, index) {
                  return GestureDetector(
                    onTap: _onChanged,
                    child: _wrapContentWidget(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _customIconWidget(
                            context,
                            child: Icon(
                              Icons.pin_drop,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          child: Text(
                                        'Vũ Mạnh Cường',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Text('|'),
                                      ),
                                      Text(
                                        '0909 845 849',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '123/234/6 Bình Long , Phường Bình Hưng Hoà A, Quận Bình Tân, TP. Hồ Chí Minh',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 30,
                            child: Radio(
                              value: _selected,
                              groupValue: index,
                              onChanged: (value) {
                                _onChanged();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: 3,
              ),
              customButton(
                context,
                text: 'Thêm địa chỉ mới',
                background: Theme.of(context).primaryColor,
                textColor: Colors.white,
                image: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                onTap: () {
                  context.pushNamed(AddressDetailScreen.nameRouteAdd,
                      queryParameters: {'from': 'payment'});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customIconWidget(BuildContext context, {required Widget child}) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _wrapContentWidget({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3)
        ],
      ),
      child: child,
    );
  }

  _onChanged() {
    Navigator.of(context).pop();
  }
}
