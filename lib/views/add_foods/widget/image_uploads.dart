import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_foodly/common/custom_button.dart';
import 'package:restaurant_foodly/controller/uploader_controller.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';


class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});

  final Function() back;
  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
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
                  text: "Upload Images",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to upload at least 2 images to proceed",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image One
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('one');
                        },
                        child: Obx(() => Container(
                          height: 120,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageOne.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark, FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              controller.imageOne.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                      // Image Two
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('two');
                        },
                        child: Obx(() => Container(
                          height: 120,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageTwo.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark, FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              controller.imageTwo.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image Three
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('three');
                        },
                        child: Obx(() => Container(
                          height: 120,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageThree.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark, FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              controller.imageThree.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                      // Image Four
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('four');
                        },
                        child: Obx(() => Container(
                          height: 120,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageFour.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark, FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              controller.imageFour.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "Back",
                        btnWidth: width / 2.3,
                        btnRadius: 9,
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
                          /* if(controller.images.length>2){
                            next();
                          } else{
                            Get.snackbar(
                              colorText: kLightWhite,
                                backgroundColor: kPrimary,
                                snackPosition: SnackPosition.TOP,
                                "Upload required images",
                                "Please upload at least 2 images"
                            );
                          }
                        },*/
                        }

                      ),
                    ],
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
