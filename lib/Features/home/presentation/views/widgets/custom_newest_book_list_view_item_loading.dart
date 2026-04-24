import 'package:flutter/material.dart';

class CustomNewestBookListViewItemLoading extends StatelessWidget {
  const CustomNewestBookListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.6 / 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(color: Colors.grey[50])),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                CustomContainer(width: double.infinity, height: 18),
                const SizedBox(height: 6),
                CustomContainer(width: double.infinity, height: 18),
                const SizedBox(height: 14),
                CustomContainer(
                    width: MediaQuery.of(context).size.width * .35, height: 18),
                const SizedBox(height: 14),
                SizedBox(
                  child: Row(
                    children: [
                      CustomContainer(width: 64, height: 18),
                      const Spacer(),
                      CustomContainer(width: 64, height: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.grey[50],
      ),
    );
  }
}
