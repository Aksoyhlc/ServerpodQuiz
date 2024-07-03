import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/question_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/input_contoller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Views/Widgets/DropDown/dropdown.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

import '../Layout/Drawer/drawer.dart';

class CategoryCrud extends StatefulWidget {
  const CategoryCrud({super.key, this.category});
  final Category? category;

  @override
  State<CategoryCrud> createState() => _CategoryCrudState();
}

class _CategoryCrudState extends State<CategoryCrud> {
  bool get edit => widget.category != null;
  late Category category;
  Map<String, String> selectedQuestions = {};
  final gc = Get.find<GlobalController>();
  final ic = Get.find<InputController>();
  final cc = CategoryDbController();

  @override
  void initState() {
    super.initState();
    category = widget.category ?? Category(name: "");
    category.questions?.forEach(
      (element) {
        selectedQuestions[element.questionId.toString()] = "";
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ic.clearAll();
    super.dispose();
  }

  final memoizer = AsyncMemoizer();
  Map<String, String> questionList = {};
  final qc = QuestionDbController();
  String fileSelectText = "Select Image";

  getQuestions() async {
    return await memoizer.runOnce(
      () async {
        var questions = await qc.getAll();
        if (questions.$1 == null) return null;
        for (var value in questions.$1!) {
          questionList[value.id.toString()] = value.content;
        }
        return questions;
      },
    );
  }

  XFile? file;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            const GlobalAppBar(title: "Category Add"),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BsContainer(
                  fluid: false,
                  children: [
                    BsRow(
                      children: [
                        BsCol(
                          child: CustomTextInput(
                            name: "catName",
                            hintText: "Name",
                            initialData: category.name,
                          ),
                        ),
                        BsCol(
                          child: FutureBuilder(
                            future: getQuestions(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Container();
                              }
                              return CustomDropDown(
                                items: questionList,
                                multiple: true,
                                selectedKeys: selectedQuestions.keys.toList(),
                                onMultiChanged: (data) {
                                  selectedQuestions = data;
                                },
                              );
                            },
                          ),
                        ),
                        BsCol(
                          child: InkWell(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              file = await picker.pickImage(source: ImageSource.gallery);
                              if (file != null) {
                                fileSelectText = file!.name;
                                setState(() {});
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: primaryColor.withOpacity(.5),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                fileSelectText,
                                style: GoogleFonts.quicksand(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        onTap: () async {
                          var name = ic.getValue("catName");
                          if (name.isEmpty) {
                            bottomMessage(context, "Please enter name");
                            return;
                          }
                          late Category cat;
                          var items = selectedQuestions.keys.map((e) => int.tryParse(e)).toList();

                          if (edit) {
                            cat = category;
                          } else {
                            cat = Category(name: name);
                          }

                          cat.name = name;
                          cat.questionIds = items;

                          var result = await (edit ? cc.update(cat) : cc.add(cat));
                          if (result.$1?.id == null) {
                            bottomMessage(context, result.$2?.message);
                            return;
                          }

                          if (file?.path != null) {
                            var tempPath = file!.path; // + DateTime.now().microsecondsSinceEpoch.toString();
                            var uploadDescription = await gc.client.category.getUploadDescription(tempPath);
                            if (uploadDescription != null) {
                              var uploader = FileUploader(uploadDescription);
                              ByteData data = ByteData.sublistView((await file!.readAsBytes()));
                              await uploader.uploadByteData(data);
                              var url = await gc.client.category.verifyUpload(tempPath, result.$1!.id!);
                            }
                          }

                          context.back();
                        },
                        title: "Save",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
