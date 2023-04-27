import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key,
      this.titleWidget,
      this.leading,
      this.actions,
      this.backgroundColor,
      this.elevation,
      this.opacity,
      this.onPressed})
      : super(key: key);
  Widget? titleWidget;
  double? elevation;
  Widget? leading;
  List<Widget>? actions;
  Color? backgroundColor;
  double? opacity;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget!,
      elevation: elevation!,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      bottomOpacity: opacity!,
    );
  }
}
