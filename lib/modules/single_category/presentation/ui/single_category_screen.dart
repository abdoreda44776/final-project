import 'package:flutter/material.dart';
import 'package:iti_final_project/modules/single_category/presentation/ui/widgets/single_category_list_view.dart';
import 'package:iti_final_project/modules/single_category/presentation/ui/widgets/single_category_top_bar.dart';

class SingleCategoryScreen extends StatelessWidget {
  const SingleCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleCategoryTopBar(),
            SingleCategoryListView(),
          ],
        ),
      ),
    );
  }
}
