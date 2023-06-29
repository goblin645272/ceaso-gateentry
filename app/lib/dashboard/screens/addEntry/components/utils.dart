import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:reactive_forms/reactive_forms.dart' hide ReactiveTextField;
import 'package:reactive_text_field/reactive_text_field.dart';

class CustomReactiveTextFieldWithLabel extends StatelessWidget {
  final String hinttext;
  final bool showlabel;
  final FormControl<String>? formControl;
  final String? formControlName;
  final String? label;
  final Key? key12131;
  final String? value;
  final Map<String, String Function(Object)>? validationMessage;

  const CustomReactiveTextFieldWithLabel({
    super.key,
    this.key12131,
    required this.hinttext,
    required this.showlabel,
    this.formControl,
    this.formControlName,
    this.label,
    this.validationMessage,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showlabel
            ? Text(
                label!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 21,
                ),
              )
            : Container(),
        ReactiveTextField<String>(
          validationMessages: validationMessage,
          key: key12131,
          formControl: formControl,
          formControlName: formControlName,
          maxLines: null,
          textAlign: key12131.toString().contains("Pack Quantity")
              ? TextAlign.center
              : TextAlign.left,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            fillColor: const Color.fromARGB(255, 236, 243, 235),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 21),
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 10,
              right: 30,
              bottom: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        )
      ],
    );
  }
}

class ReactiveDropdownField<T> extends ReactiveFocusableFormField<T, T> {
  ReactiveDropdownField({
    Key? key,
    String? formControlName,
    FormControl<T>? formControl,
    FocusNode? focusNode,
    required List<DropdownMenuItem<T>> items,
    Map<String, ValidationMessageFunction>? validationMessages,
    ShowErrorsFunction<T>? showErrors,
    DropdownButtonBuilder? selectedItemBuilder,
    Widget? hint,
    InputDecoration decoration = const InputDecoration(),
    Widget? disabledHint,
    int elevation = 8,
    TextStyle? style,
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 24.0,
    bool isDense = true,
    bool isExpanded = false,
    bool readOnly = false,
    double? itemHeight,
    Color? dropdownColor,
    Color? focusColor,
    bool autofocus = false,
    double? menuMaxHeight,
    bool? enableFeedback,
    String? Function(T?)? validator,
    void Function(T?)? onSaved,
    IconStyleData iconStyleData = const IconStyleData(),
    DropdownStyleData dropdownStyleData = const DropdownStyleData(),
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,
    BorderRadius? borderRadius,
    ReactiveFormFieldCallback<T>? onTap,
    ReactiveFormFieldCallback<T>? onChanged,
  })  : assert(itemHeight == null || itemHeight > 0),
        super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: showErrors,
          focusNode: focusNode,
          builder: (ReactiveFormFieldState<T, T> field) {
            final effectiveDecoration = decoration.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );

            var effectiveValue = field.value;
            if (effectiveValue != null &&
                !items.any((item) => item.value == effectiveValue)) {
              effectiveValue = null;
            }

            final isDisabled = readOnly || field.control.disabled;
            var effectiveDisabledHint = disabledHint;
            if (isDisabled && disabledHint == null) {
              final selectedItemIndex =
                  items.indexWhere((item) => item.value == effectiveValue);
              if (selectedItemIndex > -1) {
                effectiveDisabledHint = selectedItemBuilder != null
                    ? selectedItemBuilder(field.context)
                        .elementAt(selectedItemIndex)
                    : items.elementAt(selectedItemIndex).child;
              }
            }

            return DropdownButtonFormField2<T>(
              value: effectiveValue,
              decoration: effectiveDecoration.copyWith(
                errorText: field.errorText,
                enabled: !isDisabled,
              ),
              items: items,
              selectedItemBuilder: selectedItemBuilder,
              hint: hint,
              disabledHint: effectiveDisabledHint,
              validator: validator,
              onSaved: onSaved,
              style: style,
              iconStyleData: iconStyleData,
              dropdownStyleData: dropdownStyleData,
              isDense: isDense,
              isExpanded: isExpanded,
              focusNode: field.focusNode,
              autofocus: autofocus,
              enableFeedback: enableFeedback,
              alignment: alignment,
              onChanged: isDisabled
                  ? null
                  : (value) {
                      field.didChange(value);
                      onChanged?.call(field.control);
                    },
            );
          },
        );
}

