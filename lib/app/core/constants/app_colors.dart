import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryColorValue = 0xFF240DFF; //primaryColor
  ///primarySwatch [must] contain all shades(50-900).
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFBCCBE),
      200: Color(0xFFED967B),
      300: Color(0xFFF4734B),
      400: Color(0xFFEA6222),
      500: Color(_primaryColorValue),
      600: Color(0xFFFF5722),
      700: Color(0xFFFF440B),
      800: Color(0xFFE53500),
      900: Color(0xFFE32B0A),
    },
  );

  static const primaryColor = Color(0xFF00488E);
  static const secondaryColor = Color(0xFF0054A6);
  static const backgroundColor = Color(0xFFF6F9FF);
  static const transparent = Color(0x00bd4efe);
  static final transparentPure = Colors.white.withOpacity(0.0);


  static const textColorGrey = Color(0xFF7E7E7E);
  static const textColorLiteGreen = Color(0xFF179848);
  static const textLiteGrey = Color(0xFF6A6A6A);
  static const liteBorderColor = Color(0xFFEEEEEE);
  static const tableHeaderColor = Color(0xFFF8F8F8);

  //text color
  static const textColor = Color(0xFF333333);
  static const textGray = Color(0xFF626262);
  static const textGreen = Color(0xFF009A48);
  static const textYellow = Color(0xFFFFA800);
  static const textRed = Color(0xFFFF001D);
  static const textDeepBlue = Color(0xFF002952);
  static const textBlue = Color(0xFF0054A6);

  static const dividerColor = Color(0xFFE5ECF9);

  static const purple = Color(0xFF5C3BFF);
  static const purpleDark = Color(0xFF000F9A);
  static const black = Color(0xFF091C32);
  static const blackPure = Color(0xFF000000);
  static const white = Color(0xFFF8F8F8);
  static const whitePure = Color(0xFFFFFFFF);
  static const gray = Color(0xFF52596E);
  static const grayDark = Color(0xFFBABABA);
  static const liteGray = Color(0xFFD9D9D9);
  static const liteGrayStepLine = Color(0xFF8FAABB);
  static const liteStepLine = Color(0xFFE2F0FD);
  static const inputColor = Color(0x8052596E); //alpha 50%
  static const wrong = Color(0xFFC20707);
  static const green = Color(0xFF35C141);
  static const liteGreen = Color(0xFF56C674);
  static const liteGreenBG = Color(0xFFC6F6D5);
  static const red = Color(0xFFFF1F00);
  static const darkRed = Color(0xFFC20707);
  static const accentColor = Color(0xFF1F6EC7);
  static const orangeLite = Color(0xFF4D7BB7);
  static const yellow = Color(0xFFFFBD0D);
  static const orange = Color(0xFFFF7A0D);
  static const blue = Color(0xFF1DA1FF);

  static const selectedColor = Color(0xFF1F54C7);

  static const headerTextColor = Color(0xFF172B4D);
  static const appBarTextColor = Color(0xFF000000);
  static const underlineColor = Color(0xFFCCCCCC);
  static const textColorBlue = Color(0xFF2E38B6);
  static const fieldColor = Color(0xFF846AE3);
  static const questionListBackgroundColor = Color(0xFFF2F7F6);

  static const listBackgroundColor = Color(0xFFF7F7F7);
  static const listStrokeColor = Color(0xFFDDDDDD);
  static const listStrokeColorDark = Color(0xFFC3C3C3);

  /// [pie chart] color
  static const problemSolvingColor = Color(0xff9779FF);
  static const liteBlueColor = Color(0xff597df1);
  static const communicationSkillsColor = Color(0xff5C3BFF);

  static const gradientLeftColor = Color(0xB8FF0D0D);
  static const gradientRightColor = Color(0xFFFFBD0D);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  // Gradient
  static final whiteToTransparentGradient = LinearGradient(
    colors: [backgroundColor, backgroundColor, Colors.white.withOpacity(0.0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ); // Gradient
  static final accentColorToTransparentGradient = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.0),
      accentColor.withOpacity(.9),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static final whiteToTransparentGradientHome = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.0),
      accentColor.withOpacity(.5),
      accentColor
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const baseGradient = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const baseGradient2 = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const btnBGGradient = LinearGradient(
    colors: [
      Color(0xFF00A299),
      Color(0xFF0EB9AF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
