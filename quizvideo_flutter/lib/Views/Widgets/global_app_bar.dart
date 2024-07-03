import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
    required this.title,
    this.back,
    this.actions,
    this.borderRadius = true,
  });
  final String title;
  final bool? back;
  final Widget? actions;
  final bool borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(.5),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: !borderRadius
            ? null
            : const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (back ?? true)
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Icon(
                      Navigator.canPop(context) ? Icons.arrow_back : Icons.menu,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          Center(
            child: Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: whiteColor,
                letterSpacing: 1.2,
              ),
            ),
          ),
          if (actions != null) Positioned(right: 0, child: actions!),
        ],
      ),
    );
  }
}
