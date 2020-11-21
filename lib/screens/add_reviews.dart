import 'package:CWCFlutter/controllers/restaurant_controller.dart';
import 'package:CWCFlutter/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviews extends StatelessWidget {
  final nameInputController = TextEditingController();
  final reviewInputController = TextEditingController();
  final restoController = RestaurantController.to;

  @override
  Widget build(BuildContext context) {
    print("AddReviews screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Reviews")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "Name",
              onSubmit: (value) => print(value),
              editingController: nameInputController,
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Review",
              onSubmit: (value) => print(value),
              editingController: reviewInputController,
            ),
            SizedBox(height: 16),
            FlatButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => restoController.addReview(
                nameInputController.text,
                reviewInputController.text,
              ),
              color: Colors.deepOrange,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: restoController.reviews.length,
                itemBuilder: (context, index) {
                  MapEntry reviewEntry = restoController.reviews.entries.elementAt(index);

                  return ListTile(
                    title: Column(
                      children: [
                        Text(reviewEntry.key),
                        Text(reviewEntry.value),
                      ],
                    ),
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