import 'package:flutter/material.dart';

import '../../../shared/mixins/form_mixin.dart';

class AddressScreen extends StatelessWidget with FormMixins {
  const AddressScreen({super.key});

  static const String nameRoute = 'address';
  static const String pathRoute = '/address';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa chỉ của tôi'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ItemAddress(
              flag: true,
            ),
            _ItemAddress(
              onTap: () {
                print('xxx');
              },
            ),
            _ItemAddress(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewPadding.bottom),
        child: customButton(
          context,
          image: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
          text: 'Thêm địa chỉ mới',
          background: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onTap: () {},
        ),
      ),
    );
  }
}

class _ItemAddress extends StatelessWidget {
  const _ItemAddress({super.key, this.flag, this.onTap});

  final bool? flag;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vũ Mạnh Cường',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('|'),
                  ),
                  Text(
                    '0909 845 849',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '123/234/6 Bình Long',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Phường Bình Hưng Hoà A, Quận Bình Tân, TP. Hồ Chí Minh',
              style: TextStyle(fontSize: 16),
            ),
            if (flag == true) ...[
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: Text(
                  'Mặc định',
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
