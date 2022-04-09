import 'package:clone_ifood/core/theme/app_icons.dart';
import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class HeaderLocationComponent extends StatelessWidget {
  const HeaderLocationComponent({Key? key, required this.location})
      : super(key: key);

  final String location;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _HeaderLocationComponentDelegate(location),
    );
  }
}

class _HeaderLocationComponentDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  _HeaderLocationComponentDelegate(this.location);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(children: [
                Text(
                  location,
                  style: AppTypography.localTextStyle(context),
                ),
                AppIcon(AppIcons.arrowDown,
                    color: AppColors.primaryColor, size: 20)
              ]),
            ),
          ])
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 65;

  @override
  // TODO: implement minExtent
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
