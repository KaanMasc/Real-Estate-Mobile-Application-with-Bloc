part of on_boarding_view;

class _OnboardingBackgorund extends StatelessWidget {
  const _OnboardingBackgorund();
  final String _backgroundImagePath =
      'assets/images/ic_auth_background_splash.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight,
      width: AppSizes.screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_backgroundImagePath), fit: BoxFit.fitHeight)),
    );
  }
}
