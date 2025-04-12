import 'package:ecommerce_pojo/core/components/category_card.dart';
import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/shared/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryBloc>()..add(GetAllCategoriesEvent()),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state.getAllCategoriesRequestState == RequestState.loading) {
            context.loaderOverlay.show();
          } else if (state.getAllCategoriesRequestState ==
              RequestState.loaded) {
            context.loaderOverlay.hide();
          } else if (state.getAllCategoriesRequestState == RequestState.error) {
            context.loaderOverlay.hide();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  CustomAlertDialog(message: state.failure?.message),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9.sp,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 8.w),
                        itemCount: state.categoryModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var data = state.categoryModel?.data?[index];
                          return CategoryCard(
                            categoryId: data?.sId ?? '',
                            image: data?.image ?? '',
                            title: data?.name ?? '',
                            height: 100,
                            width: 160,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
