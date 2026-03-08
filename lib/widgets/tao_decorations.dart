import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 太极图组件
class TaijiSymbol extends StatelessWidget {
  final double size;
  final Color yangColor;
  final Color yinColor;
  final bool rotating;

  const TaijiSymbol({
    super.key,
    required this.size,
    this.yangColor = const Color(0xFFD4AF37),  // 金色为阳
    this.yinColor = const Color(0xFF1a1a1a),   // 墨色为阴
    this.rotating = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget symbol = CustomPaint(
      size: Size(size, size),
      painter: _TaijiPainter(
        yangColor: yangColor,
        yinColor: yinColor,
      ),
    );

    if (rotating) {
      return _RotatingTaiji(child: symbol);
    }

    return symbol;
  }
}

class _RotatingTaiji extends StatefulWidget {
  final Widget child;
  const _RotatingTaiji({required this.child});

  @override
  State<_RotatingTaiji> createState() => _RotatingTaijiState();
}

class _RotatingTaijiState extends State<_RotatingTaiji>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: widget.child,
        );
      },
    );
  }
}

class _TaijiPainter extends CustomPainter {
  final Color yangColor;
  final Color yinColor;

  _TaijiPainter({required this.yangColor, required this.yinColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // 外圆边框
    final borderPaint = Paint()
      ..color = yangColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius - 1, borderPaint);

    // 大半圆（阳）
    final yangPaint = Paint()..color = yangColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 2),
      -math.pi / 2,
      math.pi,
      true,
      yangPaint,
    );

    // 大半圆（阴）
    final yinPaint = Paint()..color = yinColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 2),
      math.pi / 2,
      math.pi,
      true,
      yinPaint,
    );

    // 小圆（阳中之阴）
    canvas.drawCircle(
      Offset(center.dx, center.dy - radius / 2),
      radius / 2,
      yangPaint,
    );

    // 小圆（阴中之阳）
    canvas.drawCircle(
      Offset(center.dx, center.dy + radius / 2),
      radius / 2,
      yinPaint,
    );

    // 鱼眼（阴中之阳眼）
    final eyePaint = Paint()
      ..color = const Color(0xFFFFF8DC)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center.dx, center.dy + radius / 2),
      radius / 8,
      eyePaint,
    );

    // 鱼眼（阳中之阴眼）
    canvas.drawCircle(
      Offset(center.dx, center.dy - radius / 2),
      radius / 8,
      Paint()..color = const Color(0xFF0D0D0D),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 八卦符号组件
class BaguaSymbols extends StatelessWidget {
  final double size;
  final Color color;

  const BaguaSymbols({
    super.key,
    this.size = 20,
    this.color = const Color(0xFFD4AF37),
  });

  @override
  Widget build(BuildContext context) {
    final symbols = [
      ('乾', '☰', '天'),
      ('兑', '☱', '泽'),
      ('离', '☲', '火'),
      ('震', '☳', '雷'),
      ('巽', '☴', '风'),
      ('坎', '☵', '水'),
      ('艮', '☶', '山'),
      ('坤', '☷', '地'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: symbols.map((s) => _buildTrigram(s.$1, s.$2, s.$3)).toList(),
    );
  }

  Widget _buildTrigram(String name, String symbol, String element) {
    return Tooltip(
      message: '$name - $element',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: size,
                color: color,
                height: 1,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              name,
              style: TextStyle(
                fontSize: size * 0.5,
                color: color.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 中式云纹装饰边框
class CloudBorder extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  const CloudBorder({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color = const Color(0xFFD4AF37),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.1),
            Colors.transparent,
            color.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // 角落装饰
            Positioned(
              top: 0,
              left: 0,
              child: _CornerDecoration(color: color, position: _CornerPosition.topLeft),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _CornerDecoration(color: color, position: _CornerPosition.topRight),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: _CornerDecoration(color: color, position: _CornerPosition.bottomLeft),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: _CornerDecoration(color: color, position: _CornerPosition.bottomRight),
            ),
            // 内容
            Padding(
              padding: padding,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

enum _CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

class _CornerDecoration extends StatelessWidget {
  final Color color;
  final _CornerPosition position;

  const _CornerDecoration({required this.color, required this.position});

  @override
  Widget build(BuildContext context) {
    Widget decoration = CustomPaint(
      size: const Size(24, 24),
      painter: _CornerPainter(color: color),
    );

    // 根据位置旋转
    switch (position) {
      case _CornerPosition.topLeft:
        return decoration;
      case _CornerPosition.topRight:
        return Transform.rotate(angle: math.pi / 2, child: decoration);
      case _CornerPosition.bottomRight:
        return Transform.rotate(angle: math.pi, child: decoration);
      case _CornerPosition.bottomLeft:
        return Transform.rotate(angle: -math.pi / 2, child: decoration);
    }
  }
}

class _CornerPainter extends CustomPainter {
  final Color color;

  _CornerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    // L形装饰线
    path.moveTo(4, size.height - 4);
    path.lineTo(4, 4);
    path.lineTo(size.width - 4, 4);
    
    // 小装饰点
    canvas.drawCircle(
      const Offset(4, 4),
      2,
      Paint()..color = color..style = PaintingStyle.fill,
    );
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 神秘光晕背景
class MysticBackground extends StatelessWidget {
  final Widget child;

  const MysticBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0D0D0D),
            Color(0xFF1a1a1a),
            Color(0xFF0D0D0D),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 背景装饰圆
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFD4AF37).withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFC9372C).withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // 网格纹理
          Opacity(
            opacity: 0.03,
            child: CustomPaint(
              painter: _GridPainter(),
              size: Size.infinite,
            ),
          ),
          // 内容
          child,
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37)
      ..strokeWidth = 0.5;

    const spacing = 40.0;
    
    // 垂直线
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    
    // 水平线
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 符文按钮
class RuneButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  const RuneButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC9372C),
        foregroundColor: const Color(0xFFFFF8DC),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xFFD4AF37),
            width: 1,
          ),
        ),
        elevation: 8,
        shadowColor: const Color(0xFFC9372C).withValues(alpha: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}

/// 爻线组件
class YaoLine extends StatelessWidget {
  final bool isYang;
  final bool isChanging;
  final double width;

  const YaoLine({
    super.key,
    required this.isYang,
    this.isChanging = false,
    this.width = 60,
  });

  @override
  Widget build(BuildContext context) {
    final color = isChanging 
        ? const Color(0xFFC9372C)  // 变爻用朱砂红
        : const Color(0xFFD4AF37); // 普通爻用金色

    if (isYang) {
      // 阳爻 —— 一条实线
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: width,
        height: 6,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
          boxShadow: isChanging ? [
            BoxShadow(
              color: const Color(0xFFC9372C).withValues(alpha: 0.6),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ] : null,
        ),
      );
    } else {
      // 阴爻 - - 两条断线
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width * 0.42,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
              boxShadow: isChanging ? [
                BoxShadow(
                  color: const Color(0xFFC9372C).withValues(alpha: 0.6),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ] : null,
            ),
          ),
          SizedBox(width: width * 0.16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width * 0.42,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
              boxShadow: isChanging ? [
                BoxShadow(
                  color: const Color(0xFFC9372C).withValues(alpha: 0.6),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ] : null,
            ),
          ),
        ],
      );
    }
  }
}

/// 天机指示器（加载动画）
class TianJiIndicator extends StatefulWidget {
  final double size;

  const TianJiIndicator({super.key, this.size = 60});

  @override
  State<TianJiIndicator> createState() => _TianJiIndicatorState();
}

class _TianJiIndicatorState extends State<TianJiIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // 外圈旋转
              Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _CirclePatternPainter(
                    color: const Color(0xFFD4AF37),
                  ),
                ),
              ),
              // 内圈反向旋转
              Transform.rotate(
                angle: -_controller.value * 2 * math.pi,
                child: TaijiSymbol(
                  size: widget.size * 0.5,
                  yangColor: const Color(0xFFD4AF37),
                  yinColor: const Color(0xFFC9372C),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CirclePatternPainter extends CustomPainter {
  final Color color;

  _CirclePatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // 外圆
    canvas.drawCircle(center, radius, paint);

    // 八个方向的小圆点
    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final dotCenter = Offset(
        center.dx + math.cos(angle) * radius,
        center.dy + math.sin(angle) * radius,
      );
      canvas.drawCircle(
        dotCenter,
        3,
        Paint()..color = color..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
