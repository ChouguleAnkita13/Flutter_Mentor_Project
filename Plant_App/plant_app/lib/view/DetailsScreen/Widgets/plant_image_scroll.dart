import 'package:flutter/material.dart';
import 'package:plant_app/model/plantdata_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// A WIDGET THAT DISPLAYS A SCROLLABLE CAROUSEL OF PLANT IMAGES.
///
/// IT INCLUDES A PAGE INDICATOR THAT ALLOWS USERS TO NAVIGATE THROUGH THE IMAGES.
class PlantImageScroll extends StatelessWidget {
  PlantImageScroll({super.key, required this.selectedPlant});
  final PlantdataModel selectedPlant;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(
          height: deviceHeight / 2,
          child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, snapshot) {
                return Image.asset(
                  selectedPlant.plantImg,
                  height: deviceHeight / 2,
                  width: deviceWidth,
                  fit: BoxFit.contain,
                );
              }),
        ),

        ///SMOOTHPAGEINDICATOR TO SCROLL THE PLANT IMAGES WITH INDICATOR
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: const SlideEffect(
            spacing: 8.0,
            dotWidth: 8,
            dotHeight: 8,
            dotColor: Color.fromRGBO(197, 214, 181, 1),
            activeDotColor: Color.fromRGBO(62, 102, 24, 1),
          ),
          onDotClicked: (index) {
            _controller.animateToPage(index,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn);
          },
        ),
      ],
    );
  }
}
