import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wine_explorer/controllers/reviews_controller.dart';
import 'package:wine_explorer/models/review/reviews_model.dart';
import 'package:wine_explorer/pages/reviews/components/review_item_component.dart';

class ReviewsPage extends StatefulWidget {
  final int wineId;
  ReviewsPage({super.key, required this.wineId});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  ReviewsModel? _reviewsModel;
  
  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hodnocení"),
      ),
      body: SingleChildScrollView(
        child: Visibility(
          visible: _reviewsModel != null,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _reviewsModel?.reviews.length,
            itemBuilder: ((context, index) {
              return ReviewItemWidget(
                imageUrl:
                    _reviewsModel!.reviews[index].reviewUserModel.image.location,
                name: _reviewsModel!.reviews[index].reviewUserModel.alias,
                text: _reviewsModel!.reviews[index].note,
                rating: _reviewsModel!.reviews[index].rating,
                date: _reviewsModel!.reviews[index].createdAt,
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> _loadReviews() async {
    ReviewsController reviewsController = ReviewsController();
    EasyLoading.show(status: "Načítám seznam...", dismissOnTap: false);
    ReviewsModel? reviewsModel =
        await reviewsController.getReviews(widget.wineId);
    EasyLoading.dismiss();
    if (reviewsModel == null) {
      debugPrint("Unexpected, reviewsModel is null");
      return;
    }
    debugPrint(reviewsModel.toString());
    setState(() {
      _reviewsModel = reviewsModel;
    });
  }
}
