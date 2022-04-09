import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_icons.dart';
import 'package:clone_ifood/core/theme/app_typography.dart';
import 'package:clone_ifood/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantItemComponent extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantItemComponent({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(restaurant.photoUrl),
                radius: 30,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: AppTypography.localTextStyle(context),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      AppIcon(
                        AppIcons.star,
                        color: Colors.amber,
                        size: 10.0,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(restaurant.rate.toString(),
                          style: AppTypography.restaurantDetails(context)!
                              .copyWith(color: Colors.amber)),
                      SizedBox(
                        width: 4,
                      ),
                      _Dot(),
                      SizedBox(
                        width: 4,
                      ),
                      Text(restaurant.category,
                          style: AppTypography.restaurantDetails(context)),
                      SizedBox(
                        width: 4,
                      ),
                      _Dot(),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        restaurant.distance,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(restaurant.time[0].toString(),
                          style: AppTypography.restaurantDetails(context)),
                      Text('-',
                          style: AppTypography.restaurantDetails(context)),
                      Text(restaurant.time[1].toString(),
                          style: AppTypography.restaurantDetails(context)),
                      _Dot(),
                      Text(restaurant.deliveryTaxe,
                          style: AppTypography.restaurantDetails(context)),
                    ],
                  )
                ],
              ),
            ],
          ),
          AppIcon(AppIcons.favline, color: Colors.black, size: 18)
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '•',
      style: TextStyle(fontSize: 9, color: AppColors.grey7),
    );
  }
}

List<Restaurant> restaurants = [
  Restaurant(
      name: 'CobraKai',
      photoUrl:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sushi-bar-restaurant-logo-design-template-a917bf7521aa74b08179cad073df41c1_screen.jpg?ts=1597302425",
      category: 'Japonesa',
      deliveryTaxe: 'R\$ 5,99',
      distance: '4,1m',
      rate: 4.6,
      time: [60, 80],
      favorite: false),
  Restaurant(
      name: 'CobraKai',
      photoUrl:
          "https://i.pinimg.com/736x/58/ba/8b/58ba8bc8d560d03e5de064a222a52564.jpg",
      category: 'Japonesa',
      deliveryTaxe: 'R\$ 5,99',
      distance: '4,1m',
      rate: 4.6,
      time: [60, 80],
      favorite: false),
  Restaurant(
      name: 'CobraKai',
      photoUrl:
          "https://image.freepik.com/free-vector/vintage-restaurant-logo_23-2148459010.jpg",
      category: 'Japonesa',
      deliveryTaxe: 'R\$ 5,99',
      distance: '4,1m',
      rate: 4.6,
      time: [60, 80],
      favorite: false),
  Restaurant(
      name: 'CobraKai',
      photoUrl:
          "https://st2.depositphotos.com/7109552/11377/v/600/depositphotos_113775112-stock-illustration-vintage-restaurant-and-cafe-label.jpg",
      category: 'Japonesa',
      deliveryTaxe: 'R\$ 5,99',
      distance: '4,1m',
      rate: 4.6,
      time: [60, 80],
      favorite: false),
];
