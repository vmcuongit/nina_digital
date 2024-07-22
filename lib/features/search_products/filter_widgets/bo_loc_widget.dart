part of '../search_product_screen.dart';

Widget _itemFilter(
  BuildContext context, {
  required Function() onTap,
  required String label,
  double? fontSize,
  bool active = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(
            color: (active) ? Theme.of(context).primaryColor : Colors.black45),
        borderRadius: BorderRadius.circular(30),
        color: (active) ? Theme.of(context).primaryColor : null,
      ),
      child: Text(
        label,
        style: TextStyle(
            color: (active) ? Colors.white : null, fontSize: fontSize),
      ),
    ),
  );
}

class _BoLocWidget extends StatelessWidget {
  const _BoLocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          if (routeSettings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () => Scaffold.of(context).closeEndDrawer(),
                      child: const Icon(
                        Icons.close,
                      )),
                  title: Text(
                    'Bộ lọc',
                  ),
                  centerTitle: false,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FilterDanhmucWidget(),
                        const SizedBox(height: 30),
                        _FilterThuonghieuWidget(),
                        const SizedBox(height: 30),
                        _FilterKhoanggiaWidget(),
                        const SizedBox(height: 30),
                        _FilterOrderbyWidget(),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: context.getViewPaddingBottom(),
                      top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Scaffold.of(context).closeEndDrawer();
                            },
                            child: Text('Bỏ lọc')),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: FilledButton(
                              onPressed: () {}, child: Text('Áp dụng')))
                    ],
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
