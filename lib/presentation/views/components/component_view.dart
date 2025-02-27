import 'package:circle/main.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/views/components/widgets/custom_sub_category_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_navigation_rail.dart';

class ComponentView extends StatelessWidget {
  const ComponentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileProvider, bool>(
      selector: (_, provider) => provider.languageChanged,
      builder: (context, value, child) {
        final isArabic =
            navigatorKey.currentContext!.locale.languageCode == 'ar';
        return Padding(
          padding: isArabic
              ? const EdgeInsets.only(left: 16, right: 0)
              : const EdgeInsets.only(right: 16, left: 0),
          child: Row(
            children: [
              CustomNavigationRail(),
              SizedBox(width: 16),
              Expanded(
                child: CustomSubCategoryList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
