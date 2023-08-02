// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOnBoardingWidget extends StatefulWidget {
  CustomOnBoardingWidget({
    super.key,
    required this.dataList,
    required this.startBtnOnTapFunction,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.black,
    this.themeColor = const Color(0xFF6D67E4),
  });
  List dataList;
  Color titleColor;
  Color subtitleColor;
  Color themeColor;
  VoidCallback startBtnOnTapFunction;
  @override
  State<CustomOnBoardingWidget> createState() => _CustomOnBoardingWidgetState();
}

class _CustomOnBoardingWidgetState extends State<CustomOnBoardingWidget> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemCount: widget.dataList.length,
      itemBuilder: (_, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    onTap: widget.startBtnOnTapFunction,
                    child: Text(
                      "SKIP",
                      style: GoogleFonts.lato(color: widget.titleColor),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SvgPicture.asset(widget.dataList[i].image, width: 300),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.dataList.length,
                      (index) {
                        return Container(
                          width: index == currentIndex ? 30 : 20,
                          height: 5,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == currentIndex
                                ? Colors.white
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.dataList[i].title,
                      style: TextStyle(
                          color: widget.titleColor,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  Text(widget.dataList[i].subTitle,
                      style: TextStyle(
                          color: widget.subtitleColor,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentIndex == 0
                      ? Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(flex: 1),
                              NextBtn(
                                controller: _controller!,
                                themeColor: widget.themeColor,
                              ),
                            ],
                          ),
                        )
                      : currentIndex == widget.dataList.length - 1
                          ? Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BackBtn(
                                    controller: _controller!,
                                    themeColor: widget.themeColor,
                                  ),
                                  StartBtn(
                                    themeColor: widget.themeColor,
                                    onTap: widget.startBtnOnTapFunction,
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _controller!.previousPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.bounceIn);
                                    },
                                    child: BackBtn(
                                      controller: _controller!,
                                      themeColor: widget.themeColor,
                                    ),
                                  ),
                                  NextBtn(
                                    controller: _controller!,
                                    themeColor: widget.themeColor,
                                  ),
                                ],
                              ),
                            ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class NextBtn extends StatelessWidget {
  NextBtn({
    super.key,
    required this.controller,
    this.themeColor,
  });
  PageController controller;
  Color? themeColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn);
      },
      child: Container(
        width: 90,
        height: 48,
        decoration: ShapeDecoration(
          color: themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'NEXT',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartBtn extends StatelessWidget {
  StartBtn({
    super.key,
    this.themeColor,
    required this.onTap,
  });
  Color? themeColor;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 151,
        height: 48,
        decoration: ShapeDecoration(
          color: themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'GET STARTED',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  BackBtn({
    super.key,
    required this.controller,
    this.themeColor,
  });
  PageController controller;
  Color? themeColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.previousPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn);
      },
      child: const Text(
        "BACK",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
