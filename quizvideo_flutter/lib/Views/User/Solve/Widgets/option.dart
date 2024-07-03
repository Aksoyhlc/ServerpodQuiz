import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/string.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';

import 'md_style.dart';

class Option extends StatefulWidget {
  const Option({super.key, required this.option});

  final String option;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> with StateTools {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Color color = whiteColor;
      IconData icon = Icons.circle_outlined;

      bool correct = false;
      bool wrong = false;
      bool otherSelected = (sc.otherAnswer.value.isNotEmpty && sc.otherAnswer.value == widget.option);
      bool selected = sc.selected.value.isNotNullOrEmpty;

      if (selected) {
        correct = sc.question.value!.answer == widget.option;
        wrong = sc.wrongValue.value == widget.option;
      }

      if (correct) {
        color = primaryLightColor;
        icon = Icons.check_circle_outline;
      }

      if (wrong) {
        color = redColor;
        icon = Icons.remove_circle_outline;
      }

      if (otherSelected) {
        color = orangeColor;
        icon = Icons.remove_red_eye_outlined;
      }

      return InkWell(
        onTap: () {
          if (selected) {
            bottomMessage(context, "You have already answered this question.");
            return;
          }

          sc.select(widget.option);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          constraints: const BoxConstraints(
            minHeight: 60,
            maxHeight: 200,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 5,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Markdown(
                      data: getContent(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      styleSheet: buildMarkdownStyleSheet(),
                    ),
                  ],
                ),
              ),
              Icon(icon, color: primaryColor)
            ],
          ),
        ),
      );
    });
  }

  String getContent() {
    String content = "";

    if (widget.option == "a") {
      content = sc.question.value!.a;
    } else if (widget.option == "b") {
      content = sc.question.value!.b;
    } else if (widget.option == "c") {
      content = sc.question.value!.c;
    } else if (widget.option == "d") {
      content = sc.question.value!.d;
    } else {
      content = "---";
    }

    return content;
  }
}
