part of on_boarding_view;

class _OnBoardingViewDisplayText extends StatelessWidget {
  const _OnBoardingViewDisplayText();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.screenWidth,
      height: AppSizes.screenHeight / 2,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "DİSCOVER, SELL, RENT, CONNECT",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 60),
          Text(
            "YOUR ALL-İN-ONE HOUSİNG SOLUTİON",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          )
        ],
      ),
    );
  }
}
