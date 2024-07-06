import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: AppCircularContainer(
                    backgroundColor: AppColors.textWhite.withOpacity(0.1))),
            Positioned(
              top: 100,
              right: -300,
              child: AppCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
