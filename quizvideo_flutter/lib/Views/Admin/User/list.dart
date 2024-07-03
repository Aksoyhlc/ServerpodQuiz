import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/user_contoller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Models/table_row_model.dart';
import 'package:quizvideo_flutter/Views/Admin/Result/result.dart';
import 'package:quizvideo_flutter/Views/Admin/User/add_edit.dart';
import 'package:quizvideo_flutter/Views/Admin/Widgets/table_widget.dart';
import 'package:quizvideo_flutter/Views/Widgets/confirm_dialog.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> with StateTools {
  (List<User>?, DbException?) data = (null, null);
  final udc = UserDbController();

  fetchData({bool direct = false}) async {
    if (direct) {
      data = await udc.getAll();
      return;
    }
    data = await run(() => udc.getAll());
  }

  Future<void> refresh() async {
    await fetchData(direct: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GlobalAppBar(title: "Users"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return FutureBuilderHandling(
                      snapshot: snapshot,
                      data: data,
                      success: () {
                        var list = data.$1;
                        TableRowModel(
                          cells: [],
                        );
                        List<TableColumnModel> columns = [
                          TableColumnModel(title: "#"),
                          TableColumnModel(title: "Image", type: ColType.Widget),
                          TableColumnModel(title: "Name"),
                          TableColumnModel(title: "E-Mail"),
                          TableColumnModel(title: "Username"),
                          TableColumnModel(title: "Scope"),
                          TableColumnModel(title: "Blocked"),
                          TableColumnModel(
                            title: "Actions",
                            type: ColType.Widget,
                          ),
                        ];

                        List<TableRowModel> rows = [];
                        int index = 0;
                        for (var el in data.$1!) {
                          rows.add(
                            TableRowModel(
                              cells: [
                                TableCellModel(data: el.id),
                                TableCellModel(
                                  data: Image.network(el.userInfo?.imageUrl ?? ""),
                                ),
                                TableCellModel(data: el.name),
                                TableCellModel(data: el.userInfo?.email),
                                TableCellModel(data: el.userInfo?.userName),
                                TableCellModel(data: el.userInfo?.scopeNames.join("\n")),
                                TableCellModel(data: el.userInfo?.blocked),
                                TableCellModel(
                                  data: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        onTap: () async {
                                          await context.to(UserCrud(user: el));
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
                                            message: "Are you sure you want to delete this user?",
                                            onConfirm: () async {
                                              var result = await udc.delete(el);
                                              if (result.$2 != null) {
                                                bottomMessage(context, result.$2!.message);
                                              } else {
                                                data.$1!.removeAt(index);
                                                setState(() {});
                                                bottomMessage(context, "Deleted successfully",
                                                    type: MessageType.success);
                                              }
                                              context.back();
                                            },
                                          );
                                        },
                                        bgColor: redColor,
                                        icon: Icons.delete,
                                      ),
                                      10.w,
                                      CustomButton(
                                        onTap: () async {
                                          context.to(AdminQuizResultPage(user: el));
                                        },
                                        bgColor: blueColor,
                                        icon: Icons.bar_chart,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                          index++;
                        }

                        return TablePartial(
                          columns: columns,
                          rows: rows,
                          search: true,
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
}
