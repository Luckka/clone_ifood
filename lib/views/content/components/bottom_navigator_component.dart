import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_icons.dart';
import 'package:flutter/material.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final List<BotomNavigatorItemComponent> itens;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorComponent(
      {Key? key,
      required this.itens,
      this.currentIndex = 0,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.grey3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: itens
                  .map((e) => e.copyWith(
                      isActive: itens.indexOf(e) == currentIndex,
                      onTap: () => onTap(itens.indexOf(e))))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BotomNavigatorItemComponent extends StatelessWidget {
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;
  final VoidCallback onTap;

  BotomNavigatorItemComponent copyWith(
      {String? label,
      String? activeIcon,
      String? icon,
      bool? isActive,
      VoidCallback? onTap}) {
    return BotomNavigatorItemComponent(
        label: label ?? this.label,
        activeIcon: activeIcon ?? this.activeIcon,
        icon: icon ?? this.icon,
        isActive: isActive ?? this.isActive,
        onTap: onTap ?? this.onTap);
  }

  const BotomNavigatorItemComponent(
      {Key? key,
      required this.label,
      required this.activeIcon,
      required this.icon,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
        child: Column(children: [
          AppIcon(isActive ? activeIcon : icon, color: Colors.black),
          Text(label)
        ]),
      ),
    );
  }
}
