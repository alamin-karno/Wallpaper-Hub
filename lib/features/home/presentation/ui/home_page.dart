import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: AppNameWidget(),
          ),
          SliverToBoxAdapter(
            child: MasonryGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 200 * (index % 2 + 1),
                  color: Colors.red,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
