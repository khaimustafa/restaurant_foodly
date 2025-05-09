import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_foodly/views/add_foods/add_foods.dart';
import 'package:restaurant_foodly/views/home/food/food_list.dart';

import '../../../common/home_tile.dart';
import '../../../constants/constants.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 70,
      decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeTile(
                onTap: () {
                  Get.to( ()=> const AddFoods(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 900)
                  );
                },
                text: "Add Foods",
                iconPath: "assets/icons/taco.svg"),

            HomeTile(
                onTap: () {},
                text: "Wallet",
                iconPath: "assets/icons/wallet.svg"),

            HomeTile(
                onTap: () {
                  Get.to( ()=> const FoodList(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900)
                  );
                },
                text: "Foods",
                iconPath: "assets/icons/french_fries.svg"),

            HomeTile(
                onTap: () {},
                text: "Self Deliveries",
                iconPath: "assets/icons/deliver_food.svg"),


          ],
        ),
      ),
    );
  }
}
