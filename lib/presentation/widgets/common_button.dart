import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/text_styles.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/extentions.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? elevation;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool? hideShadow;
  final bool isLoading;
  final String? prefixImage;
  final double? prefixImageSize;
  final Widget? postfixIcon;
  final Widget? prefixIcon;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.elevation,
    this.textStyle,
    this.width,
    this.isLoading = false,
    this.height,
    this.hideShadow = true,
    this.prefixImage,
    this.prefixImageSize,
    this.postfixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(30);

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 44,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: effectiveBorderRadius,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 0.5)
              : null,
          boxShadow: hideShadow == false
              ? [
                  BoxShadow(
                    color: ColorResources.primary.withOpacity(0.15),
                    offset: const Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorResources.buttonColor,
            foregroundColor: foregroundColor ?? ColorResources.white,
            padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: effectiveBorderRadius),
            elevation: elevation ?? 0,
            shadowColor: Colors.transparent,
          ),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      foregroundColor ?? ColorResources.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      gap8,
                    ] else if (prefixImage != null) ...[
                      Image.asset(
                        prefixImage!,
                        width: prefixImageSize ?? 20,
                        height: prefixImageSize ?? 20,
                        color: foregroundColor ?? ColorResources.white,
                      ),
                      gap8,
                    ],
                    Text(
                      text,
                      style:
                          textStyle ??
                          context.textStyle1.s14.w600.copyWith(
                            color: foregroundColor ?? ColorResources.white,
                          ),
                    ),
                    if (postfixIcon != null) ...[gap8, postfixIcon!],
                  ],
                ),
        ),
      ),
    );
  }
}
