import 'dart:developer';

import 'package:flutter/material.dart';

class TopNavigation extends StatefulWidget {
  const TopNavigation({Key? key, this.onDehazePress, this.onSearchPress})
      : super(key: key);

  final VoidCallback? onDehazePress;
  final VoidCallback? onSearchPress;

  @override
  State<TopNavigation> createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {
  @override
  Widget build(BuildContext context) {
    var deviceTopPadding = MediaQuery.of(context).viewPadding.top;

    return Container(
        padding: EdgeInsets.only(top: deviceTopPadding),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: widget.onDehazePress,
                      icon: const Icon(
                        Icons.dehaze, // https://www.fluttericon.com/
                        color: Colors.white,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      )),
                  const Text('Telegram',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
               IconButton(
                  onPressed: widget.onSearchPress,
                  icon: const Icon(
                    Icons.search, // https://www.fluttericon.com/
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),
            ],
          ),
        ));
  }
}
