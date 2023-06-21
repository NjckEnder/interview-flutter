part of app_widgets;

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final String title;
  final double _ratio;
  final Color? color;

  const AppButton.min({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
    this.color,
  }) : _ratio = 0.45;
  const AppButton.max({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
    this.color,
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
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 0,
            textStyle: ThemeText.bodyLarge,
          ),
          child: FittedBox(child: Text(title)),
        ),
      ),
    );
  }
}
