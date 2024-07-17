part of '../search_product_screen.dart';

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
                        color: Colors.white,
                      )),
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text(
                    'Bo Loc San Pham',
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: false,
                ),
                body: ListView(
                  children: [
                    for (var i = 0; i < 3; i++) SubMenuItem(path: '${i + 1}'),
                  ],
                ),
                bottomNavigationBar: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).viewPadding.bottom + 10,
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

class SubMenu extends StatelessWidget {
  final String path;

  const SubMenu({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Menu $path'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          for (var i = 0; i <= Random().nextInt(5); i++)
            SubMenuItem(path: '$path.${i + 1}'),
        ],
      ),
    );
  }
}

class SubMenuItem extends StatelessWidget {
  final String path;

  const SubMenuItem({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Go to menu $path'),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubMenu(path: path),
          ),
        );
      },
    );
  }
}
