import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String pathIcons = 'assets/icons/';

class AppIcons {
  static const arrowDown = '${pathIcons}arrow_down.svg';
  static const fav = '${pathIcons}fav.svg';
  static const favline = '${pathIcons}fav_line.svg';
  static const offer = '${pathIcons}offer.svg';
  static const star = '${pathIcons}star.svg';
  //Bottom Navigator
  static const homeActive = '${pathIcons}bottom/home_active.svg';
  static const home = '${pathIcons}bottom/home.svg';
  static const search = '${pathIcons}bottom/search.svg';
  static const searchActive = '${pathIcons}bottom/search_active.svg';
  static const orders = '${pathIcons}bottom/orders.svg';
  static const ordersActive = '${pathIcons}bottom/orders_active.svg';
  static const profile = '${pathIcons}bottom/profile.svg';
  static const profileActive = '${pathIcons}bottom/profile_active.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final double size;

  const AppIcon(this.icon, {Key? key, required this.color, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: size,
      width: size,
    );
  }
}
