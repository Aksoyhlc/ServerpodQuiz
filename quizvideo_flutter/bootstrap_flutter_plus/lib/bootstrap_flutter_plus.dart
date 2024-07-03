library bootstrap_flutter_plus;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class BsGrid {
  static List<String> prefixes = ['xl', 'lg', 'md', 'sm', ''];
  static List<String> prefixesReversed = prefixes.reversed.toList();

  static int numberOfColumns = 12;
  static double gutterSize = 48.0;
  static double oneColumnRatio = 1.0 / numberOfColumns;

  static void configure({
    int columns = 12,
    double gutter = 24.0,
  }) {
    assert(columns >= 10 && columns <= 24, 'Number of columns must be between 10 and 24.');
    assert(gutter >= 0.0 && gutter <= 96.0, 'Gutter size must be between 0.0 and 96.0.');

    numberOfColumns = columns;
    oneColumnRatio = 1.0 / numberOfColumns;
    gutterSize = gutter;
  }

  static String getPrefix(double width) {
    if (width > 1200) return 'xl';
    if (width > 992) return 'lg';
    if (width > 767) return 'md';
    if (width > 575) return 'sm';
    return '';
  }

  static double getMaxWidth(double width) {
    if (width >= 1200) return 1140;
    if (width >= 992) return 960;
    if (width >= 768) return 720;
    if (width >= 576) return 540;
    return width;
  }
}

class BsContainer extends StatelessWidget {
  final bool fluid;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final List<Widget> children;
  final WrapAlignment wrapAlignment;

  const BsContainer({
    super.key,
    required this.children,
    this.fluid = true,
    this.wrapAlignment = WrapAlignment.center,
    this.decoration,
    this.padding,
  });

  double _getMaxWidth(double width) {
    return fluid ? width : BsGrid.getMaxWidth(width);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = _getMaxWidth(constraints.maxWidth);

        Widget container = Container(
          width: width,
          decoration: decoration,
          child: Wrap(
            alignment: wrapAlignment,
            direction: Axis.horizontal,
            children: children,
          ),
        );

        if (padding != null) {
          container = Padding(padding: padding!, child: container);
        }

        return Align(
          alignment: Alignment.topCenter,
          child: container,
        );
      },
    );
  }
}

class BsRow extends StatelessWidget {
  final double? height;
  final BoxDecoration? decoration;
  final List<BsCol> children;
  final WrapAlignment? alignment;
  final double? wrapSpace;

  const BsRow({
    super.key,
    required this.children,
    this.decoration,
    this.alignment,
    this.height,
    this.wrapSpace,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        String prefix = BsGrid.getPrefix(constraints.maxWidth);

        List<BsCol> sortedChildren = List.from(children)
          ..sort((a, b) => (a.orderPerSize[prefix] ?? 0) - (b.orderPerSize[prefix] ?? 0));

        return Container(
          constraints: BoxConstraints(
            minHeight: height ?? 0.0,
            minWidth: constraints.maxWidth,
            maxWidth: constraints.maxWidth,
          ),
          decoration: decoration,
          child: Wrap(
            alignment: alignment ?? WrapAlignment.center,
            runAlignment: alignment ?? WrapAlignment.center,
            runSpacing: wrapSpace ?? 0.0,
            spacing: wrapSpace ?? 0.0,
            direction: Axis.horizontal,
            children: sortedChildren,
          ),
        );
      },
    );
  }
}

class BsCol extends StatelessWidget {
  final Widget child;
  final FlexFit fit;
  final bool absoluteSizes;
  final bool fluid;
  final String sizes;
  final String offsets;
  final String orders;
  final String? invisibleForSizes;

  final Map<String, int> ratiosPerSize = {for (var p in BsGrid.prefixes) p: 100};
  final Map<String, int> offsetsPerSize = {for (var p in BsGrid.prefixes) p: -100};
  final Map<String, int> orderPerSize = {for (var p in BsGrid.prefixes) p: 0};
  final Map<String, bool> hiddenPerSize = {for (var p in BsGrid.prefixes) p: false};

