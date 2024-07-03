import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/question_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/string.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/DropDown/dropdown.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class QuestionCrud extends StatefulWidget {
  const QuestionCrud({super.key, this.question});
  final Question? question;

  @override
  State<QuestionCrud> createState() => _QuestionCrudState();
}

class _QuestionCrudState extends State<QuestionCrud> with StateTools {
  bool get edit => widget.question != null;
  late Question? question;
  final qc = QuestionDbController();

  @override
  void initState() {
    // TODO: implement initState
    ic.clearAll();
    super.initState();
    question = widget.question;
  }

  final formKey = GlobalKey<FormState>();
  Map<String, String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              GlobalAppBar(title: "Question ${edit ? "Edit" : "Add"}"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: BsContainer(
                      children: [
                        BsCol(
                          sizes: "col-md-12 col-lg-6",
                          child: CustomTextInput(
                            name: "content",
                            hintText: "Content",
                            initialData: question?.content,
                            maxLines: 10,
                            onValidator: (value) {
                              if (value.isNullOrEmpty) return "Please enter content";
                            },
                          ),
                        ),
                        BsRow(
                          children: [
                            BsCol(
                              child: CustomTextInput(
                                name: "qA",
                                hintText: "A",
                                initialData: question?.a,
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qB",
                                hintText: "B",
                                initialData: question?.b,
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qC",
                                hintText: "C",
                                initialData: question?.c,
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qD",
                                hintText: "D",
                                initialData: question?.d,
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                          ],
                        ),
                        BsRow(
                          children: [
                            BsCol(
                              child: CustomTextInput(
                                name: "answer",
                                hintText: "Answer",
                                initialData: question?.answer,
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "point",
                                hintText: "Point",
                                initialData: (question?.point ?? 0).toString(),
                                onValidator: (value) {
                                  if (value.isNullOrEmpty) return "It is mandatory to fill this field";
                                },
                              ),
                            ),
                            BsCol(
                              child: FutureBuilder(
                                future: getCategoryItems(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState != ConnectionState.done) {
                                    return const CircularProgressIndicator();
                                  }

                                  Map<String, String> items = {};
                                  for (Category item in snapshot.data?.$1 ?? []) {
                                    items[item.id.toString()] = item.name;
                                  }

                                  print(question?.categoryIds);
                                  return CustomDropDown(
                                    items: items,
                                    selectedKeys: question?.categories?.map((e) => e.categoryId.toString()).toList(),
                                    onMultiChanged: (data) {
                                      selectedCategories = data;
                                    },
                                    multiple: true,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (edit) {
                                question!.content = ic.getValue("content");
                                question!.a = ic.getValue("qA");
                                question!.b = ic.getValue("qB");
                                question!.c = ic.getValue("qC");
                                question!.d = ic.getValue("qD");
                                question!.answer = ic.getValue("answer");
                                question!.categoryIds = selectedCategories.keys.toList();
                                question!.point = int.tryParse(ic.getValue("point")) ?? 0;
                              } else {
                                question = Question(
                                  content: ic.getValue("content"),
                                  a: ic.getValue("qA"),
                                  b: ic.getValue("qB"),
                                  c: ic.getValue("qC"),
                                  d: ic.getValue("qD"),
                                  answer: ic.getValue("answer"),
                                  point: int.tryParse(ic.getValue("point")) ?? 0,
                                  categoryIds: selectedCategories.keys.toList(),
                                );
                              }

                              var result = (edit ? await qc.update(question!) : await qc.add(question!));

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
}
