import 'package:flutter/material.dart';

class ExampleActionButton extends StatefulWidget {
  const ExampleActionButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  State<ExampleActionButton> createState() => _State();
}

class _State extends State<ExampleActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class Example extends StatefulWidget {
  const Example(
      {Key? key,
      required this.title,
      this.count,
      this.price,
      this.isAuth,
      this.address})
      : super(key: key);

  final String? title;
  final int? count;
  final double? price;
  final bool? isAuth;
  final List<String>? address;

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
