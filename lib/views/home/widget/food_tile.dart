import 'package:flutter/cupertino.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';

import '../../../constants/constants.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key, required this.food,
  });

  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 62,
                    height: 62,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(food['imageUrl'], fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableText(
                        text: food['title'], style: appStyle(11, kDark, FontWeight.w500)),
                    ReusableText(
                        text: "Delivery Time:  ${food['time']}", style: appStyle(9, kGray, FontWeight.w500)),

                    SizedBox(
                      height: 16,
                      width: width*0.7,
                      child: ListView.builder
                        (itemCount: food['additives'].length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, i){
                          String title = food['additives'][i]['title'];
                          return Container(
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: kSecondaryLight,
                              borderRadius: BorderRadius.circular(9)
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ReusableText(text: title, style: appStyle(8, kGray, FontWeight.w500)),
                              ),
                            ),

                          );
                         }
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              right: 5,
                top: 5,
                child: Container(
              height: 19,
              width: 60,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: ReusableText(
                    text: "\$${food['price'].toStringAsFixed(2)}",
                    style: appStyle(12, kLightWhite, FontWeight.bold) ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}