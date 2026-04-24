import 'package:bookly/Features/home/presentation/views/widgets/custom_newest_book_list_view_item_loading.dart';
import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewLoading extends StatelessWidget {
  const NewestBooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CustomNewestBookListViewItemLoading(),
            );
          },
        ),
      ),
    );
  }
}
