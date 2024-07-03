import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Models/table_row_model.dart';
import 'package:quizvideo_flutter/Views/Admin/Category/add.dart';
import 'package:quizvideo_flutter/Views/Admin/Question/list.dart';
import 'package:quizvideo_flutter/Views/Admin/Widgets/table_widget.dart';
import 'package:quizvideo_flutter/Views/Widgets/confirm_dialog.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class AdminCategoryList extends StatefulWidget {
  const AdminCategoryList({super.key});

  @override
  State<AdminCategoryList> createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminCategoryList> with StateTools {
  final cc = CategoryDbController();
  (List<Category>?, DbException?) data = (null, null);

  fetchData({bool direct = false}) async {
    if (!direct) {
      data = await cc.getAll();
      return;
    }
    data = await run(() => cc.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.to(const CategoryCrud());
            await refresh();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            const GlobalAppBar(title: "Category List"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return FutureBuilderHandling(
                      snapshot: snapshot,
                      data: data,
                      success: () {
                        //var list = data.$1!;

                        var list = data.$1!;

                        List<TableColumnModel> columns = [
                          TableColumnModel(title: "Name"),
                          TableColumnModel(title: "Question Count"),
                          TableColumnModel(title: "Action", type: ColType.Widget),
                        ];

                        List<TableRowModel> rows = [];
                        int index = -1;
                        for (var el in list) {
                          rows.add(
                            TableRowModel(
                              cells: [
                                TableCellModel(data: el.name),
                                TableCellModel(data: el.questions?.length.toString()),
                                TableCellModel(
                                  data: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        onTap: () async {
                                          await context.to(CategoryCrud(category: el));
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
                                              message: "Are you sure you want to delete?",
                                              onConfirm: () async {
                                                var result = await cc.delete(el);
                                                if (result.$2 != null) {
                                                  bottomMessage(context, result.$2!.message);
                                                } else {
                                                  data.$1!.removeAt(index);
                                                  setState(() {});
                                                  bottomMessage(context, "Deleted successfully",
                                                      type: MessageType.success);
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
                                          await context.to(QuestionList(category: el));
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

                        return TablePartial(columns: columns, rows: rows);
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

  Future<void> refresh() async {
    await fetchData(direct: true);
    setState(() {});
  }
}
