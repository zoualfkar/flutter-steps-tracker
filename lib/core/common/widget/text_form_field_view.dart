import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFormFieldTypes { email, password, phone, pin, text, requiredText }

class TextFormFieldView extends StatelessWidget {
  final TextFormFieldTypes textFormFieldTypes;
  final String? errorMessage;
  final EdgeInsets? scrollPadding;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? minLength;
  final bool? autofocus;
  final bool? obscureText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final void Function(String?)? onSave;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmit;
  final TextEditingController? textEditingController;
  final double? fontSize;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final bool readOnly;
  final Function()? onTap;
  final Function(String?)? validator;
  final String? title;
  final List<TextInputFormatter>? inputFormatters;
  final String? counterText;
  final EdgeInsets? padding;
  final bool enableInteractiveSelection;
  final GlobalKey? formFieldKey;

  const TextFormFieldView({
    required this.textFormFieldTypes,
    this.errorMessage,
    this.scrollPadding = const EdgeInsets.only(bottom: 200),
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.minLength,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.hintStyle,
    this.autofocus = false,
    this.obscureText = false,
    this.onSave,
    this.onChanged,
    this.onSubmit,
    this.textEditingController,
    this.fontSize,
    this.inputFormatters,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.autovalidateMode,
    this.textCapitalization,
    this.focusNode,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.title,
    this.counterText = '',
    this.padding,
    this.enableInteractiveSelection=true,
    this.formFieldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding ?? const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        key: formFieldKey,
        readOnly: readOnly,
        onTap: onTap,
        onSaved: onSave,
        onChanged: onChanged,
        autofocus: autofocus!,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        obscureText: obscureText!,
        inputFormatters: inputFormatters,
        scrollPadding: scrollPadding!,
        initialValue: initialValue,
        focusNode: focusNode,
        onFieldSubmitted: onSubmit,
        controller: textEditingController,
        autovalidateMode: autovalidateMode,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
       // cursorColor: AppColors.mainBlue,
        enableInteractiveSelection:enableInteractiveSelection,
        decoration: InputDecoration(
          label: title != null ? Text(title!) : null,
          counterText: counterText,
          hintText: hint,
          hintStyle: hintStyle ??
              Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.grey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        style: Theme.of(context).textTheme.subtitle2,
        validator: (value) {
          /// custom validator
          if (validator != null) return validator!(value);

          if (minLength == null) {
            return null;
          } else {
            debugPrint("value ${value?.length}");
            return ((value ?? "").length > (minLength ?? 1))
                ? null
                : errorMessage;
          }

          // switch (textFormFieldTypes) {
          //   case TextFormFieldTypes.email:
          //     return isEmailValid(value ?? "") ? null : errorMessage;
          //   case TextFormFieldTypes.password:
          //     return isPasswordValid(value ?? "") ? null : errorMessage;
          //   case TextFormFieldTypes.phone:
          //     return isPhoneValid(value ?? "") ? null : errorMessage;
          //   case TextFormFieldTypes.requiredText:
          //     return isTextValid(value ?? "") ? null : errorMessage;
          //   case TextFormFieldTypes.pin:
          //     final String pin = (value ?? "").trim();
          //     return isPinValid(pin) ? null : errorMessage;
          //   case TextFormFieldTypes.text:
          //     if (minLength == null) {
          //       return null;
          //     } else {
          //       debugPrint("value ${value?.length}");
          //       return ((value ?? "").length > (minLength ?? 1))
          //           ? null
          //           : errorMessage;
          //     }
          //
          //   default:
          //     return null;
          // }
        },

      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
