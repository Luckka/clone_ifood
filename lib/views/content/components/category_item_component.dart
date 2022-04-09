import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_images.dart';
import 'package:clone_ifood/core/theme/app_typography.dart';
import 'package:clone_ifood/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItemComponent extends StatelessWidget {
  const CategoryItemComponent({Key? key, required this.category})
      : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          category.picture,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            category.name,
            style:
                AppTypography.small(context)!.copyWith(color: AppColors.grey),
          ),
        )
      ],
    );
  }
}
