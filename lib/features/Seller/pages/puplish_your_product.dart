import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';
import 'package:gradprojectstorio/features/Seller/pages/view_publish_your_product.dart';
import 'package:gradprojectstorio/features/Seller/widgets/add_content_text_form_field.dart';
import 'package:gradprojectstorio/features/Seller/widgets/add_content_text_form_field_another_field.dart';

class PuplishYourProduct extends StatelessWidget {
  const PuplishYourProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppConstants.publishYourProduct,
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Image.asset("images/Icon.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.productName),
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.category),
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.description),
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.price),
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.wight),
            SizedBox(height: 10),
            AddContentInTextFormField(nameContnt: AppConstants.diemnsions),
            SizedBox(height: 10),
            AddContentInTextFormFieldAnotherBody(
              nameContnt: AppConstants.productColor,
            ),
            SizedBox(height: 10),
            AddContentInTextFormFieldAnotherBody(
              nameContnt: AppConstants.productSize,
            ),
            SizedBox(height: 10),
            AddContentInTextFormFieldAnotherBody(
              nameContnt: AppConstants.stockAvailability,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .47,
                    height: 167,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12), //
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/shareimage.png"),
                          SizedBox(width: 7),
                          Text("Home Picture"),
                        ],
                      ),
                    ),
                  ),

                  /////////////
                  ///
                  ///
                  ///
                  ///
                  SizedBox(width: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    height: 167,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12), //
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/shareimage.png"),
                          SizedBox(width: 7),
                        ],
                      ),
                    ),
                  ),

                  /////////////
                  ///
                  ///
                ],
              ),
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewPublishYourProduct(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, //
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor, //
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    AppConstants.publishYourProduct,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
