import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final String hint;
  final bool isEnabled;
  final IconData? prefixIcon;
  final bool isPassword;
  final VoidCallback? callback;
  final TextEditingController? controller;
  const DateField({
    Key? key,
    required this.label,
    this.initialValue,
    required this.hint,
    required this.isEnabled,
    this.prefixIcon,
    this.isPassword = false,
    this.callback,
    this.controller,
  }) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black,
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          initialValue: widget.initialValue,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
          obscureText: false,

          // cursorColor: const Color.fromRGBO(
          //   73,
          //   130,
          //   61,
          //   1,
          // ),
          readOnly: true,
          controller: widget.controller,
          onTap: widget.callback,
          decoration: InputDecoration(
            isDense: widget.prefixIcon == null,
            contentPadding: widget.prefixIcon == null
                ? const EdgeInsets.only(top: 10, left: 45.0, bottom: 8)
                : const EdgeInsets.only(top: 10, left: 20),
            counterText: "",
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      widget.prefixIcon,
                      // size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
            prefixIconConstraints: BoxConstraints(
              maxHeight: Screen.height(context) * 0.02,
            ),
            suffixIcon: widget.isEnabled
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Icon(Icons.calendar_month),
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(
              maxHeight: Screen.height(context) * 0.02,
            ),
          ),
          enabled: widget.isEnabled,
        ),
      ],
    );
  }
}
