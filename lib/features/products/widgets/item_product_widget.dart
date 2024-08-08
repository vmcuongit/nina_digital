part of '../products_screen.dart';

class _ItemProductWidget extends StatelessWidget {
  const _ItemProductWidget({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final String salePrice =
        '${Helper.numberFormat(double.parse(product['sale_price'].toString()))}đ';

    final String regularPrice =
        '${Helper.numberFormat(double.parse(product['regular_price'].toString()))}đ';

    return GestureDetector(
      onTap: () {
        context.pushNamed(ProductDetailScreen.nameRoute,
            pathParameters: {'id': product['id'].toString()});
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl: '${ApiUrl.thumbProduct}/${product['photo']}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) =>
                      Image.asset(MediaAssets.noImage),
                  fit: BoxFit.fitHeight,
                  height: 200,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 18,
                    backgroundColor: Colors.red,
                    child: Text(
                      '-${product['discount']}%',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product['namevi'],
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(
              height: 7,
            ),
            if (!Helper.isNull(product['sale_price'])) ...[
              Wrap(
                spacing: 10,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: Text(
                      salePrice,
                      key: ValueKey<String>(salePrice),
                      style: const TextStyle(
                          fontSize: 14, color: Colors.redAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      regularPrice,
                      style: const TextStyle(
                          fontSize: 12, decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ],
              )
            ] else ...[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Text(
                  regularPrice,
                  key: ValueKey<String>(regularPrice),
                  style: const TextStyle(fontSize: 14, color: Colors.redAccent),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
