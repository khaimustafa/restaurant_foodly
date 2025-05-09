import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/constants/uidata.dart';
import 'package:restaurant_foodly/controller/food_controller.dart';

class ChooseCategories extends HookWidget{
  const ChooseCategories( {super.key, required this.next }  );

  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: hieght,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Pick Category",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to pick a category to continue adding a food item",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),

          SizedBox(
            height: hieght*0.8,
            child: ListView.builder(
              itemCount: categories.length,
                itemBuilder: (context, i){
                final category = categories[i];
              return ListTile(
                onTap: (){
                  controller.setCategory = category['_id'];
                  next();
                },
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimary,
                  child: Image.asset(
                    category['imageUrl'],
                    fit: BoxFit.contain,
                  ),
                ),
                title: ReusableText(
                  text: category['title'],
                  style: appStyle(12, kGray, FontWeight.normal),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: kGray,
                  size: 15,
                ),
              );
                },
            ),
          ),
        ],
      ),
    );
  }
}