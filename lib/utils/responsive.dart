import 'package:flutter/material.dart';

/// 响应式布局工具类
/// 
/// 断点定义:
/// - mobile: < 600px (手机)
/// - tablet: 600px - 1024px (平板)
/// - desktop: > 102px (桌面)
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// 获取自适应字体大小
  static double fontSize(BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  /// 获取自适应内边距
  static EdgeInsets padding(BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final value = isDesktop(context) 
        ? (desktop ?? tablet ?? mobile)
        : isTablet(context) 
            ? (tablet ?? mobile)
            : mobile;
    return EdgeInsets.all(value);
  }

  /// 获取自适应水平内边距
  static EdgeInsets horizontalPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 64);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 32);
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  /// 获取最大内容宽度
  static double maxContentWidth(BuildContext context) {
    final width = screenWidth(context);
    if (isDesktop(context)) return 800;
    if (isTablet(context)) return width * 0.9;
    return width;
  }
}

/// 响应式间距
class ResponsiveSpacing {
  static double xs(BuildContext context) => Responsive.isMobile(context) ? 4 : 8;
  static double sm(BuildContext context) => Responsive.isMobile(context) ? 8 : 12;
  static double md(BuildContext context) => Responsive.isMobile(context) ? 16 : 24;
  static double lg(BuildContext context) => Responsive.isMobile(context) ? 24 : 32;
  static double xl(BuildContext context) => Responsive.isMobile(context) ? 32 : 48;
}

/// 响应式字体大小
class ResponsiveFontSize {
  static double display(BuildContext context) => 
      Responsive.fontSize(context, mobile: 36, tablet: 48, desktop: 56);
  
  static double headline(BuildContext context) => 
      Responsive.fontSize(context, mobile: 24, tablet: 28, desktop: 32);
  
  static double title(BuildContext context) => 
      Responsive.fontSize(context, mobile: 18, tablet: 20, desktop: 22);
  
  static double body(BuildContext context) => 
      Responsive.fontSize(context, mobile: 14, tablet: 15, desktop: 16);
  
  static double caption(BuildContext context) => 
      Responsive.fontSize(context, mobile: 12, tablet: 12, desktop: 14);
}

/// 响应式布局组件
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (Responsive.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

/// 限制最大宽度的容器
class ConstrainedContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final Alignment alignment;

  const ConstrainedContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? Responsive.maxContentWidth(context),
        ),
        child: child,
      ),
    );
  }
}
