import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color primaryColor;

  AppTheme.light() : this._(primaryColor: AppColors.yellow);

  AppTheme.dark() : this._(primaryColor: AppColors.black);

  AppTheme._({required this.primaryColor});

  @override
  ThemeExtension<AppTheme> copyWith({Color? primaryColor}) {
    return AppTheme._(primaryColor: primaryColor ?? this.primaryColor);
  }

  @override
  ThemeExtension<AppTheme> lerp(AppTheme? other, double t) {
    return AppTheme._(
      primaryColor: Color.lerp(primaryColor, other?.primaryColor, t)!,
    );
  }
}
