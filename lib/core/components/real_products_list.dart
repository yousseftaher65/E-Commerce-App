import 'package:ecommerce_pojo/core/components/product_card.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RealProductsList extends StatelessWidget {
  final List<Data>? products;
  final int? itemCount;
  const RealProductsList({super.key , this.products , this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.53.sp,
      ),
      itemBuilder: (context, index) {
        final product = products?[index];
        return ProductCard(
          colors: const [AppColors.cyan, AppColors.purpel, AppColors.orange],
          colorsListNum: 3,
          colorsNum: 3,
          title: product?.title ?? '',
          image: product?.imageCover ?? '',
          price: product?.price != null
              ? "\$${product?.price.toString()}"
              : "\$${product?.price.toString()}",
          oldPrice: product?.price == null
              ? ''
              : "\$${product?.price.toString()}",
              productId: product?.id?.name ?? '',
        );
      },
      itemCount: itemCount ?? products?.length ?? 0,
    );
  }
}
