import 'dart:ui';

enum ProjectColors {
  mortarGrey,
  black,
  spanishGrey,
  white,
  indiaGreen,
  textColor,
  teaGreen,
  errorColor,
  orange,
  pagecolor
}

extension ColorExtension on ProjectColors {
  Color get color {
    switch (this) {
      case ProjectColors.mortarGrey:
        return const Color(0xFF9e9e9e);
      case ProjectColors.black:
        return const Color(0xFF000000);
      case ProjectColors.spanishGrey:
        return const Color(0xFF7e7e7e);
      case ProjectColors.white:
        return const Color(0xFFFFFFFF);
      case ProjectColors.indiaGreen:
        return const Color(0xFF00b107);
      case ProjectColors.textColor:
        return const Color(0xFF3e3e3e);
      case ProjectColors.teaGreen:
        return const Color(0xFFd8edd2);
      case ProjectColors.errorColor:
        return const Color(0xFFf44336);
      case ProjectColors.orange:
        return const Color(0xC4FF9900);
      case ProjectColors.pagecolor:
        return const Color(0xFFE5E5E5);
    }
  }
}
