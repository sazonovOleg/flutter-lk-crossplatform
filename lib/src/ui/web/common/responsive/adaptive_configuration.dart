import 'package:flutter/cupertino.dart';
import 'device_sizes.dart';

class AdaptiveConfiguration {
  EdgeInsets symmetricEdgeInsets(
    BuildContext context,
    double horizontal,
    double vertical,
  ) {
    if (DeviceSizes.isMobileSize(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );
    } else if (DeviceSizes.isTabletSize(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 1.5,
        vertical: vertical * 1.5,
      );
    } else {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 1.8,
        vertical: vertical * 1.8,
      );
    }
  }

  EdgeInsets allEdgeInsets(BuildContext context, double all) {
    if (DeviceSizes.isMobileSize(context)) {
      return EdgeInsets.all(all);
    } else if (DeviceSizes.isTabletSize(context)) {
      return EdgeInsets.all(all * 1.5,);
    } else {
      return EdgeInsets.all(all * 2);
    }
  }

  double adaptiveWidth(
      BuildContext context,
      double initialWidth,
      double extraWidth,
      ) {
    if (DeviceSizes.isMobileSize(context)) {
      return initialWidth;
    } else if (DeviceSizes.isTabletSize(context)) {
      return initialWidth + extraWidth;
    } else {
      return initialWidth + (extraWidth * 1.2);
    }
  }

  double adaptiveHeight(
      BuildContext context,
      double initialHeight,
      double extraHeight,
      ) {
    if (DeviceSizes.isMobileSize(context)) {
      return initialHeight;
    } else if (DeviceSizes.isTabletSize(context)) {
      return initialHeight + (extraHeight * 0.95);
    } else {
      return initialHeight + (extraHeight * 1.2);
    }
  }
}
