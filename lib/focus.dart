import 'package:flutter/material.dart';

class AutomaticFocus extends StatefulWidget {
  final Widget child;
  const AutomaticFocus({Key? key, required this.child}) : super(key: key);

  @override
  State<AutomaticFocus> createState() => _AutomaticFocusState();
}

class _AutomaticFocusState extends State<AutomaticFocus> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      child: widget.child
    );
  }
}
