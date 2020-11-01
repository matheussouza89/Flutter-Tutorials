import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/card_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowersCard extends StatelessWidget {
  final RestaurantController controller;

  FollowersCard(this.controller);

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: "Followers",
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.followerList.length,
          itemBuilder: (context, index) {
            return Padding(
              child: Text(
                "${controller.followerList[index]}",
                style: TextStyle(fontSize: 16),
              ),
              padding: EdgeInsets.all(8),
            );
          },
        ),
      ),
    );
  }
}
