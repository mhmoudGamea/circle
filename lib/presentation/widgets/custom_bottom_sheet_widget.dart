import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:circle/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final String title;
  final String firstSelection;
  final String secondSelection;
  final String buttonTitle;
  final VoidCallback close;
  final VoidCallback confirm;
  const CustomBottomSheetWidget({
    super.key,
    required this.title,
    required this.firstSelection,
    required this.secondSelection,
    required this.buttonTitle,
    required this.close,
    required this.confirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        _buildCloseRow(title: title),
        _buildLanguageRow(title: firstSelection, index: 0),
        _buildLanguageRow(title: secondSelection, index: 1),
        CustomButton(
          title: buttonTitle,
          onTap: confirm,
        ),
        SizedBox(height: 5),
      ],
    );
  }

  _buildCloseRow({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.b20),
        InkWell(
          onTap: close,
          child: CustomBorderedContainer(
            width: 30,
            height: 30,
            borderColor: Colors.transparent,
            bg: AppColors.dark,
            borderRadius: 25.w,
            padding: 0,
            child: Icon(Icons.clear_rounded, color: AppColors.white, size: 24),
          ),
        )
      ],
    );
  }

  _buildLanguageRow({required String title, required int index}) {
    return Consumer<ProfileProvider>(
      builder: (_, provider, child) {
        final bool isSelected = provider.currentIndex == index;
        return InkWell(
          onTap: () {
            provider.changeIndex(index);
          },
          child: Row(
            spacing: 10,
            children: [
              CustomBorderedContainer(
                width: 15,
                height: 15,
                borderColor: AppColors.primaryColor,
                bg: isSelected ? AppColors.primaryColor : Colors.transparent,
                borderRadius: 15.w,
                padding: 0,
                child: SizedBox(),
              ),
              child!
            ],
          ),
        );
      },
      child: Text(title, style: AppStyles.b14),
    );
  }
}
