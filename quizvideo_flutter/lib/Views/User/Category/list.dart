import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/User/Category/Widgets/category_row.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> with StateTools {
  final cc = CategoryDbController();

  (List<Category>?, DbException?) categories = (null, null);

  fetchData() async {
    categories = await run(() => cc.getAll(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GlobalAppBar(title: "Category List"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }

                    if (snapshot.hasError) {
                      return CenterTextMessage(snapshot.error.toString());
                    }

                    if (categories.$1 == null) {
                      return CenterTextMessage(categories.$2?.message ?? "Error");
                    }
                    var list = (categories.$1 ?? []);
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return 10.h;
                      },
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        var item = list[index];
                        return CategoryRow(item: item);
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
