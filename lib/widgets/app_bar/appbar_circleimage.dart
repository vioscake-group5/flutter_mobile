import 'package:flutter/material.dart';
import '../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppbarCircleimage extends StatelessWidget {
  AppbarCircleimage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap
  })
    : super( key: key );
  
  String? imagePath;
  
  EdgeInsetsGeometry? margin;
  
  Function? onTap;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.circleBorder25,
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 50.adaptSize,
          width: 50.adaptSize,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(25.h),
        ),
      ),
    );
  }
}