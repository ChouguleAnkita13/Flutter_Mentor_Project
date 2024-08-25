import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferRow extends StatelessWidget {
  OfferRow({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 108,
          child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.sizeOf(context).width - 100,
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(204, 231, 185, 1)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "30% OFF",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "02-23 April",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 120,
                        child: Image.asset(
                          "assets/images/spiderPlant.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        const SizedBox(height: 8),
        //SmoothPageIndicator to scroll the offers pages with indicator
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
            }),
      ],
    );
  }
}
