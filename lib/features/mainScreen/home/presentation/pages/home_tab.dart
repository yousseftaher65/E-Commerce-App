// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/category_card.dart';
import 'package:ecommerce_pojo/core/components/product_card.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/mainScreen/home/presentation/widgets/banner_widget.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:ecommerce_pojo/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_pojo/features/shared/presentation/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Theme.of(context).brightness == Brightness.dark
            ? Image.asset(
                Assets.logos.appLogoDark.path,
                height: 32.h,
                width: 104.w,
              )
            : Image.asset(
                Assets.logos.appLogoLight.path,
                height: 32.h,
                width: 104.w,
              ),
        actions: [
          Theme.of(context).brightness == Brightness.dark
              ? Image.asset(
                  Assets.icons.search1.path,
                  height: 32.h,
                  width: 32.w,
                )
              : Image.asset(
                  Assets.icons.search2.path,
                  height: 32.h,
                  width: 32.w,
                ),
          Container(
            height: 32.h,
            width: 32.w,
            margin: EdgeInsetsDirectional.only(end: 16.w, start: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: BannerWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 34.h)),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) =>
                    getIt<CategoryBloc>()..add(GetAllCategoriesEvent()),
                child: BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, state) {
                   
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: Styles().getHeadline3BoldStyle(
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go(PageRouteName.categories);
                              },
                              child: Text(
                                'See All',
                                style: Styles().getOverlineSemiBoldStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          height: 87.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5, // Example category count
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 12.w),
                            itemBuilder: (context, index) {
                              var data = state.categoryModel?.data?[index];
                              return CategoryCard(
                                  image: data?.image ?? '',
                                  title: data?.name ?? '',
                                  height: 60,
                                  width: 76,
                                  categoryId: data?.sId ?? '');
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Products',
                    style: Styles().getHeadline3BoldStyle(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // context.go(PageRouteName.products);
                    },
                    child: Text(
                      'See All',
                      style: Styles().getOverlineSemiBoldStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<WishlistBloc>()),
                BlocProvider(
                  create: (context) =>
                      getIt<ProductBloc>()..add(GetAllProductsEvent(limit: 6)),
                ),
              ],
              child: BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: 0.53.sp,
                    ),
                    itemCount: state.productModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var data = state.productModel?.data?[index];
                      return ProductCard(
                        colors: const [
                          AppColors.cyan,
                          AppColors.purpel,
                          AppColors.orange
                        ],
                        colorsListNum: 3,
                        colorsNum: 3,
                        title: data?.title ?? '',
                        image: data?.imageCover ?? '',
                        price: data?.priceAfterDiscount != null
                            ? "\$${data?.priceAfterDiscount.toString()}"
                            : "\$${data?.price.toString()}",
                        oldPrice: data?.priceAfterDiscount == null
                            ? ''
                            : "\$${data?.price.toString()}",
                        productId: data?.id ?? '',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
