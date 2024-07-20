part of '../add_review_product.dart';

class _RatingBarWidget extends ConsumerStatefulWidget {
  const _RatingBarWidget({super.key});

  @override
  ConsumerState createState() => __RatingBarWidgetState();
}

class __RatingBarWidgetState extends ConsumerState<_RatingBarWidget> {
  double _star = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar(
          minRating: 1,
          maxRating: 5,
          initialRating: _star,
          onRatingUpdate: (value) {
            setState(() {
              _star = value;
            });
          },
          ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star,
                color: Color(0xffFFC833),
              ),
              half: const Icon(
                Icons.star_half,
                color: Color(0xffFFC833),
              ),
              empty: const Icon(
                Icons.star_border_outlined,
                color: Color(0xffbbbbbb),
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          '${_star.round()}/5',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
