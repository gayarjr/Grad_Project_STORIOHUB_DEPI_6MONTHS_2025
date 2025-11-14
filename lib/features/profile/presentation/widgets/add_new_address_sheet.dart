import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/address_request.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';

class AddNewAddressSheet extends StatefulWidget {
  const AddNewAddressSheet({super.key});

  @override
  State<AddNewAddressSheet> createState() => _AddNewAddressSheetState();
}

class _AddNewAddressSheetState extends State<AddNewAddressSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController _city, _phone, _details, _state;

  @override
  void initState() {
    super.initState();
    _city = TextEditingController();
    _phone = TextEditingController();
    _details = TextEditingController();
    _state = TextEditingController();
  }

  @override
  void dispose() {
    _city.dispose();
    _phone.dispose();
    _details.dispose();
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Address", style: AppStyles.textSemiBold20),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Divider(height: 32.h),
              CustomTextFieldWithLabel(
                controller: _details,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your details';
                  }
                  return null;
                },
                label: 'Details',
                hint: 'Enter your details',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              CustomTextFieldWithLabel(
                controller: _state,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
                label: 'State',
                hint: 'Enter your state',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              CustomTextFieldWithLabel(
                controller: _city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                label: 'City',
                hint: 'Enter your city',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              CustomTextFieldWithLabel(
                controller: _phone,
                validator: Validators.phone,
                label: 'Phone',
                hint: 'Enter your phone',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 32.h),
              BlocListener<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is AddressLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }
                  if (state is AddressLoaded) {
                    Navigator.pop(context);
                    customSnackBar(
                      context,
                      message: 'Address added successfully',
                      type: AnimatedSnackBarType.success,
                    );
                    Navigator.pop(context);
                  }
                  if (state is AddressError) {
                    Navigator.pop(context);
                    customSnackBar(
                      context,
                      message: state.message,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                },
                child: CustomButton(
                  text: 'Add',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<AddressCubit>().addAddress(
                        request: AddressRequest(
                          name: _state.text,
                          city: _city.text,
                          details: _details.text,
                          phone: _phone.text,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
