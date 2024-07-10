part of '../home_screen.dart';

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({super.key});

  Widget _itemCategory() {
    return GestureDetector(
      onTap: () {
        print('chi tiet sp');
      },
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              child: Image.asset(
                '${MediaAssets.images}/danhmuc.jpg',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Loa - Tai nghe',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Danh Mục',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 21,
                    ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Tất cả',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 250,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              reverse: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return _itemCategory();
              },
            ),
          ),
        ],
      ),
    );
  }
}
