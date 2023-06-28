// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'myform.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveAddEntryListFormConsumer extends StatelessWidget {
  const ReactiveAddEntryListFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, AddEntryListForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddEntryListForm.of(context);

    if (formModel is! AddEntryListForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class AddEntryListFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const AddEntryListFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final AddEntryListForm form;
}

class ReactiveAddEntryListForm extends StatelessWidget {
  const ReactiveAddEntryListForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final AddEntryListForm form;

  final WillPopCallback? onWillPop;

  static AddEntryListForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              AddEntryListFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        AddEntryListFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as AddEntryListFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return AddEntryListFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class AddEntryListFormBuilder extends StatefulWidget {
  const AddEntryListFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final AddEntryList? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, AddEntryListForm formModel, Widget? child) builder;

  final void Function(BuildContext context, AddEntryListForm formModel)?
      initState;

  @override
  _AddEntryListFormBuilderState createState() =>
      _AddEntryListFormBuilderState();
}

class _AddEntryListFormBuilderState extends State<AddEntryListFormBuilder> {
  late AddEntryListForm _formModel;

  @override
  void initState() {
    _formModel =
        AddEntryListForm(AddEntryListForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AddEntryListFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          AddEntryListForm(AddEntryListForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveAddEntryListForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class AddEntryListForm implements FormModel<AddEntryList> {
  AddEntryListForm(
    this.form,
    this.path,
  );

  static const String recievingDetailsControlName = "recievingDetails";

  static const String itemsListControlName = "itemsList";

  static const String shippingDetailsControlName = "shippingDetails";

  static const String customerDetailsControlName = "customerDetails";

  static const String commentsControlName = "comments";

  final FormGroup form;

  final String? path;

  String recievingDetailsControlPath() =>
      pathBuilder(recievingDetailsControlName);
  String commentsControlPath() => pathBuilder(commentsControlName);
  String shippingDetailsControlPath() =>
      pathBuilder(shippingDetailsControlName);
  String customerDetailsControlPath() =>
      pathBuilder(customerDetailsControlName);
  String itemsListControlPath() => pathBuilder(itemsListControlName);
  String? get _recievingDetailsValue => recievingDetailsControl?.value;
  String? get _commentsValue => commentsControl?.value;
  ShippingDetails? get _shippingDetailsValue => shippingDetailsForm.model;
  CustomerDetails? get _customerDetailsValue => customerDetailsForm.model;
  List<SampleItem> get _itemsListValue =>
      itemsListSampleItemForm.map((e) => e.model).toList();
  bool get containsRecievingDetails {
    try {
      form.control(recievingDetailsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsComments {
    try {
      form.control(commentsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsShippingDetails {
    try {
      form.control(shippingDetailsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCustomerDetails {
    try {
      form.control(customerDetailsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsItemsList {
    try {
      form.control(itemsListControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get recievingDetailsErrors => recievingDetailsControl?.errors;
  Object? get commentsErrors => commentsControl?.errors;
  Object? get shippingDetailsErrors => shippingDetailsControl?.errors;
  Object? get customerDetailsErrors => customerDetailsControl?.errors;
  Object? get itemsListErrors => itemsListControl.errors;
  void get recievingDetailsFocus => form.focus(recievingDetailsControlPath());
  void get commentsFocus => form.focus(commentsControlPath());
  void get shippingDetailsFocus => form.focus(shippingDetailsControlPath());
  void get customerDetailsFocus => form.focus(customerDetailsControlPath());
  void get itemsListFocus => form.focus(itemsListControlPath());
  void recievingDetailsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRecievingDetails) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          recievingDetailsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            recievingDetailsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void commentsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsComments) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          commentsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            commentsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void shippingDetailsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsShippingDetails) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          shippingDetailsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            shippingDetailsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void customerDetailsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCustomerDetails) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          customerDetailsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            customerDetailsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void recievingDetailsValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recievingDetailsControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void commentsValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    commentsControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shippingDetailsValueUpdate(
    ShippingDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shippingDetailsControl?.updateValue(
        ShippingDetailsForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void customerDetailsValueUpdate(
    CustomerDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customerDetailsControl?.updateValue(
        CustomerDetailsForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void itemsListValueUpdate(
    List<SampleItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      itemsListClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <SampleItem>[];
    final toAdd = <SampleItem>[];

    localValue.asMap().forEach((k, v) {
      if (itemsListSampleItemForm.asMap().containsKey(k) &&
          (itemsListControl.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      itemsListControl.updateValue(
          toUpdate.map((e) => SampleItemForm.formElements(e).rawValue).toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        itemsListControl.add(SampleItemForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void itemsListInsert(
    int i,
    SampleItem value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((itemsListControl.value ?? []).length < i) {
      addItemsListItem(value);
      return;
    }

    itemsListControl.insert(
      i,
      SampleItemForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void itemsListClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    itemsListSampleItemForm.clear();
    itemsListControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void recievingDetailsValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recievingDetailsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void commentsValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    commentsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shippingDetailsValuePatch(
    ShippingDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shippingDetailsControl?.updateValue(
        ShippingDetailsForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void customerDetailsValuePatch(
    CustomerDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customerDetailsControl?.updateValue(
        CustomerDetailsForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void itemsListValuePatch(
    List<SampleItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = itemsListSampleItemForm.asMap().keys;

    final toPatch = <SampleItem>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    itemsListControl.patchValue(
        toPatch.map((e) => SampleItemForm.formElements(e).rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void recievingDetailsValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      recievingDetailsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void commentsValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      commentsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void shippingDetailsValueReset(
    ShippingDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      shippingDetailsControl?.reset(
          value: ShippingDetailsForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void customerDetailsValueReset(
    CustomerDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      customerDetailsControl?.reset(
          value: CustomerDetailsForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void itemsListValueReset(
    List<SampleItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      itemsListControl.reset(
          value: value
              .map((e) => SampleItemForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
  FormControl<String>? get recievingDetailsControl => containsRecievingDetails
      ? form.control(recievingDetailsControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get commentsControl => containsComments
      ? form.control(commentsControlPath()) as FormControl<String>?
      : null;
  FormGroup? get shippingDetailsControl => containsShippingDetails
      ? form.control(shippingDetailsControlPath()) as FormGroup?
      : null;
  FormGroup? get customerDetailsControl => containsCustomerDetails
      ? form.control(customerDetailsControlPath()) as FormGroup?
      : null;
  FormArray<Map<String, Object?>> get itemsListControl =>
      form.control(itemsListControlPath()) as FormArray<Map<String, Object?>>;
  ShippingDetailsForm get shippingDetailsForm =>
      ShippingDetailsForm(form, pathBuilder('shippingDetails'));
  CustomerDetailsForm get customerDetailsForm =>
      CustomerDetailsForm(form, pathBuilder('customerDetails'));
  List<SampleItemForm> get itemsListSampleItemForm => (itemsListControl.value ??
          [])
      .asMap()
      .map((k, v) =>
          MapEntry(k, SampleItemForm(form, pathBuilder("itemsList.$k"))))
      .values
      .toList();
  void recievingDetailsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      recievingDetailsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      recievingDetailsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void commentsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      commentsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      commentsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void shippingDetailsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      shippingDetailsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      shippingDetailsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void customerDetailsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      customerDetailsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      customerDetailsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void itemsListSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      itemsListControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      itemsListControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<SampleItemForm>>
      get itemsListExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<SampleItemForm>>(
              form.control(itemsListControlPath())
                  as FormArray<Map<String, Object?>>,
              () => itemsListSampleItemForm);
  void addItemsListItem(SampleItem value) {
    itemsListControl.add(SampleItemForm.formElements(value));
  }

  void removeItemsListItemAtIndex(int i) {
    if ((itemsListControl.value ?? []).length > i) {
      itemsListControl.removeAt(i);
    }
  }

  void addItemsListItemList(List<SampleItem> value) {
    value.map((e) => addItemsListItem(e));
  }

  @override
  AddEntryList get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'AddEntryListForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return AddEntryList(
        recievingDetails: _recievingDetailsValue,
        itemsList: _itemsListValue,
        shippingDetails: _shippingDetailsValue,
        customerDetails: _customerDetailsValue,
        comments: _commentsValue);
  }

  void submit({
    required void Function(AddEntryList model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    AddEntryList value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(AddEntryListForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    AddEntryList? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(AddEntryList? addEntryList) => FormGroup({
        recievingDetailsControlName: FormControl<String>(
            value: addEntryList?.recievingDetails,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        itemsListControlName: FormArray(
            (addEntryList?.itemsList ?? [])
                .map((e) => SampleItemForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        commentsControlName: FormControl<String>(
            value: addEntryList?.comments,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        shippingDetailsControlName:
            ShippingDetailsForm.formElements(addEntryList?.shippingDetails),
        customerDetailsControlName:
            CustomerDetailsForm.formElements(addEntryList?.customerDetails)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ShippingDetailsForm implements FormModel<ShippingDetails> {
  ShippingDetailsForm(
    this.form,
    this.path,
  );

  static const String nameControlName = "name";

  static const String typeOfShipmentControlName = "typeOfShipment";

  static const String courierNameControlName = "courierName";

  static const String phoneControlName = "phone";

  final FormGroup form;

  final String? path;

  String nameControlPath() => pathBuilder(nameControlName);
  String typeOfShipmentControlPath() => pathBuilder(typeOfShipmentControlName);
  String courierNameControlPath() => pathBuilder(courierNameControlName);
  String phoneControlPath() => pathBuilder(phoneControlName);
  String? get _nameValue => nameControl?.value;
  String? get _typeOfShipmentValue => typeOfShipmentControl?.value;
  String? get _courierNameValue => courierNameControl?.value;
  String? get _phoneValue => phoneControl?.value;
  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTypeOfShipment {
    try {
      form.control(typeOfShipmentControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCourierName {
    try {
      form.control(courierNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPhone {
    try {
      form.control(phoneControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl?.errors;
  Object? get typeOfShipmentErrors => typeOfShipmentControl?.errors;
  Object? get courierNameErrors => courierNameControl?.errors;
  Object? get phoneErrors => phoneControl?.errors;
  void get nameFocus => form.focus(nameControlPath());
  void get typeOfShipmentFocus => form.focus(typeOfShipmentControlPath());
  void get courierNameFocus => form.focus(courierNameControlPath());
  void get phoneFocus => form.focus(phoneControlPath());
  void nameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          nameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            nameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void typeOfShipmentRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTypeOfShipment) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          typeOfShipmentControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            typeOfShipmentControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void courierNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCourierName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          courierNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            courierNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void phoneRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPhone) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          phoneControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            phoneControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void nameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeOfShipmentValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeOfShipmentControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void courierNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    courierNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void phoneValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    phoneControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeOfShipmentValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeOfShipmentControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void courierNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    courierNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void phoneValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    phoneControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void typeOfShipmentValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      typeOfShipmentControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void courierNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      courierNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void phoneValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      phoneControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get nameControl => containsName
      ? form.control(nameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get typeOfShipmentControl => containsTypeOfShipment
      ? form.control(typeOfShipmentControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get courierNameControl => containsCourierName
      ? form.control(courierNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get phoneControl => containsPhone
      ? form.control(phoneControlPath()) as FormControl<String>?
      : null;
  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void typeOfShipmentSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      typeOfShipmentControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      typeOfShipmentControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void courierNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      courierNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      courierNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void phoneSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      phoneControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      phoneControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  ShippingDetails get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'ShippingDetailsForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return ShippingDetails(
        name: _nameValue,
        typeOfShipment: _typeOfShipmentValue,
        courierName: _courierNameValue,
        phone: _phoneValue);
  }

  void submit({
    required void Function(ShippingDetails model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    ShippingDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(ShippingDetailsForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    ShippingDetails? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(ShippingDetails? shippingDetails) => FormGroup({
        nameControlName: FormControl<String>(
            value: shippingDetails?.name,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        typeOfShipmentControlName: FormControl<String>(
            value: shippingDetails?.typeOfShipment,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        courierNameControlName: FormControl<String>(
            value: shippingDetails?.courierName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        phoneControlName: FormControl<String>(
            value: shippingDetails?.phone,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class CustomerDetailsForm implements FormModel<CustomerDetails> {
  CustomerDetailsForm(
    this.form,
    this.path,
  );

  static const String addressControlName = "address";

  static const String nameControlName = "name";

  final FormGroup form;

  final String? path;

  String addressControlPath() => pathBuilder(addressControlName);
  String nameControlPath() => pathBuilder(nameControlName);
  String? get _addressValue => addressControl?.value;
  String? get _nameValue => nameControl?.value;
  bool get containsAddress {
    try {
      form.control(addressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get addressErrors => addressControl?.errors;
  Object? get nameErrors => nameControl?.errors;
  void get addressFocus => form.focus(addressControlPath());
  void get nameFocus => form.focus(nameControlPath());
  void addressRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAddress) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          addressControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            addressControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void nameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          nameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            nameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void addressValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      addressControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void nameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get addressControl => containsAddress
      ? form.control(addressControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get nameControl => containsName
      ? form.control(nameControlPath()) as FormControl<String>?
      : null;
  void addressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addressControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addressControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  CustomerDetails get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'CustomerDetailsForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return CustomerDetails(address: _addressValue, name: _nameValue);
  }

  void submit({
    required void Function(CustomerDetails model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    CustomerDetails? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(CustomerDetailsForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    CustomerDetails? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(CustomerDetails? customerDetails) => FormGroup({
        addressControlName: FormControl<String>(
            value: customerDetails?.address,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        nameControlName: FormControl<String>(
            value: customerDetails?.name,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class SampleItemForm implements FormModel<SampleItem> {
  SampleItemForm(
    this.form,
    this.path,
  );

  static const String descriptionControlName = "description";

  static const String packQuantityControlName = "packQuantity";

  final FormGroup form;

  final String? path;

  String descriptionControlPath() => pathBuilder(descriptionControlName);
  String packQuantityControlPath() => pathBuilder(packQuantityControlName);
  String? get _descriptionValue => descriptionControl?.value;
  String? get _packQuantityValue => packQuantityControl?.value;
  bool get containsDescription {
    try {
      form.control(descriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPackQuantity {
    try {
      form.control(packQuantityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get descriptionErrors => descriptionControl?.errors;
  Object? get packQuantityErrors => packQuantityControl?.errors;
  void get descriptionFocus => form.focus(descriptionControlPath());
  void get packQuantityFocus => form.focus(packQuantityControlPath());
  void descriptionRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDescription) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          descriptionControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            descriptionControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void packQuantityRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPackQuantity) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          packQuantityControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            packQuantityControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void descriptionValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void packQuantityValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    packQuantityControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void packQuantityValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    packQuantityControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      descriptionControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void packQuantityValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      packQuantityControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get descriptionControl => containsDescription
      ? form.control(descriptionControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get packQuantityControl => containsPackQuantity
      ? form.control(packQuantityControlPath()) as FormControl<String>?
      : null;
  void descriptionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      descriptionControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      descriptionControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void packQuantitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      packQuantityControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      packQuantityControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  SampleItem get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'SampleItemForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return SampleItem(
        description: _descriptionValue, packQuantity: _packQuantityValue);
  }

  void submit({
    required void Function(SampleItem model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    SampleItem value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(SampleItemForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    SampleItem? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(SampleItem? sampleItem) => FormGroup({
        descriptionControlName: FormControl<String>(
            value: sampleItem?.description,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        packQuantityControlName: FormControl<String>(
            value: sampleItem?.packQuantity,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveAddEntryListFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveAddEntryListFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(AddEntryListForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AddEntryListForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, AddEntryListForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddEntryListForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveAddEntryListFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveAddEntryListFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      AddEntryListForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      AddEntryListForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, AddEntryListForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveAddEntryListForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveStandaloneSampleItemFormConsumer extends StatelessWidget {
  const ReactiveStandaloneSampleItemFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context,
      StandaloneSampleItemForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStandaloneSampleItemForm.of(context);

    if (formModel is! StandaloneSampleItemForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class StandaloneSampleItemFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const StandaloneSampleItemFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final StandaloneSampleItemForm form;
}

class ReactiveStandaloneSampleItemForm extends StatelessWidget {
  const ReactiveStandaloneSampleItemForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final StandaloneSampleItemForm form;

  final WillPopCallback? onWillPop;

  static StandaloneSampleItemForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              StandaloneSampleItemFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        StandaloneSampleItemFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as StandaloneSampleItemFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return StandaloneSampleItemFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class StandaloneSampleItemFormBuilder extends StatefulWidget {
  const StandaloneSampleItemFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final SampleItem? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(BuildContext context,
      StandaloneSampleItemForm formModel, Widget? child) builder;

  final void Function(BuildContext context, StandaloneSampleItemForm formModel)?
      initState;

  @override
  _StandaloneSampleItemFormBuilderState createState() =>
      _StandaloneSampleItemFormBuilderState();
}

class _StandaloneSampleItemFormBuilderState
    extends State<StandaloneSampleItemFormBuilder> {
  late StandaloneSampleItemForm _formModel;

  @override
  void initState() {
    _formModel = StandaloneSampleItemForm(
        StandaloneSampleItemForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant StandaloneSampleItemFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = StandaloneSampleItemForm(
          StandaloneSampleItemForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveStandaloneSampleItemForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class StandaloneSampleItemForm implements FormModel<SampleItem> {
  StandaloneSampleItemForm(
    this.form,
    this.path,
  );

  static const String descriptionControlName = "description";

  static const String packQuantityControlName = "packQuantity";

  final FormGroup form;

  final String? path;

  String descriptionControlPath() => pathBuilder(descriptionControlName);
  String packQuantityControlPath() => pathBuilder(packQuantityControlName);
  String? get _descriptionValue => descriptionControl?.value;
  String? get _packQuantityValue => packQuantityControl?.value;
  bool get containsDescription {
    try {
      form.control(descriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPackQuantity {
    try {
      form.control(packQuantityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get descriptionErrors => descriptionControl?.errors;
  Object? get packQuantityErrors => packQuantityControl?.errors;
  void get descriptionFocus => form.focus(descriptionControlPath());
  void get packQuantityFocus => form.focus(packQuantityControlPath());
  void descriptionRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDescription) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          descriptionControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            descriptionControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void packQuantityRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPackQuantity) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          packQuantityControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            packQuantityControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void descriptionValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void packQuantityValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    packQuantityControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    descriptionControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void packQuantityValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    packQuantityControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      descriptionControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void packQuantityValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      packQuantityControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get descriptionControl => containsDescription
      ? form.control(descriptionControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get packQuantityControl => containsPackQuantity
      ? form.control(packQuantityControlPath()) as FormControl<String>?
      : null;
  void descriptionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      descriptionControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      descriptionControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void packQuantitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      packQuantityControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      packQuantityControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  SampleItem get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'StandaloneSampleItemForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return SampleItem(
        description: _descriptionValue, packQuantity: _packQuantityValue);
  }

  void submit({
    required void Function(SampleItem model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    SampleItem value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(StandaloneSampleItemForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    SampleItem? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(SampleItem? sampleItem) => FormGroup({
        descriptionControlName: FormControl<String>(
            value: sampleItem?.description,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        packQuantityControlName: FormControl<String>(
            value: sampleItem?.packQuantity,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveStandaloneSampleItemFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveStandaloneSampleItemFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(StandaloneSampleItemForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      StandaloneSampleItemForm formModel)? builder;

  final Widget Function(BuildContext context, int i, T? item,
      StandaloneSampleItemForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStandaloneSampleItemForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveStandaloneSampleItemFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveStandaloneSampleItemFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      StandaloneSampleItemForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      StandaloneSampleItemForm formModel)? builder;

  final Widget Function(BuildContext context, int i, V? item,
      StandaloneSampleItemForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStandaloneSampleItemForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
