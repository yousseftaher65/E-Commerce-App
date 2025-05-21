import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/widgets/cart_product_card.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/widgets/order_info_card.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/widgets/voucher_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
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
      create: (context) => getIt<CartBloc>()..add(const GetCartItemsEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.getCartItems == CartRequestState.loading) {
            context.loaderOverlay.show();
          } else if (state.getCartItems == CartRequestState.loaded) {
            context.loaderOverlay.hide();
            // Handle loaded state
          } else if (state.getCartItems == CartRequestState.error) {
            context.loaderOverlay.hide();
            // Handle error state
            CustomAlertDialog(
              message: state.failure?.message,
            );
          }
        },
        builder: (context, state) {
          var data = state.cartItemModel?.data?.products;
          if (state.getCartItems == CartRequestState.loaded ||
              state.removeFromCartRequestState == CartRequestState.loaded) {
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
                actions: [
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return const VoucherCodeWidget();
                          });
                    },
                    child: Text(
                      AppStrings.voucherCode,
                      style: Styles().getBody2MeduimStyle(
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
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
                              onDelete: () {
                                setState(() {
                                  var productId = data[index].product?.id;

                                  if (selectedItems.contains(productId)) {
                                    selectedItems.remove(productId);
                                    selectedItemsCount = selectedItems
                                        .length; // Update the count
                                  }
                                  context.read<CartBloc>().add(
                                        RemoveFromCartEvent(
                                          productId: productId ?? '',
                                        ),
                                      );
                                  data.removeAt(index);
                                });
                              },
                              count: data[index].count,
                              imagePath: data[index].product?.imageCover,
                              productName: data[index].product?.title,
                              productPrice: data[index].price.toString(),
                              productId: data[index].product?.id,
                              onCheckboxChanged: (isSelected) {
                                updateSelectedItems(
                                    isSelected, data[index].product?.id);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16.h,
                              ),
                          itemCount: data.length),
                    ),
                    SizedBox(height: 16.h),
                    OrderInfoCard(
                      totalCartPrice:
                          "${state.cartItemModel?.data?.totalCartPrice.toString()}"
                    ),
                    CustomElevatedButton(
                      text: selectedItemsCount > 0
                          ? "${AppStrings.checkout} ($selectedItemsCount selected)"
                          : AppStrings.checkout,
                      onPressed: selectedItemsCount > 0
                          ? () {
                              // Handle checkout logic
                            }
                          : () {}, // Provide an empty function when no items are selected
                    )
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
