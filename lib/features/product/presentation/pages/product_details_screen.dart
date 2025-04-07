import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_pojo/features/product/presentation/widgets/real_product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductBloc>()..add(GetProductDetailsEvent(widget.productId)),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.productDetailsRequestState == RequestState.loading) {
          } else if (state.productDetailsRequestState == RequestState.loaded) {
          } else if (state.productDetailsRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    message: state.failure?.message,
                  );
                });
          }
        },
        builder: (context, state) {
          var bloc = context.read<ProductBloc>();
          var productDetails = bloc.state.productData;
           return RealProductDetailsWidget(productDetails: productDetails);
        },
      ),
    );
  }
}