class ReactiveAutoFillDropdownField<T>
    extends ReactiveFocusableFormField<T, T> {
  ReactiveAutoFillDropdownField({
    Key? keyDropdown,
    Key? key,
    String? formControlName,
    FormControl<T>? formControl,
    FocusNode? focusNode,
    required List<DropdownMenuItem<T>> items,
    Map<String, ValidationMessageFunction>? validationMessages,
    ShowErrorsFunction<T>? showErrors,
    DropdownButtonBuilder? selectedItemBuilder,
    Widget? hint,
    InputDecoration decoration = const InputDecoration(),
    Widget? disabledHint,
    int elevation = 8,
    TextStyle? style,
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 24.0,
    bool isDense = true,
    bool isExpanded = false,
    bool readOnly = false,
    double? itemHeight,
    Color? dropdownColor,
    Color? focusColor,
    bool autofocus = false,
    double? menuMaxHeight,
    bool? enableFeedback,
    String? Function(T?)? validator,
    void Function(T?)? onSaved,
    IconStyleData iconStyleData = const IconStyleData(),
    DropdownStyleData dropdownStyleData = const DropdownStyleData(),
    DropdownSearchData<T>? dropdownSearchData,
    ButtonStyleData? buttonStyleData,
    MenuItemStyleData? menuItemStyleData,
    void Function(bool)? onMenuStateChange,
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,
    BorderRadius? borderRadius,
    ReactiveFormFieldCallback<T>? onTap,
    ReactiveFormFieldCallback<T>? onChanged,
  })  : assert(itemHeight == null || itemHeight > 0),
        super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: showErrors,
          focusNode: focusNode,
          builder: (ReactiveFormFieldState<T, T> field) {
            final effectiveDecoration = decoration.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );

            var effectiveValue = field.value;
            if (effectiveValue != null &&
                !items.any((item) => item.value == effectiveValue)) {
              effectiveValue = null;
            }

            final isDisabled = readOnly || field.control.disabled;
            var effectiveDisabledHint = disabledHint;
            if (isDisabled && disabledHint == null) {
              final selectedItemIndex =
                  items.indexWhere((item) => item.value == effectiveValue);
              if (selectedItemIndex > -1) {
                effectiveDisabledHint = selectedItemBuilder != null
                    ? selectedItemBuilder(field.context)
                        .elementAt(selectedItemIndex)
                    : items.elementAt(selectedItemIndex).child;
              }
            }

            return DropdownButtonFormField2<T>(
              key: keyDropdown,
              value: effectiveValue,
              decoration: effectiveDecoration.copyWith(
                errorText: field.errorText,
                enabled: !isDisabled,
              ),
              items: items,
              selectedItemBuilder: selectedItemBuilder,
              hint: hint,
              disabledHint: effectiveDisabledHint,
              validator: validator,
              onSaved: onSaved,
              dropdownSearchData: dropdownSearchData,
              style: style,
              onMenuStateChange: onMenuStateChange,
              iconStyleData: iconStyleData,
              dropdownStyleData: dropdownStyleData,
              buttonStyleData: buttonStyleData,
              menuItemStyleData: menuItemStyleData!,
              isDense: isDense,
              isExpanded: isExpanded,
              focusNode: field.focusNode,
              autofocus: autofocus,
              enableFeedback: enableFeedback,
              alignment: alignment,
              onChanged: isDisabled
                  ? null
                  : (value) {
                      field.didChange(value);
                      onChanged?.call(field.control);
                    },
            );
          },
        );
}

