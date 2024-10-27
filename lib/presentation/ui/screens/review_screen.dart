import 'package:e_commerce_app/presentation/state_holders/product_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final String productId = Get.arguments;

  @override
  void initState() {
    Get.find<ProductReviewController>().productReviewRequest(productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Review"),
      ),
      body: GetBuilder<ProductReviewController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: controller.reviewListLength != 0
              ? ListView.separated(
                  itemBuilder: (context, index) => Visibility(
                        visible: !controller.productReviewInProgress,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: Card(
                          elevation: 3,
                          child: ClipRRect(
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Text(controller
                                          .reviewList[index].profile!.cusName ??
                                      "Review"),
                                  Text(controller
                                          .reviewList[index].description ??
                                      "No Description"),
                                  Text(controller.reviewList[index].rating ??
                                      "No Description"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: controller.reviewListLength)
              : const Center(
                  child: Text("NO REVIEW of This PRoduct"),
                ),
        );
      }),
    );
  }
}