  BsCol({
    super.key,
    required this.child,
    this.fit = FlexFit.loose,
    this.absoluteSizes = true,
    this.fluid = true,
    this.sizes = "",
    this.offsets = "",
    this.orders = "",
    this.invisibleForSizes,
  }) {
    _initialize();
  }

  void _initialize() {
    var sizes2 = sizes != ""
        ? sizes
        : fluid
            ? "col-sm-12 col-md-3 col-lg-2"
            : "col-sm-12 col-md-3 col-lg-2";
    _initializeValues(sizes2, ratiosPerSize, 'col', math.min, 100, BsGrid.numberOfColumns);
    _initializeValues(offsets, offsetsPerSize, 'offset', math.max, -100, 0);
    _initializeValues(orders, orderPerSize, 'order', math.max, -100, 0);

    if (invisibleForSizes != null) {
      for (var pfx in invisibleForSizes!.split(' ').where((t) => t.trim().isNotEmpty)) {
        if (['xl', 'lg', 'md', 'sm', 'xs'].contains(pfx)) {
          hiddenPerSize[pfx == 'xs' ? '' : pfx] = true;
        }
      }
    }
  }

  void _initializeValues(
    String definition,
    Map<String, int> map,
    String prefix,
    Function compareFunction,
    int noValue,
    int defaultValue,
  ) {
    final parts = definition.toLowerCase().split(' ').where((t) => t.trim().isNotEmpty).toList();

    for (var part in parts) {
      for (var pfx in BsGrid.prefixes) {
        final fullPrefix = '$prefix-$pfx${pfx.isEmpty ? "" : "-"}';
        if (part.startsWith(fullPrefix)) {
          final valueString = part.substring(fullPrefix.length);
          final value = int.tryParse(valueString);
          if (value != null && value < 13 && value > (prefix == 'offset' ? -1 : 0)) {
            map[pfx] = compareFunction(map[pfx] ?? noValue, value);
          }
        }
      }
    }

    for (int i = 0; i < BsGrid.prefixesReversed.length; i++) {
      var pfx = BsGrid.prefixesReversed[i];
      if (map[pfx] == noValue) {
        for (int j = i + 1; j < BsGrid.prefixesReversed.length; j++) {
          if (map[BsGrid.prefixesReversed[j]] != noValue) {
            map[pfx] = map[BsGrid.prefixesReversed[j]]!;
            break;
          }
        }
        if (map[pfx] == noValue) {
          for (int j = i - 1; j >= 0; j--) {
            if (map[BsGrid.prefixesReversed[j]] != noValue) {
              map[pfx] = map[BsGrid.prefixesReversed[j]]!;
              break;
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = absoluteSizes ? MediaQuery.sizeOf(context).width : MediaQuery.sizeOf(context).width;
    final prefix = BsGrid.getPrefix(width);

    if (hiddenPerSize[prefix] == true) {
      return Container();
    }

    final flexRatio = ratiosPerSize[prefix]!;
    final leftMarginRatio = offsetsPerSize[prefix] ?? 0;

    Widget col = SizedBox(
      width: flexRatio * MediaQuery.sizeOf(context).width * BsGrid.oneColumnRatio,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: BsGrid.gutterSize / 2),
        child: child,
      ),
    );

    if (leftMarginRatio > 0) {
      col = Padding(
        padding: EdgeInsets.only(left: leftMarginRatio * MediaQuery.sizeOf(context).width * BsGrid.oneColumnRatio),
        child: col,
      );
    }

    return col;
  }
}

class BsVisibility extends StatelessWidget {
  final Widget child;
  final String sizes;
  final Map<String, bool> visibilityPerSize = {for (var p in BsGrid.prefixes) p: false};

  BsVisibility({super.key, required this.child, this.sizes = ""}) {
    _initialize();
  }

  void _initialize() {
    final parts = sizes.toLowerCase().split(' ').where((t) => t.trim().isNotEmpty).toList();
    for (var part in parts) {
      for (var pfx in BsGrid.prefixes) {
        if (part.startsWith('col-$pfx')) {
          visibilityPerSize[pfx] = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefix = BsGrid.getPrefix(MediaQuery.sizeOf(context).width);
    if (visibilityPerSize[prefix] == false) {
      return Container();
    }
    return child;
  }
}
