import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti_final_project/modules/home/presentation/ui/widgets/home_body.dart';
import 'package:iti_final_project/modules/home/presentation/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeTopBar(),
        Expanded(
          child: SingleChildScrollView(
            child: HomeBody(),
          ),
        ),
      ],
    );
  }
}
