import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Models/table_row_model.dart';
import 'package:quizvideo_flutter/Views/Admin/Question/list.dart';
import 'package:quizvideo_flutter/Views/Admin/Quiz/add_edit.dart';
import 'package:quizvideo_flutter/Views/Admin/Widgets/table_widget.dart';
import 'package:quizvideo_flutter/Views/Widgets/confirm_dialog.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class QuizList extends StatefulWidget {
  const QuizList({super.key, this.categoryId});
  final int? categoryId;

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> with StateTools {
  final qc = QuizDbController();
  (List<Quiz>?, DbException?) data = (null, null);

  fetchData({bool direct = false}) async {
    if (!direct) {
      data = await qc.getAll();
      return;
    }
    data = await run(() => qc.getAll());
  }

  Future<void> refresh() async {
    await fetchData(direct: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.to(const QuizCrud());
            await refresh();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            const GlobalAppBar(title: "Quiz List"),
            10.h,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return FutureBuilderHandling(
                      data: data,
                      snapshot: snapshot,
                      success: () {
                        var list = data.$1!;
                        return TablePartial(
                          columns: [
                            TableColumnModel(title: "Title"),
                            TableColumnModel(title: "Description"),
                            TableColumnModel(title: "Time (Second)"),
                            TableColumnModel(title: "Status"),
                            TableColumnModel(title: "Type"),
                            TableColumnModel(title: "Question Count"),
                            TableColumnModel(title: "Created At"),
                            TableColumnModel(title: "Updated At"),
                            TableColumnModel(title: "Action", type: ColType.Widget),
                          ],
                          rows: rows(context, list),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRowModel> rows(BuildContext context, List<Quiz> list) {
    List<TableRowModel> widgets = [];
    int index = -1;
    for (var e in list) {
      widgets.add(
        TableRowModel(
          cells: [
            TableCellModel(data: e.title),
            TableCellModel(data: e.description),
            TableCellModel(data: e.time == null ? "" : e.time.toString()),
            TableCellModel(data: e.status?.name),
            TableCellModel(data: e.type?.name),
            TableCellModel(data: e.questions?.length.toString()),
            TableCellModel(data: e.createdAt.toString()),
            TableCellModel(data: e.updatedAt.toString()),
            TableCellModel(
              data: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () async {
                      await context.to(QuizCrud(quiz: e));
                      await refresh();
                    },
                    bgColor: greenColor,
                    icon: Icons.edit,
                  ),
                  10.w,
                  CustomButton(
                    onTap: () async {
                      confirmDialog(
                          context: context,
                          message: "Are you sure?",
                          onConfirm: () async {
                            var result = await qc.delete(e);
                            if (result.$2 != null) {
                              bottomMessage(context, result.$2!.message);
                            } else {
                              data.$1!.removeAt(index);
                              setState(() {});
                              bottomMessage(context, "Deleted successfully", type: MessageType.success);
                            }
                            context.back();
                          });
                    },
                    bgColor: redColor,
                    icon: Icons.delete,
                  ),
                  10.w,
                  CustomButton(
                    onTap: () async {
                      await context.to(QuestionList(quiz: e));
                    },
                    bgColor: blueColor,
                    icon: Icons.list_alt_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      index++;
    }
    return widgets;
  }
}
