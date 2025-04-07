import 'package:ecommerce_pojo/core/components/product_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyProductsList extends StatelessWidget {
  const DummyProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.53.sp),
      itemBuilder: (context, index) {
        return const ProductCard(
          title: 'Dummy Product',
          image: 'https://via.placeholder.com/150', // dummy image
          price: '10.99',
          oldPrice: '12.99',
          enableSekelton: true,
        );
      },
    );
  }
}
