import 'dart:developer';

import 'package:first_example/pages/first_page/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  Animation getDelayedAnimation(double delay) {
    return Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          delay,
          0.5,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  void onPressedHandler() {
    if (animationController.value == 0) {
      animationController.forward(from: 0);
    } else {
      animationController.animateBack(0);
    }
  }

  void _redirect() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var items = List<String>.generate(200, (i) => 'Item $i');

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: Stack(children: [
          Positioned(
              child: Column(children: [
            TopNavigation(onDehazePress: onPressedHandler),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var userId = index + 100;
                  var url = 'https://picsum.photos/200/${userId}';

                  return Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text('User Id is ${userId}'),
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            // margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              boxShadow: false
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]
                                  : null,
                              // borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 5.0, top: 5.0),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(url)),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            'Hello. UserId is $userId',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: true,
                            child: Container(
                                width: 260,
                                child: const Divider(
                                  endIndent: 0,
                                  height: 1,
                                )))
                      ],
                    ),
                  );
                },
              ),
            )
          ])),

          // OPACITY ELEMENT
          Positioned(
              child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Visibility(
                visible: animationController.value != 0,
                child: GestureDetector(
                  onTap:
                      animationController.value == 1 ? onPressedHandler : null,
                  child: Opacity(
                    opacity: 0.0 + (0.3 * animationController.value),
                    child: Container(
                      color: Colors.black,
                      width: width,
                      height: height,
                    ),
                  ),
                ),
              );
            },
          )),
          AnimatedBuilder(
              animation: animationController,
              builder: (context, _) {
                var elementWidth = width - width / 4;

                var deviceTopPadding = MediaQuery.of(context).viewPadding.top;

                return Transform(
                  transform: Matrix4.translationValues(
                      (0 - elementWidth) +
                          elementWidth * animationController.value,
                      0,
                      0),
                  child: Container(
                    height: height,
                    width: elementWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: deviceTopPadding),
                          height: height / 4,
                          width: elementWidth,
                          decoration: const BoxDecoration(
                            color: Color(0xff2980b9),
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              'https://picsum.photos/202')),
                                      Icon(Icons.shield_moon_outlined, color: Colors.white, size: 40)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ]),
      );
    }));
  }
}
