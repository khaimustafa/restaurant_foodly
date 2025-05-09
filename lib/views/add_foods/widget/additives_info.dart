
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:restaurant_foodly/common/custome_textfield.dart';
import 'package:restaurant_foodly/controller/food_controller.dart';
import 'package:restaurant_foodly/models/additives_model.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';

class AdditivesInfo extends StatelessWidget {
  const AdditivesInfo({super.key, required this.additivePrice, required this.additiveTitle});

  final TextEditingController additivePrice;
  final TextEditingController additiveTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: hieght,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Additives Info",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to add additives info for your product if it has any",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: hieght * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  CustomeTextField(
                      controller: additiveTitle,
                      hintText: "Additives Title",
                      prefixIcon: const Icon(Icons.keyboard_capslock)),

                  const SizedBox(height: 15,),

                  CustomeTextField(
                      controller: additivePrice,
                      hintText: "Additives Price",
                      prefixIcon: const Icon(Icons.keyboard_capslock)),

                  const SizedBox(height: 15,),

                  Obx(() =>
                  controller.additivesList.isNotEmpty?
                  Column(
                      children:
                      List.generate(controller.additivesList.length, (i){
                        final additive = controller.additivesList[i];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: kGray.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                    text: additive.title,
                                    style: appStyle(11, kLightWhite, FontWeight.normal)),



                                ReusableText(
                                    text: "\$ ${additive.price.toString()}",
                                    style: appStyle(11, kLightWhite, FontWeight.normal))
                              ],
                            )
                          ),
                        );
                      })

                  )
                      : const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 15,),

                  CustomButton(
                    text: "A D D  A D D I T I V E S",
                    btnWidth: width,
                    btnRadius: 9,
                    onTap: () {
                      if(additivePrice.text.isNotEmpty
                      && additiveTitle.text.isNotEmpty
                      ){

                        Additive additive = Additive(
                            id: controller.generateId(),
                            title: additiveTitle.text,
                            price: additivePrice.text
                        );

                        controller.addAdditive =additive;
                        additivePrice.text= '';
                        additiveTitle.text= '';


                      }else{
                        Get.snackbar(
                          colorText: kLightWhite,
                          backgroundColor: kPrimary,
                          "You need data to add additives", "Please fill all the fields"
                        );
                      }

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


