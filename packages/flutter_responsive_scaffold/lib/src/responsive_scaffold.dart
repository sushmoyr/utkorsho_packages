import 'package:flutter/material.dart';
import 'package:flutter_responsive_scaffold/src/responsive_layout.dart';

import 'breakpoint.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    Key? key,
    this.primaryNavigation,
    this.secondaryNavigation,
    this.topNavigationBar,
    this.primaryBottom,
    this.secondaryBottom,
    this.body,
    this.secondaryBody,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.onPrimaryNavigationChanged,
    this.onSecondaryNavigationChanged,
    this.extendBody,
    this.extendBodyBehindAppbar,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.scaffoldKey,
    this.gutterSpacing = 24,
    this.contentPadding = const EdgeInsets.all(20),
  }) : super(key: key);

  // All the window panes
  final Widget? primaryNavigation;
  final Widget? secondaryNavigation;
  final PreferredSizeWidget? topNavigationBar;
  final ResponsiveLayout? primaryBottom;
  final ResponsiveLayout? secondaryBottom;
  final ResponsiveLayout? body;
  final ResponsiveLayout? secondaryBody;
  final Widget? bottomNavigationBar;

  // Scaffold properties
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final ValueChanged<bool>? onPrimaryNavigationChanged;
  final ValueChanged<bool>? onSecondaryNavigationChanged;
  final bool? extendBody;
  final bool? extendBodyBehindAppbar;
  final double gutterSpacing;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    Widget? drawer;
    Widget? sideNavigation;
    if (Breakpoints.compact.isActive(context)) {
      drawer = primaryNavigation;
    } else {
      sideNavigation = primaryNavigation;
    }

    Widget? endDrawer;
    Widget? endSideNavigation;
    if (Breakpoints.compact.isActive(context)) {
      endDrawer = secondaryNavigation;
    } else {
      endSideNavigation = secondaryNavigation;
    }

    Widget bottomWidgets = Padding(
      padding: (primaryBottom != null || secondaryBottom != null)
          ? EdgeInsets.only(bottom: gutterSpacing)
          : EdgeInsets.zero,
      child: Row(
        children: [
          if (primaryBottom != null)
            Expanded(
              flex: primaryBottom!.weight,
              child: primaryBottom!,
            ),
          if (secondaryBottom != null)
            Expanded(
              flex: secondaryBottom!.weight,
              child: secondaryBottom!,
            ),
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: topNavigationBar,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      endDrawer: endDrawer,
      body: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left navigation pane
            AnimatedSize(
              duration: kThemeChangeDuration,
              alignment: Alignment.topLeft,
              child: sideNavigation ?? const SizedBox.shrink(),
            ),

            /// Body area pane
            Expanded(
              child: Padding(
                padding: contentPadding,
                child: Column(
                  children: [
                    // First the bottom widgets
                    bottomWidgets,
                    // Then the body widgets
                  ],
                ),
              ),
            ),

            /// Right navigation pane
            AnimatedSize(
              duration: kThemeChangeDuration,
              alignment: Alignment.topRight,
              child: endSideNavigation ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
