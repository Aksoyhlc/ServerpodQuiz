import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.title,
    this.icon,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.width = 200,
    this.size = const Size(35, 35),
  });
  final Function() onTap;
  final String? title;
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final Size size;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: title == null ? null : const EdgeInsets.symmetric(vertical: 10),
        width: title == null ? size.width : width,
        height: title == null ? size.height : null,
        decoration: BoxDecoration(
          color: bgColor ?? primaryColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: (bgColor ?? primaryColor).withOpacity(0.71),
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: title == null
            ? Icon(
                icon ?? Icons.search,
                color: textColor ?? whiteColor,
                size: 20,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Center(
                      child: Text(
                        title!,
                        maxLines: 1,
                        style: GoogleFonts.quicksand(
                          color: textColor ?? whiteColor,
                          fontSize: fontSize ?? 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (icon != null) const SizedBox(width: 5),
                  if (icon != null)
                    Icon(
                      icon ?? Icons.search,
                      color: textColor ?? whiteColor,
                      size: 18,
                    ),
                ],
              ),
      ),
    );
  }
}
