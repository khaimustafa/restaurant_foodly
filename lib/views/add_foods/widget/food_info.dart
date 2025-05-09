
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_foodly/common/custom_button.dart';

import 'package:restaurant_foodly/controller/uploader_controller.dart';

import '../../../common/app_style.dart';
import '../../../common/custome_textfield.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../controller/food_controller.dart';


class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key, required this.back, required this.next, required this.title,
    required this.description, required this.price,
    required this.preparation, required this.types});

  final Function() back;
  final Function() next;
  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController price;
  final TextEditingController preparation;
  final TextEditingController types;

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
                  text: "Add details",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to fill the information correctly",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomeTextField(
                  controller: title,
                    hintText: "Title",
                    prefixIcon: const Icon(Icons.keyboard_capslock)),

                const SizedBox(height: 15,),

                CustomeTextField(
                    controller: description,
                    hintText: "Add food description",
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    prefixIcon: const Icon(Icons.keyboard_capslock)),

                const SizedBox(height: 15,),

                CustomeTextField(
                    controller: preparation,
                    hintText: "Food preparation time",
                    prefixIcon: const Icon(Icons.keyboard_capslock)),

                const SizedBox(height: 15,),

                CustomeTextField(
                    controller: price,
                    hintText: "Price with no currency e.g 100",
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.money)),

                const SizedBox(height: 15,),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Food Types",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to types which help with food search",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(()=>Column(
              children: [
                CustomeTextField(
                    controller: types,
                    hintText: "Breakfast / Lunch / Dinner / Snacks / Drinks",
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.money)),

                const SizedBox(
                  height: 15,
                ),

                controller.types.isNotEmpty?
                Row(
                    children:
                    List.generate(controller.types.length, (i){
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ReusableText(text: controller.types[i],
                                style: appStyle(9, kLightWhite, FontWeight.normal)
                            ),
                          ),
                        ),
                      );
                    })

                )
                    : const SizedBox.shrink(),
                const SizedBox(height: 15),
                CustomButton(
                  text: "Add food types",
                  btnColor: kSecondary,
                  onTap: (){
                    controller.setTypes = types.text;
                    types.text = "";
                  }, btnRadius: 6,)
              ],
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Back",
                  btnWidth: width / 2.3,
                  btnRadius: 6,
                  onTap: () {
                    back();
                  },
                ),
                CustomButton(
                    text: "Next",
                    btnWidth: width / 2.3,
                    btnRadius: 9,
                    onTap: () {
                      next();
                    }

                ),
              ],
            ),
          ),

                ],

              ),
            );

  }
}
