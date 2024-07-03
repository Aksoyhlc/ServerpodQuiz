import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/question_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/DropDown/dropdown.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';
import 'package:quizvideo_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class QuizCrud extends StatefulWidget {
  const QuizCrud({super.key, this.quiz});
  final Quiz? quiz;

  @override
  State<QuizCrud> createState() => _QuizCrudState();
}

class _QuizCrudState extends State<QuizCrud> with StateTools {
  bool get edit => widget.quiz != null;
  late Quiz? quiz;
  final qc = QuizDbController();

  @override
  void initState() {
    // TODO: implement initState
    ic.clearAll();
    super.initState();
    quiz = widget.quiz ?? Quiz();

    quiz?.questions?.forEach(
      (el) {
        selectedQuestions[el.questionId.toString()] = el.questionId.toString();
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  Map<String, String> selectedQuestions = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              GlobalAppBar(title: "Quiz ${edit ? "Edit" : "Add"}"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BsContainer(
                          children: [
                            BsRow(
                              children: [
                                BsCol(
                                  child: CustomTextInput(
                                    name: "title",
                                    hintText: "Title",
                                    initialData: quiz?.title,
                                    required: true,
                                  ),
                                ),
                                BsCol(
                                  child: CustomTextInput(
                                    name: "desctription",
                                    hintText: "Description",
                                    initialData: quiz?.description,
                                  ),
                                ),
                                BsCol(
                                  child: CustomTextInput(
                                    name: "time",
                                    hintText: "Time (second)",
                                    initialData: quiz?.time?.toString(),
                                    type: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            BsRow(
                              children: [
                                BsCol(
                                  child: CustomDropDown(
                                    selectedKeys: quiz?.type?.name == null ? null : [quiz?.type?.name ?? ""],
                                    items: Map.fromEntries(
                                      [
                                        for (var item in QuizType.values) MapEntry(item.name, item.name),
                                      ],
                                    ),
                                    onChanged: (key, value) {
                                      quiz!.type = QuizType.values.firstWhere((element) => element.name == value);
                                    },
                                  ),
                                ),
                                BsCol(
                                  child: CustomDropDown(
                                    selectedKeys: quiz?.status?.name == null ? null : [quiz?.status?.name ?? ""],
                                    items: Map.fromEntries(
                                      [
                                        for (var item in QuizStatus.values) MapEntry(item.name, item.name),
                                      ],
                                    ),
                                    onChanged: (key, value) {
                                      quiz!.status = QuizStatus.values.firstWhere((element) => element.name == key);
                                    },
                                  ),
                                ),
                                BsCol(
                                  child: FutureBuilder(
                                    future: getQuestions(),
                                    builder: (context, snapshot) {
                                      return FutureBuilderHandling(
                                        snapshot: snapshot,
                                        data: data,
                                        success: () {
                                          Map<String, String> map = {};

                                          for (var el in data.$1!) {
                                            map[el.id.toString()] = el.content;
                                          }

                                          return CustomDropDown(
                                            selectedKeys: selectedQuestions.keys.toList(),
                                            items: map,
                                            multiple: true,
                                            onMultiChanged: (data) {
                                              selectedQuestions = data;
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        15.h,
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              quiz!.title = ic.getValue("title");
                              quiz!.description = ic.getValue("desctription");
                              quiz!.time = int.tryParse(ic.getValue("time")) ?? 0;
                              quiz!.questionsIds = selectedQuestions.keys.toList();

                              var result = (edit ? await qc.update(quiz!) : await qc.add(quiz!));

                              if (result.$2 != null) {
                                bottomMessage(context, result.$2?.message);
                                return;
                              }
                              context.back();
                            }
                          },
                          title: "Save",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<(List<Category>?, DbException?)> getCategoryItems() async {
    final cc = CategoryDbController();
    return await cc.getAll();
  }

  (List<Question>?, DbException?) data = (null, null);

  getQuestions() async {
    final qc = QuestionDbController();
    data = await qc.getAll();
  }
}
