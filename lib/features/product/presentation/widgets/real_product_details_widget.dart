import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_toast.dart';
import 'package:ecommerce_pojo/core/components/heart_button.dart';
import 'package:ecommerce_pojo/core/components/indicators_container.dart';
import 'package:ecommerce_pojo/core/components/product_counter.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:ecommerce_pojo/features/product/presentation/widgets/color_options_widget.dart';
import 'package:ecommerce_pojo/features/product/presentation/widgets/container_widget.dart';
import 'package:ecommerce_pojo/features/product/presentation/widgets/rating_widget.dart';
import 'package:ecommerce_pojo/features/product/presentation/widgets/size_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RealProductDetailsWidget extends StatefulWidget {
  final Data? productDetails;
  const RealProductDetailsWidget({super.key, required this.productDetails});

  @override
  State<RealProductDetailsWidget> createState() =>
      _RealProductDetailsWidgetState();
}

class _RealProductDetailsWidgetState extends State<RealProductDetailsWidget> {
  late PageController pageController;
  bool isFavorite = false;
  int counter = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _isLoading = widget.productDetails == null;

    if (_isLoading) {
      _fetchProductDetails();
    }
  }

  Future<void> _fetchProductDetails() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      await Future.delayed(const Duration(seconds: 3));

      if (mounted) {
        setState(() {
          _isLoading = false; // Simplest case: assume fetch succeeded
        });
      }
    } catch (error) {
      // Handle error state appropriately
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void incrementCounter(int value) {
    if (counter >= 10) return;
    setState(() {
      counter++;
    });
  }

  void decrementCounter(int value) {
    if (counter <= 1) return;
    setState(() {
      if (counter > 1) counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentProductDetails = widget.productDetails;
    return Skeletonizer(
      enableSwitchAnimation: true,
      enabled: _isLoading,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  // PageView for images
                  SizedBox(
                    height: 290.h,
                    child: PageView.builder(
                      itemCount: _isLoading
                          ? 3
                          : currentProductDetails?.images?.length ?? 0,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        final imageUrl = _isLoading
                            ? ''
                            : currentProductDetails?.images?[index] ?? '';
                        return Skeleton.replace(
                          height: 290.h,
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            width: double.infinity,
                            height: 290.h,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Skeletonizer(
                              enabled: true,
                              child: Skeleton.leaf(
                                child: Container(color: Colors.grey[300]),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                      left: 8.w,
                      top: 44.h,
                    ),
                    child: Row(
                      children: [
                        Skeleton.ignore(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: _isLoading
                                  ? Colors.grey
                                  : Theme.of(context).cardColor,
                              size: 32.sp,
                            ),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    context.pop();
                                  },
                          ),
                        ),
                        const Spacer(),
                        Skeleton.ignore(
                          child: HeartButton(
                            size: 32,
                            isSelected: isFavorite,
                            onTap: _isLoading ? null : favorite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 241.h),
                    child: Column(
                      children: [
                        IndicatorsContainer(
                          controller: pageController,
                          pagesCount: _isLoading
                              ? 3
                              : currentProductDetails?.images?.length ?? 0,
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Skeleton.shade(
                                child: Row(
                                  children: [
                                    ContainerWidget(
                                        text: AppStrings.topRated,
                                        color: AppColors.blue),
                                    SizedBox(width: 8.w),
                                    ContainerWidget(
                                        text: AppStrings.freeShipping,
                                        color: AppColors.orange),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 253.w,
                                    child: Text(
                                      currentProductDetails?.title ??
                                          'Product Title',
                                      style: Styles().getHeadline3BoldStyle(
                                          color: Theme.of(context).cardColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        _isLoading
                                            ? '\$---.--'
                                            : currentProductDetails
                                                        ?.priceAfterDiscount !=
                                                    null
                                                ? "\$${currentProductDetails?.priceAfterDiscount}"
                                                : "\$${currentProductDetails?.price ?? '--.--'}",
                                        style: Styles().getHeadline3BoldStyle(
                                            color: Theme.of(context).cardColor),
                                      ),
                                      Text(
                                        currentProductDetails
                                                    ?.priceAfterDiscount ==
                                                null
                                            ? ''
                                            : "\$${currentProductDetails?.price ?? ''}",
                                        style: Styles()
                                            .getBody2RegularStyle(
                                                color: Theme.of(context)
                                                    .hoverColor)
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Theme.of(context).hoverColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Skeleton.unite(
                                child: RatingWidget(
                                    ratingsAverage:
                                        currentProductDetails?.ratingsAverage ??
                                            0,
                                    ratingsQuantity: currentProductDetails
                                            ?.ratingsQuantity ??
                                        0),
                              ),
                              SizedBox(height: 12.h),
                              ReadMoreText(
                                style: Styles().getBody2RegularStyle(
                                    color: Theme.of(context).hoverColor),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: " ${AppStrings.readMore}",
                                trimExpandedText: " ${AppStrings.readLess}",
                                moreStyle: Styles().getCaptionRegularStyle(
                                    color: Theme.of(context).primaryColor),
                                lessStyle: Styles().getCaptionRegularStyle(
                                    color: Theme.of(context).primaryColor),
                                trimLines: _isLoading ? 3 : 5,
                                colorClickableText:
                                    Theme.of(context).primaryColor,
                                currentProductDetails?.description ??
                                    AppStrings.productInfo,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                AppStrings.color,
                                style: Styles().getCaptionSemiBoldStyle(
                                    color: Theme.of(context).cardColor),
                              ),
                              SizedBox(height: 8.h),
                              const Skeleton.unite(child: ColorOption()),
                              SizedBox(height: 12.h),
                              if (_isLoading ||
                                  (currentProductDetails?.category?.slug
                                          ?.contains('fashion') ??
                                      false)) ...[
                                Text(
                                  // Static text
                                  AppStrings.size,
                                  style: Styles().getCaptionSemiBoldStyle(
                                      color: Theme.of(context).cardColor),
                                ),
                                SizedBox(height: 8.h),
                                const Skeleton.unite(
                                    child: SizeOptionsWidget()),
                                SizedBox(height: 12.h),
                              ],
                              Text(
                                // Static text
                                AppStrings.quantity,
                                style: Styles().getCaptionSemiBoldStyle(
                                    color: Theme.of(context).cardColor),
                              ),
                              SizedBox(height: 8.h),
                              Skeleton.leaf(
                                child: ProductCounter(
                                  // Assuming counter is local state
                                  counter: counter,
                                  add: incrementCounter,
                                  remove: decrementCounter,
                                ),
                              ),
                              SizedBox(height: 46.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Skeleton.leaf(
                                      child: CustomElevatedButton(
                                        text: AppStrings.buyNow,
                                        onPressed:
                                            () {}, // Add your buy now logic
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        textColor: Theme.of(context).cardColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Skeleton.leaf(
                                      child: CustomElevatedButton(
                                        onPressed: () {
                                          context.read<CartBloc>()
                                              .add(AddToCartEvent(
                                                  productId:
                                                      currentProductDetails
                                                              ?.id ??
                                                          ''));
                                          CustomToast.show(
                                              context: context,
                                              message: AppStrings.productToast,
                                              clickableText:
                                                  AppStrings.viewCart,
                                              onClick: () {
                                                context.go(PageRouteName.cart);
                                              });
                                        },
                                        text: AppStrings.addToCart,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
