part of '../add_review_product.dart';

class _ImagesAttachWidget extends ConsumerStatefulWidget {
  const _ImagesAttachWidget({super.key});

  @override
  ConsumerState createState() => __ImagesAttachWidgetState();
}

class __ImagesAttachWidgetState extends ConsumerState<_ImagesAttachWidget>
    with FormMixins {
  final ImagePicker _picker = ImagePicker();
  List<File> _imagesAttach = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 15,
      runSpacing: 15,
      children: [
        if (_imagesAttach.isNotEmpty && _imagesAttach != []) ...[
          for (int i = 0; i < _imagesAttach.length; i++) ...[
            _itemImage(file: _imagesAttach[i], index: i),
          ]
        ],
        (_imagesAttach.length < 4)
            ? customButton(
                context,
                borderColor: const Color(0xffEBF0FF),
                borderRadius: 8,
                width: 80,
                height: 80,
                image: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
                onTap: () async {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    useRootNavigator: true,
                    context: context,
                    builder: (contextModal) {
                      return Container(
                        padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(contextModal).viewPadding.bottom,
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(contextModal).pop();
                                _onPickFromCamera();
                              },
                              title: Text(
                                'Camera',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              color: Color(0xfff2f2f2),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(contextModal).pop();
                                _onPickFromPhoto();
                              },
                              title: Text(
                                'Thư viện ảnh',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              color: Color(0xfff2f2f2),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              title: Text(
                                'Huỷ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _itemImage({required File file, required int index}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffEBF0FF)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.file(
              file,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: GestureDetector(
              onTap: () {
                _imagesAttach.removeAt(index);
                setState(() {});
              },
              child: Icon(
                Icons.cancel,
                size: 25,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (_checkLimitImages(countItemsSelect: 1)) {
        _imagesAttach.add(File(image.path));
        setState(() {});
      }
    }
  }

  Future<void> _onPickFromPhoto() async {
    final List<XFile> images = await _picker.pickMultiImage(limit: 4);
    if (images.isNotEmpty) {
      if (_checkLimitImages(countItemsSelect: images.length)) {
        for (var element in images) {
          _imagesAttach.add(File(element.path));
          setState(() {});
        }
      }
    }
  }

  _checkLimitImages({required int countItemsSelect}) {
    if (_imagesAttach.length + countItemsSelect > 4) {
      showDialog(
        context: context,
        builder: (context2) {
          return AlertDialog(
            title: Text('Cảnh báo'),
            content: Text('Bạn đã chọn vượt quá 4 file'),
            actions: [
              FilledButton(
                onPressed: () => Navigator.of(context2).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }
}