class CustomReactiveAutoFillDropdownField extends StatefulWidget {
  final bool showlabel;
  final String? label;
  final FormControl<String>? formControl;
  final String? formControlName;
  final String hinttext;
  final List<String> items;
  final Key? key12131;
  final FormControl<String>? addressformControl;
  final Function(FormControl<Object?>)? onChanged;
  final bool showIconButton;
  const CustomReactiveAutoFillDropdownField({
    super.key,
    required this.showlabel,
    this.label,
    this.formControl,
    this.formControlName,
    required this.hinttext,
    required this.items,
    this.key12131,
    this.addressformControl,
    this.onChanged,
    required this.showIconButton,
  });

  @override
  State<CustomReactiveAutoFillDropdownField> createState() =>
      _CustomReactiveAutoFillDropdownFieldState();
}

class _CustomReactiveAutoFillDropdownFieldState
    extends State<CustomReactiveAutoFillDropdownField> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  late GlobalKey dropdownKey;
  final mybuttonkey = GlobalKey();
  @override
  void initState() {
    dropdownKey =
        GlobalKey(); // Init GlobalKey, allows to close the DropdownButton
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showlabel
            ? Text(
                widget.label!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 21,
                ),
              )
            : Container(),
        ReactiveAutoFillDropdownField(
          keyDropdown: dropdownKey,
          key: widget.key12131,
          formControl: widget.formControl,
          formControlName: widget.formControlName,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            filled: true,
            fillColor: const Color.fromARGB(255, 236, 243, 235),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 21),
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 10,
              right: 20,
              bottom: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 200,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 400,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  suffix: widget.showIconButton
                      ? IconButton(
                          key: mybuttonkey,
                          disabledColor: Colors.grey,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () => {
                            if (!widget.items
                                .contains(textEditingController.text))
                              {
                                Navigator.pop(dropdownKey.currentContext!),
                                setState(() {
                                  widget.items.add(textEditingController.text);
                                  widget.formControl!.value =
                                      textEditingController.text;
                                  widget.addressformControl!.value = "";
                                }),
                                FocusScope.of(context).unfocus(),
                                widget.addressformControl!.focus(),
                                MotionToast.success(
                                  position: MotionToastPosition.top,
                                  title: const Text("Customer Added",
                                      style: TextStyle(fontSize: 21)),
                                  description: const Text(
                                    "Enter the address to confirm",
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ).show(context),
                              }
                          },
                        )
                      : null,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  hintText: 'Search for a customer...',
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return widget.showIconButton
                  ? item.value
                          .toString()
                          .contains("Customer not found? Click here to add")
                      ? true
                      : (item.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase()))
                  : (item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()));
            },
          ),
          isExpanded: true,
          hint: Text(
            widget.hinttext,
            style: const TextStyle(fontSize: 21, color: Colors.grey),
          ),
          items: widget.items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              )
              .toList(),

          validator: (value) {
            if (value == null) {
              return '';
            }
            return null;
          },
          onChanged: (value) => {
            widget.onChanged!(value),
          },
          onSaved: (value) {
            // setState(() {
            //   selectedValue = value.toString();
            // });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
          ),
          // dropdownStyleData: DropdownStyleData(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          // ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ],
    );
  }
}

class CustomReactiveDropdownField extends StatelessWidget {
  final List<String> items;
  final bool showlabel;
  final FormControl? formControl;
  final String? formControlName;
  final String? label;
  final String? hinttext;

  const CustomReactiveDropdownField({
    super.key,
    required this.items,
    this.formControl,
    this.formControlName,
    required this.showlabel,
    this.label,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showlabel
            ? Text(
                label!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 21,
                ),
              )
            : Container(),
        ReactiveDropdownField(
          formControl: formControl,
          formControlName: formControlName,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 236, 243, 235),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 21),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.only(
              left: 10,
              right: 30,
              top: 10,
              bottom: 20,
            ),
          ),
          isExpanded: true,
          hint: Text(
            hinttext!,
            style: const TextStyle(fontSize: 21, color: Colors.grey),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              )
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select the recieving details.';
            }
            return null;
          },
          onChanged: (value) {
            //Do something when changing the item if you want.
          },
          onSaved: (value) {
            // setState(() {
            //   selectedValue = value.toString();
            // });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
