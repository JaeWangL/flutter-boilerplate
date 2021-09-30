import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/styles/colors.dart';
import 'package:flutter_boilerplate/widgets/index.dart';

class DietView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  DietView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImageView(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor:
                    _scrollController.hasClients && _scrollController.offset > 0
                        ? Colors.white.withOpacity(0.8)
                        : Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                expandedHeight: 60.0,
                pinned: true,
                title: FadeOnScroll(
                    scrollController: _scrollController,
                    fullOpacityOffset: 100,
                    child: Text('diet.title'.tr(),
                        style: const TextStyle(
                            color: AppColors.black500,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))),
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(color: Colors.transparent),
                    collapseMode: CollapseMode.none,
                    title: FadeOnScroll(
                        scrollController: _scrollController,
                        zeroOpacityOffset: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('diet.title'.tr(),
                                    style: const TextStyle(
                                        color: AppColors.black500,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))
                              ]),
                        )))),
          ];
        },
        body: CarouselSlider(
          options: CarouselOptions(height: 800.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return BlurredCard(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.widget, this.height);

  final Widget widget;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
