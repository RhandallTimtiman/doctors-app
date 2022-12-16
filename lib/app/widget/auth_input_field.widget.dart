import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final bool obscureText;
  final String? hint;
  final bool isEnabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final VoidCallback? callback;
  final bool readonly;
  final TextEditingController? controller;
  final String? errorText;
  final bool isRequired;
  final Function? validator;
  final String? responseValidator;

  const AuthInputField({
    Key? key,
    required this.label,
    this.initialValue,
    required this.obscureText,
    this.hint,
    required this.isEnabled,
    this.prefixIcon,
    this.isPassword = false,
    this.callback,
    this.suffixIcon,
    this.readonly = false,
    this.controller,
    this.errorText,
    this.isRequired = false,
    this.validator,
    this.responseValidator,
  }) : super(key: key);

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: textTheme.headline6!.copyWith(
            fontSize: Screen.getProportionateScreenHeight(
              context,
              14,
            ),
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          style: textTheme.headline6!.copyWith(
            fontSize: Screen.getProportionateScreenHeight(
              context,
              14,
            ),
            fontWeight: FontWeight.w500,
            color: widget.isEnabled ? Colors.black : Colors.grey.shade600,
          ),
          obscureText: widget.obscureText,
          validator: (text) {
            if (widget.isRequired && (text == null || text.isEmpty)) {
              return 'This field is required';
            }
            if (widget.validator != null && widget.validator!(text)) {
              return widget.responseValidator;
            }
            return null;
          },
          // cursorColor: const Color.fromRGBO(
          //   73,
          //   130,
          //   61,
          //   1,
          // ),
          controller: widget.controller,
          minLines: 1,
          maxLines: widget.obscureText ? 1 : 2,
          readOnly: widget.readonly,
          decoration: InputDecoration(
            isDense: widget.prefixIcon == null,
            contentPadding: widget.prefixIcon == null
                ? const EdgeInsets.only(top: 12, left: 48.0, bottom: 8)
                : const EdgeInsets.only(top: 12, left: 24),
            counterText: "",
            // filled: true,
            // fillColor: Colors.white,
            hintText: widget.hint ?? '',
            hintStyle: TextStyle(
              fontSize: Screen.getProportionateScreenHeight(
                context,
                12,
              ),
              color: Colors.grey,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 24.0),
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
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          widget.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: widget.callback,
                      ),
                    ),
                  )
                : widget.isEnabled && widget.suffixIcon != null
                    ? IconButton(
                        icon: Icon(
                          widget.suffixIcon,
                        ),
                        onPressed: widget.callback,
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
