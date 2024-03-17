import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onPressed;
  final Color fillColor;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final bool enabled;
  final bool light;
  final bool isMain;
  final bool gradient;
  final Color? splashDarkColor;
  final Color? splashLightColor;
  final bool horizontal;
  final List<Color> gradientColors;
  final List<BoxShadow> boxShows;
  final BorderRadius? radius;
  final bool showShadow;
  final Color? splashColor;
  final BoxBorder? boxBorder;

  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.fillColor = const Color(0xff156D87),
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.light = true,
    this.isMain = true,
    this.gradient = false,
    this.splashDarkColor,
    this.splashLightColor,
    this.horizontal = false,
    this.gradientColors = const [],
    this.radius,
    this.showShadow = false,
    this.splashColor,
    this.boxShows = const [],
    this.boxBorder,
  });

  static const double _kDefaultHeight = 46;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(height ?? _kDefaultHeight);
    final button = AnimatedOpacity(
      opacity: enabled ? 1 : 0.25,
      duration: const Duration(milliseconds: 250),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: width,
          height: height ?? _kDefaultHeight,
        ),
        child: DecoratedBox(
          decoration: gradient
              ? BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors.isNotEmpty
                  ? gradientColors
                  : [Colors.black, Colors.black],
              begin: horizontal ? Alignment.topLeft : Alignment.topCenter,
              stops: gradientColors.length > 2 ? [0.1, 0.3, 1] : [0, 1],
              end: horizontal
                  ? Alignment.bottomRight
                  : Alignment.bottomCenter,
            ),
            borderRadius: radius ?? borderRadius,
            border: boxBorder,
            boxShadow: boxShows.isNotEmpty
                ? boxShows
                : [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              if (showShadow)
                BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
            ],
          )
              :BoxDecoration(
            color: fillColor,
            borderRadius: radius ?? borderRadius,
            border: boxBorder,
            boxShadow: boxShows.isNotEmpty
                ? boxShows
                : [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              if (showShadow)
                BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
            ],
          ),
          child: Semantics(
            button: true,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: enabled ? onPressed : null,
                borderRadius: radius ?? borderRadius,
                splashColor: splashColor ??
                    (splashLightColor ?? Colors.blue),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: child is Text
                        ? (radius ?? borderRadius).topLeft.x / 2
                        : 0,
                  ),
                  child: Center(
                    child: Theme(
                      data: theme.copyWith(
                        iconTheme: const IconThemeData(color: Colors.blue),
                      ),
                      child: isMain
                          ? DefaultTextStyle.merge(
                        style: light
                            ? theme.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )
                            : theme.textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        child: child,
                      )
                          : child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    if (padding.vertical + padding.horizontal > 0) {
      return Padding(padding: padding, child: button);
    }
    return button;
  }
}

