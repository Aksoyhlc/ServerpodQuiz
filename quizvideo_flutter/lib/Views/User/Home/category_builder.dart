import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/list.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Views/User/Category/Widgets/category_row.dart';
import 'package:quizvideo_flutter/Views/User/Category/list.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key, this.categories});
  final List<Category>? categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          10.h,
          Row(
            children: [
              Text(
                "Categories",
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.to(const CategoryList());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "All Category",
                    style: GoogleFonts.quicksand(
                      color: primaryColor.withOpacity(.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          20.h,
          ...listBuilder()
        ],
      ),
    );
  }

  List<Widget> listBuilder() {
    List<Widget> list = [];
    for (Category el in categories ?? []) {
      list.add(CategoryRow(item: el));
    }

    return list.seperatedBy(10.h);
  }
}
