import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/custom_appbar.dart';
import 'package:restaurant_foodly/common/home_tile.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/home/widget/home_tiles.dart';
import 'package:restaurant_foodly/views/home/widget/order/cancelled_orders.dart';
import 'package:restaurant_foodly/views/home/widget/order/delivered_orders.dart';
import 'package:restaurant_foodly/views/home/widget/order/new_orders.dart';
import 'package:restaurant_foodly/views/home/widget/order/picked_orders.dart';
import 'package:restaurant_foodly/views/home/widget/order/preparing.dart';
import 'package:restaurant_foodly/views/home/widget/order/ready_orders.dart';
import 'package:restaurant_foodly/views/home/widget/order/self_deliveries.dart';
import 'package:restaurant_foodly/views/home/widget/tab_widget.dart';

import 'home_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(
      length: orderList.length,
      vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        flexibleSpace: const CustomAppbar(),
      ),
      body: BackGroundContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 15,
            ),
              const HomeTiles(),
            const SizedBox(
              height: 15,
            ),
            HomeTabs(tabController: _tabController),

            const SizedBox(
              height: 15,
            ),

            ClipRRect(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: hieght * 0.7,
                color: Colors.transparent,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewOrders(),
                    Preparing(),
                    ReadyOrders(),
                    PickedOrders(),
                    SelfDeliveries(),
                    DeliveredOrders(),
                    CancelledOrders(),


                  ],
                ),
              ),
            )
          ],

        )
      ),
    );
  }
}
