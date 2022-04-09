import 'package:clone_ifood/controller/content_controller.dart';
import 'package:clone_ifood/core/theme/app_banner_images.dart';
import 'package:clone_ifood/core/theme/app_colors.dart';
import 'package:clone_ifood/core/theme/app_icons.dart';
import 'package:clone_ifood/core/theme/app_typography.dart';
import 'package:clone_ifood/models/category.dart';
import 'package:clone_ifood/models/restaurant.dart';
import 'package:clone_ifood/views/content/components/banners_component.dart';
import 'package:clone_ifood/views/content/components/bottom_navigator_component.dart';
import 'package:clone_ifood/views/content/components/filter_component.dart';
import 'package:clone_ifood/views/content/components/header_local_component.dart';
import 'package:clone_ifood/views/content/components/restaurant_list.dart';
import 'package:flutter/material.dart';

import 'components/category_item_component.dart';
import 'components/content_tab_bar_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = ContentController();
  List<Category>? categorys;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categorys = controller.getCategory();
    super.initState();
  }

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: NestedScrollView(
                  physics: BouncingScrollPhysics(),
                  headerSliverBuilder: (context, innetBoxScroll) {
                    return [
                      HeaderLocationComponent(
                          location:
                              'Rua Flores do Campo, Passos - Minas Gerais'),
                      ContentTabBarComponent(
                        controller: tabController,
                        onTap: (index) {},
                      ),
                      FiltersComponent(),
                    ];
                  },
                  body: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await Future.value();
                          },
                          child: CustomScrollView(
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              _CategorySession(
                                categorys: categorys,
                              ),
                              _BannerSession(),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24.0, bottom: 18.0),
                                  child: Text(
                                    'Lojas',
                                    style: AppTypography.sessionTitle(context),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildListDelegate(restaurants
                                    .map((e) => RestaurantItemComponent(
                                          restaurant: e,
                                        ))
                                    .toList()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BottomNavigator(
                        currentIndex: _currentindex,
                        onTap: (index) {
                          setState(() {
                            _currentindex = index;
                          });
                        },
                      )
                    ],
                  )),
            )));
  }
}

class _CategorySession extends StatelessWidget {
  List<Category>? categorys;
  _CategorySession({Key? key, required this.categorys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: 86,
          child: ListView.builder(
              itemCount: categorys!.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 0,
                    right: index == categorys!.length - 1 ? 16 : 10,
                  ),
                  child: CategoryItemComponent(
                    category: categorys![index],
                  ),
                );
              })),
    );
  }
}

class _BannerSession extends StatelessWidget {
  const _BannerSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: 170,
          child: BannersComponent(
            list: [
              BannerItemComponent(imagePath: AppBannerImages.banner1),
              BannerItemComponent(imagePath: AppBannerImages.banner2),
              BannerItemComponent(imagePath: AppBannerImages.banner3),
              BannerItemComponent(imagePath: AppBannerImages.banner4)
            ],
          )),
    );
  }
}

class BottomNavigator extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const BottomNavigator(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      onTap: onTap,
      currentIndex: currentIndex,
      itens: [
        BotomNavigatorItemComponent(
          label: 'Início',
          activeIcon: AppIcons.homeActive,
          icon: AppIcons.home,
          onTap: () {},
        ),
        BotomNavigatorItemComponent(
          label: 'Busca',
          activeIcon: AppIcons.searchActive,
          icon: AppIcons.search,
          onTap: () {},
        ),
        BotomNavigatorItemComponent(
          label: 'Pedidos',
          activeIcon: AppIcons.ordersActive,
          icon: AppIcons.orders,
          onTap: () {},
        ),
        BotomNavigatorItemComponent(
          label: 'Perfil',
          activeIcon: AppIcons.profileActive,
          icon: AppIcons.profile,
          onTap: () {},
        )
      ],
    );
  }
}
