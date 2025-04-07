import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/core/components/dummy_products_list.dart';
import 'package:ecommerce_pojo/core/components/real_products_list.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  final int? limit;
  final String? categoryId;
  const ProductsScreen({super.key,this.categoryId, this.limit });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<ProductBloc>()..add(GetAllProductsEvent(categoryId: categoryId, limit: limit ?? 6)),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state.allProductsRequestState == RequestState.loading) {
            } else if (state.allProductsRequestState == RequestState.loaded) {
            } else if (state.allProductsRequestState == RequestState.error) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) =>
                    CustomAlertDialog(message: state.failure?.message),
              );
            }
          },
          builder: (context, state) {
            if (state.allProductsRequestState == RequestState.loading) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: const DummyProductsList(),
                ),
              );
            } else if (state.allProductsRequestState == RequestState.loaded) {
              final products = state.productModel?.data ?? [];
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: RealProductsList(
                    products: products,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
