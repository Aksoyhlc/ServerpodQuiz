import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/State/solve_controller.dart';

import 'md_style.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = Get.find<SolveController>();
    return Obx(() {
      var item = sc.question.value;
      if (item == null) {
        return const SizedBox();
      }
      return Container(
        width: context.width,
        constraints: BoxConstraints(
          maxHeight: (context.isPhone ? context.height / 2 : context.height / 1),
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Markdown(
          data: item.content,
          selectable: true,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          styleSheet: buildMarkdownStyleSheet(),
        ),
      );
    });
  }
}
