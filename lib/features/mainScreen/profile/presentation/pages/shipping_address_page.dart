import 'package:ecommerce_pojo/core/components/custom_alert_dialog.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_text_field.dart';
import 'package:ecommerce_pojo/core/components/custom_toast.dart';
import 'package:ecommerce_pojo/core/components/validators.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/text_rich_widget.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.shippingAddress,
          style:
              Styles().getBody2MeduimStyle(color: Theme.of(context).cardColor),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.updateShippingAddressRequestState ==
              ProfileRequestState.loaded) {
            context.pop();
            CustomToast.show(
                imagePath: Assets.icons.success.path,
                context: context,
                message: state.addressResponse?.message ?? '');
          } else if (state.updateShippingAddressRequestState ==
              ProfileRequestState.error) {
            CustomAlertDialog(
                message:
                    state.failure?.message ?? AppStrings.somethingWentWrong);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRichWidget(
                      firstText: AppStrings.fullName, secondText: " *"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    validation: Validators.validateFullName,
                    controller: fullNameController,
                    hint: AppStrings.fullName,
                  ),
                  SizedBox(height: 12.h),
                  TextRichWidget(
                      firstText: AppStrings.phoneNumber, secondText: " *"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hint: AppStrings.phoneNumber,
                    controller: phoneNumberController,
                    validation: Validators.validatePhoneNumber,
                  ),
                  SizedBox(height: 12.h),
                  TextRichWidget(firstText: AppStrings.city, secondText: " *"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hint: AppStrings.city,
                    controller: cityController,
                    validation: Validators.validateFullName,
                  ),
                  SizedBox(height: 12.h),
                  TextRichWidget(
                      firstText: AppStrings.streetAddress, secondText: " *"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hint: AppStrings.streetAddressHint,
                    controller: addressController,
                    validation: Validators.validateAddress,
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    text: AppStrings.save,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ProfileBloc>().add(
                              UpdateShippingAddressEvent(
                                addressModel: AddressModel(
                                  name: fullNameController.text,
                                  phone: phoneNumberController.text,
                                  details: addressController.text,
                                  city: cityController.text,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
