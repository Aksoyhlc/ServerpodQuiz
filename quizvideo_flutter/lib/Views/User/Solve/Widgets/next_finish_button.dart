import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';

class NextFinishButton extends StatelessWidget with StateTools {
  NextFinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool finish = false;
        if ((sc.index.value == sc.questionList.length - 1) && sc.selected.value.isNotEmpty) {
          finish = true;
        }
        return CustomButton(
          onTap: () async {
            if (!sc.checkSelected()) {
              bottomMessage(context, "You have not made any choice");
              return;
            }

            if (sc.competition.value != null) {
              bool result = await sc.otherAnswerCheck();
              if (result) {
                if (finish) {
                  sc.endCompetition();
                  //sc.finish(context, corWrongCheck: true);
                } else {
                  sc.next(stream: true);
                }
              } else {
                bottomMessage(context, "Wait for the other party to respond.");
              }
              return;
            }

            bool result = await sc.next();

            if (!result && finish) {
              sc.finish(context, corWrongCheck: true);
            }
          },
          width: context.width / 2,
          fontSize: 20,
          bgColor: finish ? blueColor : primaryColor,
          title: finish ? "Finish" : "Next",
        );
      },
    );
  }
}
