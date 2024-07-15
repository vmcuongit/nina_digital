part of '../product_detail_screen.dart';

class _DescriptionWidget extends ConsumerStatefulWidget {
  const _DescriptionWidget({super.key});

  @override
  ConsumerState createState() => __DescriptionWidgetState();
}

class __DescriptionWidgetState extends ConsumerState<_DescriptionWidget> {
  final double _maxHeightContent = 300;
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mô tả sản phẩm',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: (_showMore == false) ? _maxHeightContent : null,
                child: Wrap(
                  children: [
                    HtmlWidget(
                      '''
                    <div class="e8lZp3"><p class="QN2lPu">VASELINE BODY TONE-UP, SỮA DƯỠNG THỂ NÂNG TÔNG TỨC THÌ </p><div class="QN2lPu"><div style="position: relative; width: 100%; padding-bottom: 100%;"><div class="P7IbkE" style="position: absolute; left: 0px; right: 0px; width: 100%; height: 100%;"><img width="invalid-value" height="invalid-value" class="GqYslU hnult1" style="object-fit: contain" src="https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-lu1zukdu9wy951"></div></div></div><div class="QN2lPu"><div style="position: relative; width: 100%; padding-bottom: 100%;"><div class="P7IbkE" style="position: absolute; left: 0px; right: 0px; width: 100%; height: 100%;"><img width="invalid-value" height="invalid-value" class="GqYslU hnult1" style="object-fit: contain" src="https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-lu1zukdubbip92"></div></div></div><div class="QN2lPu"><div style="position: relative; width: 100%; padding-bottom: 100%;"><div class="P7IbkE" style="position: absolute; left: 0px; right: 0px; width: 100%; height: 100%;"><img width="invalid-value" height="invalid-value" class="GqYslU hnult1" style="object-fit: contain" src="https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-lu1zukducq357b"></div></div></div><p class="QN2lPu">Nâng tông: Công thức với các vi chất phản quang giúp da trông sáng rạng rỡ tức thì gấp 4 lần* và đóng vai trò như màng lọc tia UV bảo vệ da khỏi tác hại của ánh nắng mặt trời. </p><p class="QN2lPu">Cải thiện: Niacinamide giúp ngăn ngừa các hư tổn tích tụ trong tế bào da, giúp cải thiện tình trạng da sạm màu hiệu quả. </p><p class="QN2lPu">Thúc đẩy: Hệ Vitamin kép từ Vitamin C và E giúp thúc đẩy quá trình sản sinh collagen, cho da trông căng mịn và săn chắc. </p><p class="QN2lPu">Phục hồi: Các giọt Vaseline Jelly giúp khóa ẩm từ sâu bên trong** và cân bằng độ ẩm cho da.</p><p class="QN2lPu">
</p><p class="QN2lPu">Cảm nhận làn da trông sáng rạng rỡ tức thì gấp 4 lần* cùng Tinh chất Dưỡng thể Nâng Tông Vaseline!</p><p class="QN2lPu">
</p><p class="QN2lPu">*Dựa theo kết quả kiểm nghiệm, so với sữa dưỡng thể không có chức năng dưỡng sáng. Kết quả này có thể thay đổi tùy vào màu da người.</p><p class="QN2lPu">**Ở tầng biểu bì.</p><p class="QN2lPu">
</p><p class="QN2lPu">Hướng dẫn sử dụng: Để đạt hiệu quả tối ưu, làm sạch da trước khi sử dụng để da thông thoáng, dễ hấp thu dưỡng chất. Thoa đều sản phẩm lên cánh tay, chân và toàn thân để tránh sản phẩm dính lên quần áo. Nên sử dụng 2 lần mỗi ngày. </p><p class="QN2lPu">HSD: 2 năm kể từ ngày sản xuất</p><p class="QN2lPu">Xuất xứ : Thái Lan</p><p class="QN2lPu">Bao bì cũ 320ml, bao bì mới 300ml</p><p class="QN2lPu">
</p><p class="QN2lPu">***  Bao bì có thể thay đổi tùy đợt nhập hàng</p><p class="QN2lPu">
</p><p class="QN2lPu">#Vaseline #VaselineToneUp #SerumToneUp #SangDaTucThi  #Serum #Chong_nang #SPF50 #Chinh_Hang #Vaseline_Thai #Sua_duong_the #Trang_da #Duong_body </p><p class="QN2lPu">  </p><p class="QN2lPu">  kem dưỡng ẩm da dầu, kem duong am da dau, kem dưỡng ẩm body cho da khô, kem duong am body cho da kho, kem dưỡng ẩm toàn thân, kem duong am toan than, sữa dưỡng thể dưỡng ẩm, sua duong the duong am, duong da sang khoe, dưỡng da sáng khoẻ</p></div>
                    ''',
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            if (_showMore == false)
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (_showMore == false)
                  ? [
                      Text('Xem thêm'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.keyboard_arrow_down_sharp),
                    ]
                  : [
                      Text('Thu gọn'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.keyboard_arrow_up_sharp),
                    ],
            ),
          ),
        )
      ],
    );
  }
}
