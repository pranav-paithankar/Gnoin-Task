import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key, required this.initialValue}) : super(key: key);

  final bool initialValue;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}
