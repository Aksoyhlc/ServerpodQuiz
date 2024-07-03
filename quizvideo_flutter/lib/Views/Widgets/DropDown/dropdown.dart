import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    this.readOnly = false,
    this.multiple = false,
    this.onChanged,
    this.onMultiChanged,
    this.selectedKeys,
  });
  final Map<String, String> items;
  final List<String>? selectedKeys;
  final Function(String key, String value)? onChanged;
  final Function(Map<String, String> data)? onMultiChanged;

  final bool readOnly;
  final bool multiple;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String text = "Select..";
  //String selected = "";
  var selectedItems = <String, String>{};
  bool openMenu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.selectedKeys != null) {
      widget.selectedKeys!.forEach((element) {
        if (widget.items[element] != null) {
          selectedItems[element] = widget.items[element] ?? "";
        }
      });
      if (widget.multiple) {
        text = "${selectedItems.length} Selected";
      } else {
        if (selectedItems.isNotEmpty) {
          text = selectedItems.values.first;
          //selected = selectedItems.keys.first;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        openMenu = !openMenu;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: widget.readOnly ? Colors.grey.withOpacity(.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor.withOpacity(.5),
            width: 1,
          ),
          boxShadow: widget.readOnly
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.quicksand(
                      color: selectedItems.isEmpty ? primaryColor.withOpacity(.5) : primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                10.w,
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: primaryColor,
                  size: 15,
                ),
              ],
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: AbsorbPointer(
                absorbing: false,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: primaryColor.withOpacity(.5),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: openMenu ? 200 : 0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: itemsBuilder(),
                      ),
                    ),
                  ),
                ),
              ),
              crossFadeState: openMenu ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            )
          ],
        ),
      ),
    );
  }

  itemsBuilder() {
    List<Widget> children = [];
    widget.items.forEach((key, value) {
      children.add(
        InkWell(
          onTap: () {
            if (widget.multiple) {
              if (selectedItems.containsKey(key)) {
                selectedItems.remove(key);
              } else {
                selectedItems[key] = value;
              }
              text = "${selectedItems.length} Selected";

              if (selectedItems.isEmpty) {
                text = "Select...";
              }

              widget.onMultiChanged?.call(selectedItems);
            } else {
              selectedItems.clear();
              selectedItems[key] = value;
              text = value;
              widget.onChanged?.call(key, value);
            }
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                if (selectedItems.containsKey(key))
                  const Icon(
                    Icons.check,
                    color: primaryColor,
                    size: 15,
                  ),
                if (selectedItems.containsKey(key)) 10.w,
                Text(
                  value,
                  style: GoogleFonts.quicksand(
                    color: primaryColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return children;
  }
}
