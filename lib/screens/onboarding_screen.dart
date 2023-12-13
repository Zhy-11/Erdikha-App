import 'package:carousel_slider/carousel_slider.dart';
import 'package:erdhika/screens/auth_screen.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
// import 'package:erdikha/utils/onboard_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> listImg = [
    "assets/images/img1-onboard.png",
    "assets/images/img2-onboard.png",
    "assets/images/img3-onboard.png",
    "assets/images/img4-onboard.png"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return WillPopScope(
      onWillPop: () async {
        if (_current != 0) {
          _current -= 1;
          _controller.animateToPage(_current, curve: Curves.easeInOutCubic);
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   actions: [],
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 4, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _current > 0
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () {
                              setState(() {
                                _current -= 1;
                                _controller.animateToPage(
                                  _current,
                                  curve: Curves.easeInOutCubic,
                                );
                              });
                            },
                          )
                        : SizedBox.shrink(),
                    if (_current != 3)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            while (_current < 4) {
                              _current += 1;
                              _controller.animateToPage(
                                _current,
                                curve: Curves.easeInOutCubic,
                              );
                            }
                          });
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: Text(
                          "Lewati",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: height,
                    // initialPage: _current,
                    // autoPlayAnimationDuration: Duration(milliseconds: 100),
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                        // debugPrint("$_current");
                      });
                    },
                  ),
                  items: listImg.map((img) {
                    return ListView(
                      padding: EdgeInsets.fromLTRB(23, height * 0.06, 23, 0),
                      // shrinkWrap: true,
                      children: [
                        Center(
                          child: Image.asset(
                            img,
                            scale: 3,
                          ),
                        ),
                        SizedBox(height: height * 0.10),
                        Text(
                          "elit \nErdikha Online Trading",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 11),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listImg.asMap().entries.map((entry) {
                  return
                      // GestureDetector(
                      //   onTap: () => _controller.animateToPage(entry.key),
                      //   child:
                      Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.fromLTRB(3, 0, 3, height * 0.05),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? Color(0XFF80B3FF)
                            : Color(0XFFd9d9d9)
                        // (Theme.of(context).brightness == Brightness.dark
                        //         ? Colors.white
                        //         : Color(0XFF80B3FF))
                        //     .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                    // ),
                  );
                }).toList(),
              ),
              Container(
                width: width,
                // height: 45,
                padding: EdgeInsets.fromLTRB(20, 0, 20, height * 0.05),
                // clipBehavior: Clip.antiAlias,
                // decoration: ShapeDecoration(
                //   color: Color(0xFF80B3FF),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                // ),
                child: ButtonMainWidget(
                  backgroundColor: Color.fromARGB(255, 0, 102, 255),
                  text: Text(
                    _current != 3 ? 'Lanjutkan' : 'Masuk',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0,
                      // letterSpacing: 0.09,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (_current <= 2) {
                        _current += 1;
                        _controller.animateToPage(
                          _current,
                          curve: Curves.easeInOutCubic,
                        );
                      } else {
                        Get.offAll(() => AuthScreen());
                      }
                    });
                  },
                ),
                // Text(
                //   'Lanjutkan',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 18,
                //     fontFamily: 'Inter',
                //     fontWeight: FontWeight.w600,
                //     height: 0,
                //     letterSpacing: 0.09,
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
