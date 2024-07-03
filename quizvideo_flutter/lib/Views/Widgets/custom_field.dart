import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/State/input_contoller.dart';
import 'package:quizvideo_flutter/Extensions/string.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required this.name,
    required this.hintText,
    this.onChanged,
    this.onSaved,
    this.onValidator,
    this.obscureText,
    this.initialData,
    this.maxLines = 1,
    this.required = false,
    this.type = TextInputType.text,
  });

  final String name;
  final String hintText;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSaved;
  final Function(String? value)? onValidator;
  final bool? obscureText;
  final bool required;
  final String? initialData;
  final int maxLines;
  final TextInputType type;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  TextEditingController controller = TextEditingController();
  final ic = Get.find<InputController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ic.getController(widget.name, defaultValue: widget.initialData)!;
  }

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focus.requestFocus();
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: primaryColor.withOpacity(.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextFormField(
              maxLines: widget.maxLines,
              focusNode: focus,
              key: Key(widget.name),
              controller: controller,
              obscureText: widget.obscureText ?? false,
              onChanged: (value) {
                if (widget.onChanged != null) widget.onChanged!(value);
              },
              validator: (value) {
                if (widget.required && value.isNullOrEmpty) return "Please enter ${widget.hintText}";

                if (widget.onValidator != null) return widget.onValidator!(value);

                return null;
              },
              onSaved: (newValue) {
                if (widget.onSaved != null) widget.onSaved!(newValue);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.quicksand(
                  color: primaryColor.withOpacity(.5),
                ),
              ),
              style: GoogleFonts.quicksand(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: -1,
            child: Container(
              constraints: const BoxConstraints(minWidth: 50),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              child: Text(
                widget.hintText,
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
