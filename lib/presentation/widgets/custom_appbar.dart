import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_styles.dart';

abstract class CustomAppBar {
  // for appbar with leading and without leading
  static AppBar appBarWithLeadingAndTitle({
    required String title,
    required BuildContext context,
    bool withLeading = true,
  }) {
    return AppBar(
      leading: withLeading
          ? IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.arrow_back_rounded),
            )
          : null,
      title: Text(
        title,
        style: AppStyles.b18,
      ),
    );
  }
}
