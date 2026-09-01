import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/text_styles.dart';

class CustomDropdownAlert extends StatefulWidget {
  final Duration duration;
  final Duration delayDismiss;

  const CustomDropdownAlert({
    super.key,
    this.duration = const Duration(milliseconds: 400),
    this.delayDismiss = const Duration(milliseconds: 3500),
  });

  @override
  State<CustomDropdownAlert> createState() => _CustomDropdownAlertState();
}

class _CustomDropdownAlertState extends State<CustomDropdownAlert>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  String _title = '';
  String _message = '';
  TypeAlert _type = TypeAlert.success;
  Map<String, dynamic>? _payload;
  bool _visible = false;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: const Duration(milliseconds: 250),
    );

    _progressController = AnimationController(
      vsync: this,
      duration: widget.delayDismiss,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));

    // Register callbacks in AlertController
    AlertController().setShow((title, message, type, [payload]) {
      _dismissTimer?.cancel();
      _progressController.stop();
      if (!mounted) return;

      setState(() {
        _title = title;
        _message = message;
        _type = type;
        _payload = payload;
        _visible = true;
      });

      _animationController.forward(from: 0.0);
      _progressController.reverse(from: 1.0);

      if (widget.delayDismiss.inMilliseconds > 0) {
        _dismissTimer = Timer(widget.delayDismiss, () {
          _hideAlert();
        });
      }
    });

    AlertController().setHide(() {
      _hideAlert();
    });
  }

  void _hideAlert() {
    _dismissTimer?.cancel();
    _progressController.stop();
    if (!mounted) return;

    _animationController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _visible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Color _getThemeColor() {
    switch (_type) {
      case TypeAlert.success:
        return ColorResources.green;
      case TypeAlert.error:
        return ColorResources.red;
      case TypeAlert.warning:
        return const Color(0xFFFF9800);
    }
  }

  IconData _getIcon() {
    switch (_type) {
      case TypeAlert.success:
        return Icons.check_circle_rounded;
      case TypeAlert.error:
        return Icons.cancel_rounded;
      case TypeAlert.warning:
        return Icons.warning_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    final themeColor = _getThemeColor();

    return Positioned(
      top: MediaQuery.of(context).padding.top + 14.h,
      left: 16.w,
      right: 16.w,
      child: GestureDetector(
        onTap: () {
          if (!AlertController().isCallbackNull()) {
            AlertController().getTabListener()(_payload, _type);
          }
          _hideAlert();
        },
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -5) {
            _hideAlert();
          }
        },
        child: SlideTransition(
          position: _offsetAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          ColorResources.primary,
                          Color(0xFF222222),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: ColorResources.white.withOpacity(0.08),
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: themeColor.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Core content layout
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 14.h,
                            bottom: 18.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Vibrant Squircle Status Icon Badge
                              Container(
                                width: 38.r,
                                height: 38.r,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      themeColor,
                                      themeColor.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeColor.withOpacity(0.25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  _getIcon(),
                                  color: ColorResources.white,
                                  size: 18.r,
                                ),
                              ),
                              SizedBox(width: 14.w),
                              // Title and Message
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _title,
                                      style: baseTextStyle.w600.s14.copyWith(
                                        color: ColorResources.white,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                    if (_message.isNotEmpty) ...[
                                      SizedBox(height: 3.h),
                                      Text(
                                        _message,
                                        style: baseTextStyle.w400.s12.copyWith(
                                          color: ColorResources.white.withOpacity(0.65),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              // Delicate Close/Dismiss Button
                              GestureDetector(
                                onTap: _hideAlert,
                                child: Container(
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                    color: ColorResources.white.withOpacity(0.08),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: ColorResources.white.withOpacity(0.5),
                                    size: 14.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Floating Inset Progress Indicator
                        Positioned(
                          bottom: 6.h,
                          left: 16.w,
                          right: 16.w,
                          child: AnimatedBuilder(
                            animation: _progressController,
                            builder: (context, child) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: _progressController.value,
                                  child: Container(
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      color: themeColor.withOpacity(0.85),
                                      borderRadius: BorderRadius.circular(1.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeColor.withOpacity(0.3),
                                          blurRadius: 3,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
