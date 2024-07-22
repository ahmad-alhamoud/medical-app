import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'swapper_circle_indicator.dart';
import 'swapper_rectangle_indicator.dart';

enum IndicatorType { rectangle, circle }

// ignore: must_be_immutable
class Swapper<T> extends StatelessWidget {
  final SwiperController _swiperController = SwiperController();
  final List<T> item;
  final Function(T, int) showItem;
  final Function(T, int) onUpdateItem;
  final bool autoPlay;
  final bool withLoop;
  final IndicatorType indicatorType;
  ValueNotifier<int>? currentIndex;
  final bool indicatorInTheCenter;
  final ScrollPhysics? physics;
  Swapper(
      {required this.item,
      required this.showItem,
      this.autoPlay = false,
      this.withLoop = true,
      this.indicatorType = IndicatorType.rectangle,
      this.indicatorInTheCenter = false,
      required this.onUpdateItem,
      this.currentIndex,
      this.physics});
  @override
  Widget build(BuildContext context) {
    currentIndex = currentIndex ??= ValueNotifier<int>(0);
    return Stack(
      children: [
        Swiper(
          physics: physics ?? BouncingScrollPhysics(),
          loop: withLoop,
          itemBuilder: (BuildContext context, int index) {
            return showItem(item[index], index);
          },
          autoplay: autoPlay,
          itemCount: item.length,
          scrollDirection: Axis.horizontal,
          controller: _swiperController,
          onIndexChanged: (index) {
            currentIndex!.value = index;
          },
        ),
        ValueListenableBuilder<int>(
          valueListenable: currentIndex!,
          builder: (context, currentIndex, _) {
            onUpdateItem(item[currentIndex], currentIndex);
            return Container(
              child: indicatorType == IndicatorType.rectangle
                  ? SwapperRectablgeIndicator<T>(
                      items: item,
                      currentIndex: currentIndex,
                      indicatorInTheCenter: indicatorInTheCenter,
                    )
                  : SwapperCircleIndicator<T>(
                      items: item,
                      currentIndex: currentIndex,
                      indicatorInTheCenter: indicatorInTheCenter,
                    ),
            );
          },
        ),
      ],
    );
  }
}
