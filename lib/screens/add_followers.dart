import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFollowers extends StatelessWidget {
  final restoController = RestaurantController.to;

  @override
  Widget build(BuildContext context) {
    print("AddFollowers screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Follower List")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            RoundedInput(
              hintText: "Follower Name",
              onSubmit: (value) => restoController.addFollower(value),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: restoController.followerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(restoController.followerList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
