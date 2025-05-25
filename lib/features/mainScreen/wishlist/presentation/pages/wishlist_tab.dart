import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/widgets/cart_product_card.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  int selectedItemsCount = 0;
  Set<String> selectedItems = {};

  void updateSelectedItems(bool isSelected, String? productId) {
    setState(() {
      if (isSelected) {
        selectedItems.add(productId ?? '');
      } else {
        selectedItems.remove(productId ?? '');
      }
      selectedItemsCount = selectedItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WishlistBloc>()..add(const GetWishlistItemsEvent()),
      child: BlocConsumer<WishlistBloc, WishlistState>(
        listener: (context, state) {
          if (state.getWishlistItemsRequestState ==
              WishlistRequestState.loading) {
            context.loaderOverlay.show();
          } else if (state.getWishlistItemsRequestState ==
              WishlistRequestState.loaded) {
            context.loaderOverlay.hide();
          } else if (state.getWishlistItemsRequestState ==
              WishlistRequestState.error) {
            context.loaderOverlay.hide();
            CustomAlertDialog(
              message: state.failure?.message,
            );
          }
        },
        builder: (context, state) {
          var data = state.wishlistItemModel?.data;
          if (state.getWishlistItemsRequestState ==
                  WishlistRequestState.loaded ||
              state.removeFromWishlistRequestState ==
                  WishlistRequestState.loaded) {
            if (data == null || data.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.emptyCart.path,
                        width: 240.w,
                        height: 240.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.emptyCart,
                        style: Styles().getHeadline2BoldStyle(
                            color: Theme.of(context).cardColor),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.emptyCartContent,
                        style: Styles().getBody2RegularStyle(
                            color: Theme.of(context).hoverColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        text: AppStrings.exploreCategories,
                        onPressed: () {
                          context.go(PageRouteName.categories);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.myCart,
                  style: Styles()
                      .getBody2MeduimStyle(color: Theme.of(context).cardColor),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                    left: 16.0.w, right: 16.0.w, top: 12.0.h, bottom: 16.0.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              onTap: () {
                                context.push(PageRouteName.productDetails,
                                    extra: data[index].id ?? '');
                              },
                              onDelete: () {
                                setState(() {
                                  var productId = data[index].id;

                                  if (selectedItems.contains(productId)) {
                                    selectedItems.remove(productId);
                                    selectedItemsCount = selectedItems
                                        .length; // Update the count
                                  }
                                  context.read<WishlistBloc>().add(
                                        RemoveFromWishlistEvent(
                                          productId: productId ?? '',
                                        ),
                                      );
                                  data.removeAt(index);
                                });
                              },
                              //count: data[index].,
                              imagePath: data[index].imageCover,
                              productName: data[index].title,
                              productPrice: data[index].price.toString(),
                              productId: data[index].id,
                             /*  onCheckboxChanged: (isSelected) {
                                updateSelectedItems(isSelected, data[index].id);
                              }, */
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16.h,
                              ),
                          itemCount: data.length),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
