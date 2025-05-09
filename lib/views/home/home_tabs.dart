
import 'package:flutter/material.dart';
import 'package:restaurant_foodly/views/home/widget/tab_widget.dart';

import '../../common/app_style.dart';
import '../../constants/constants.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        height: 25,
        width: width,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(25),
          ),
          labelColor: kLightWhite,
          dividerColor: Colors.transparent,
          unselectedLabelColor: kGrayLight,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.zero,
          unselectedLabelStyle: appStyle(12, kGrayLight, FontWeight.normal),
          labelStyle: appStyle(11, kLightWhite, FontWeight.w500),
          tabs: List.generate(orderList.length,(i){
            return TabWidget(text : orderList[i]);
          }
          ),
        ),
      ),
    );
  }
}


