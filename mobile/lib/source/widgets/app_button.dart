part of app_widgets; 

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final String title;
  final double _ratio;
  final Color? color;
  final Color? titleColor;

  const AppButton.min({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
    this.color,
    this.titleColor,
  }) : _ratio = 0.45;
  const AppButton.max({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
    this.color,
    this.titleColor,
  }) : _ratio = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * _ratio;

    return Container(
      width: width,
      height: kToolbarHeight,
      margin: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //       color: ThemeColors.primaryColor,
          //       blurRadius: 10,
          //       offset: Offset(0, 10)),
          // ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.copyWith(backgroundColor: MaterialStateProperty.all(color)),
          child: FittedBox(
              child: Text(
            title,
            style: ThemeText.bodyMedium.copyWith(color: titleColor),
          )),
        ),
      ),
    );
  }
}