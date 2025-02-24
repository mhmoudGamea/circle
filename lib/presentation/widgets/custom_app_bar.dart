import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/dimens/dimens.dart';
import '../../core/config/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? fontSize;
  final Color? fontColor;
  final bool? showBackArrow;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? showToolBar;
  final double? elevation;
  final Color? bgColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.fontSize,
    this.fontColor,
    this.showBackArrow,
    this.centerTitle,
    this.actions,
    this.showToolBar,
    this.elevation,
    this.bgColor,
    this.systemUiOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemUiOverlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: AppColors.dark,
            statusBarIconBrightness: Brightness.light,
          ),
      title: Text(
        title ?? '',
        style: AppStyles.b18,
      ),
      centerTitle: centerTitle ?? false,
      actions: actions,
      automaticallyImplyLeading: showBackArrow ?? true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Dimens.width, showToolBar == true ? 60.h : 0);
}
