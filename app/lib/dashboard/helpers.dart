import 'package:reactive_forms/reactive_forms.dart';

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}
