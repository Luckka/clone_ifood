import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_icons.dart';
import 'package:flutter/material.dart';

class FiltersComponent extends StatelessWidget {
  const FiltersComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FiltersComponentDelegate(),
    );
  }
}

class _FiltersComponentDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 54,
      color: AppColors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 16,
          ),
          FilterItemComponent(label: 'Ordenar', icon: AppIcons.arrowDown),
          FilterItemComponent(
            label: 'Pra Retirar',
          ),
          FilterItemComponent(
            label: 'Entra Grátis',
          ),
          FilterItemComponent(
            label: 'Vale Refeição',
          ),
          FilterItemComponent(
            label: 'Distância',
          ),
          FilterItemComponent(
            label: 'Entrega Parceira',
          ),
          FilterItemComponent(
            label: 'Filtros',
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 54;

  @override
  // TODO: implement minExtent
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  final String label;
  final String icon;
  const FilterItemComponent({
    Key? key,
    required this.label,
    this.icon = AppIcons.arrowDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: AppColors.white,
            border: Border.all(color: AppColors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(color: AppColors.grey7),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: AppIcon(icon, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
