import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/mainScreen/category/presentation/widgets/sub_category_card_widget.dart';
import 'package:ecommerce_pojo/features/shared/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  const SubCategoriesScreen(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<CategoryBloc>()
        ..add(GetSubCategoriesEvent(categoryId: categoryId)),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state.getSubCategoriesRequestState == RequestState.loading) {
            //context.loaderOverlay.show();
          } else if (state.getSubCategoriesRequestState ==
              RequestState.loaded) {
            //context.loaderOverlay.hide();
          } else if (state.getSubCategoriesRequestState == RequestState.error) {
            //context.loaderOverlay.hide();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  CustomAlertDialog(message: state.failure?.message),
            );
          }
        },
        builder: (context, state) {
          if (state.getSubCategoriesRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.cyan),
            );
          } else if (state.getSubCategoriesRequestState == RequestState.loaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  categoryName,
                  style: Styles()
                      .getBody2MeduimStyle(color: Theme.of(context).cardColor),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                  if(state.subCategoryModel?.results == 0)
                    ...[
                     const Spacer(),
                      Center(
                      child: Text('No Sub Categories Found' , style: Styles().getBody2RegularStyle(color: Theme.of(context).cardColor),),
                    ),
                  ],
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5.sp,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h),
                      itemCount: state.subCategoryModel?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = state.subCategoryModel?.data?[index];
                        return SubCategoryCard(
                            image: Assets.images.watch.path,
                            title: data?.name ?? '');
                      },
                    ),
                  ),
                ]),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
