import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Const/const.dart';

confirmDialog({
  required BuildContext context,
  required String message,
  Function()? onConfirm,
  bool cancelShow = true,
  String cancelText = "",
  String confirmText = "",
}) {
  if (cancelText == "") {
    cancelText = "Hayır";
  }
  if (confirmText == "") {
    confirmText = "Evet";
  }
  showDialog<bool>(
    context: context,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    color: whiteColor,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        message,
                        style: GoogleFonts.playfairDisplay(
                          color: primaryColor,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: cancelShow ? MainAxisAlignment.center : MainAxisAlignment.end,
                        children: [
                          if (cancelShow)
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                  margin: const EdgeInsets.only(top: 10, left: 10),
                                  child: Center(
                                    child: Text(
                                      cancelText,
                                      style: GoogleFonts.playfairDisplay(
                                        color: primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          if (cancelShow) const SizedBox(width: 20),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.5),
                                        offset: const Offset(0, 2),
                                        blurRadius: 4,
                                      )
                                    ]),
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                margin: const EdgeInsets.only(top: 10, left: 10),
                                child: Center(
                                  child: Text(
                                    confirmText,
                                    style: GoogleFonts.playfairDisplay(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (onConfirm != null) {
                                  onConfirm();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
