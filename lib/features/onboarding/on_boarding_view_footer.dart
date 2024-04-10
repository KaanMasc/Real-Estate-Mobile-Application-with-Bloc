part of on_boarding_view;

class _OnboardingFooter extends StatelessWidget {
  const _OnboardingFooter();
  final String _text = 'CONTINUE WITH';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.screenWidth,
      height: kToolbarHeight * 2,
      child: Padding(
          padding: ProjectPaddings.horizontalMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSizes.screenWidth,
                child: Padding(
                  padding: ProjectPaddings.horizontalMedium,
                  child: Text(
                    _text,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: ProjectPaddings.horizontalMedium,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginSocialButton(
                      icon: Icons.facebook_rounded,
                      onPressed: () {},
                    ),
                    LoginSocialButton(
                        icon: Icons.one_x_mobiledata_outlined,
                        onPressed: () {}),
                    LoginSocialButton(
                        icon: Icons.chrome_reader_mode_outlined,
                        onPressed: () {}),
                    const LoginEmailButton()
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
