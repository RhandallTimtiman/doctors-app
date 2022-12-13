import 'package:flutter/material.dart';

class InfoFieldUpload extends StatefulWidget {
  final String label;
  final String? initialValue;
  final bool obscureText;
  final String hint;
  final bool isEnabled;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final bool isPassword;
  final VoidCallback? callback;
  final bool readonly;
  final TextEditingController? controller;

  const InfoFieldUpload({
    Key? key,
    required this.label,
    this.initialValue,
    required this.obscureText,
    required this.hint,
    required this.isEnabled,
    this.prefixIcon,
    this.isPassword = false,
    this.callback,
    this.suffixWidget,
    this.readonly = false,
    this.controller,
  }) : super(key: key);

  @override
  State<InfoFieldUpload> createState() => _InfoFieldUploadState();
}

class _InfoFieldUploadState extends State<InfoFieldUpload> {
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
          onTap: () {
            if (widget.callback != null) {
              widget.callback!();
            }
          },
          textInputAction: TextInputAction.next,
          style: TextStyle(
            fontSize: 12,
            color: widget.isEnabled ? Colors.black : Colors.grey.shade600,
          ),
          obscureText: widget.obscureText,

          // cursorColor: const Color.fromRGBO(
          //   73,
          //   130,
          //   61,
          //   1,
          // ),
          controller: widget.controller,
          readOnly: widget.readonly,
          decoration: InputDecoration(
            isDense: widget.prefixIcon == null,
            contentPadding: widget.prefixIcon == null
                ? const EdgeInsets.only(top: 15, left: 45.0, bottom: 8)
                : const EdgeInsets.only(top: 15, left: 20),
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
                      color: const Color.fromRGBO(
                        73,
                        130,
                        61,
                        1,
                      ),
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 30,
            ),
            suffixIcon: widget.suffixWidget,
          ),
          enabled: widget.isEnabled,
        ),
      ],
    );
  }
}
