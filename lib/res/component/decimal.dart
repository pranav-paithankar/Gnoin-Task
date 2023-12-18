import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Decimal extends StatefulWidget {
  Decimal({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  State<Decimal> createState() => _DecimalState();
}

class _DecimalState extends State<Decimal> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _count = _count + 1;
              });
            },
            child: const Text('+'),
          ),
          Text("$_count"),
          TextButton(
            onPressed: () {
              setState(() {
                _count = _count - 1;
              });
            },
            child: const Text('-'),
          ),
        ],
      ),
    );
  }
}
