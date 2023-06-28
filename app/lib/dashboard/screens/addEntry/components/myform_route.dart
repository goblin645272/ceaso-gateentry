import 'dart:convert';

import 'package:app/dashboard/constants.dart';
import 'package:app/dashboard/controllers/customer_list.dart';
import 'package:app/dashboard/controllers/entry.dart';
import 'package:app/dashboard/controllers/user_controller.dart';
import 'package:app/dashboard/screens/addEntry/components/labels.dart';
import 'package:app/dashboard/screens/addEntry/components/myform.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:app/dashboard/screens/addEntry/components/utils.dart';

class AddEntryListFormWidget extends StatefulWidget {
  const AddEntryListFormWidget({super.key});

  @override
  State<AddEntryListFormWidget> createState() => _AddEntryListFormWidgetState();
}

class _AddEntryListFormWidgetState extends State<AddEntryListFormWidget> {
  late final ValueChanged<AddEntryList>? onChange;
  List<Customer> customerlist = [];

  @override
  void initState() {
    fetchcustomerlist(
      Uri.parse("$apiUrl/customer/"),
      {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Provider.of<User>(context, listen: false).token!}",
      },
    ).then(
      (value) => setState(
        () {
          customerlist = value;
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddEntryListFormBuilder(
      model: const AddEntryList(),
      builder: (context, formModel, child) {
        formModel.recievingDetailsControl!.value =
            formModel.recievingDetailsControl!.value ?? "Unit 1";
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpGrid(
              spacing: 25,
              runSpacing: 1,
              width: MediaQuery.of(context).size.width,
              children: [
                const SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  child: Text(
                    "Recieving unit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                SpGridItem(
                  xs: 12,
                  sm: 6,
                  md: 6,
                  lg: 6,
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: CustomReactiveDropdownField(
                      formControl: formModel.recievingDetailsControl,
                      showlabel: false,
                      label: "Enter the recieving unit",
                      items: const <String>[
                        'Unit 1',
                        'Unit 2',
                      ],
                      hinttext: 'Enter the recieving unit',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SpGrid(
              spacing: 25,
              runSpacing: 1,
              width: MediaQuery.of(context).size.width,
              children: [
                const SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  child: Text(
                    "Shipping Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                SpGridItem(
                  child: SpGrid(
                    spacing: 20,
                    runSpacing: 1,
                    children: [
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveDropdownField(
                          hinttext: 'Enter the shipment type',
                          formControl: formModel
                              .shippingDetailsForm.typeOfShipmentControl,
                          showlabel: true,
                          label: "Enter shipment type",
                          items: const <String>[
                            "By hand(From customer)",
                            "By courier"
                          ],
                        ),
                      ),
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveTextFieldWithLabel(
                          key12131: courierNameName.itemKey,
                          formControl:
                              formModel.shippingDetailsForm.courierNameControl,
                          hinttext: 'Enter the name of the courier company',
                          showlabel: true,
                          label: "Courier company name",
                        ),
                      ),
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveTextFieldWithLabel(
                          key12131: contactNameName.itemKey,
                          formControl:
                              formModel.shippingDetailsForm.nameControl,
                          hinttext: "Enter name of the contact person",
                          showlabel: true,
                          label: "Contact person name",
                        ),
                      ),
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveTextFieldWithLabel(
                          key12131: contactPhoneName.itemKey,
                          formControl:
                              formModel.shippingDetailsForm.phoneControl,
                          hinttext: "Enter phone number of the contact person",
                          showlabel: true,
                          label: "Phone Number",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SpGrid(
              spacing: 25,
              runSpacing: 1,
              width: MediaQuery.of(context).size.width,
              children: [
                const SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  child: Text(
                    "Customer Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                SpGridItem(
                  padding: const EdgeInsets.only(left: 5),
                  child: SpGrid(
                    spacing: 20,
                    runSpacing: 1,
                    children: [
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveAutoFillDropdownField(
                          showIconButton: true,
                          items: customerlist
                              .map((object) => object.name!)
                              .toList(),
                          onChanged: (value) => {
                            value.value
                                    .toString()
                                    .contains('Customer not found?')
                                ? null
                                : setState(() {
                                    formModel.customerDetailsForm
                                            .addressControl!.value =
                                        customerlist
                                            .firstWhere((object) =>
                                                object.name == value.value)
                                            .address!
                                            .split(' ')
                                            .map((word) =>
                                                '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
                                            .join(' ')
                                            .toString();
                                  }),
                          },
                          addressformControl:
                              formModel.customerDetailsForm.addressControl,
                          key12131: customerNameName.itemKey,
                          formControl:
                              formModel.customerDetailsForm.nameControl,
                          hinttext: "Enter name of the customer",
                          showlabel: true,
                          label: "Customer Name",
                        ),
                      ),
                      SpGridItem(
                        xs: 12,
                        sm: 6,
                        md: 6,
                        lg: 6,
                        child: CustomReactiveDropdownField(
                          items: const <String>[
                            "Andaman & Nicobar Islands",
                            "Andhra Pradesh",
                            "Arunachal Pradesh",
                            "Assam",
                            "Bihar",
                            "Chandigarh",
                            "Chhattisgarh",
                            "Dadra and Nagar Haveli",
                            "Daman",
                            "Delhi",
                            "Goa",
                            "Gujarat",
                            "Haryana",
                            "Himachal Pradesh",
                            "Jammu and Kashmir",
                            "Jharkhand",
                            "Karnataka",
                            "Kerala",
                            "Ladakh",
                            "Lakshadweep",
                            "Madhya Pradesh",
                            "Maharashtra",
                            "Manipur",
                            "Meghalaya",
                            "Mizoram",
                            "Nagaland",
                            "Odisha",
                            "Puducherry",
                            "Punjab",
                            "Rajasthan",
                            "Sikkim",
                            "Tamil Nadu",
                            "Telangana",
                            "Tripura",
                            "Uttar Pradesh",
                            "Uttarakhand",
                            "West Bengal"
                          ],
                          // key12131: customerAddressName.itemKey,
                          formControl:
                              formModel.customerDetailsForm.addressControl,
                          hinttext: "Enter address of the customer",
                          showlabel: true,
                          label: "Address",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SpGrid(
              spacing: 25,
              runSpacing: 1,
              width: MediaQuery.of(context).size.width,
              children: [
                SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  child: Row(
                    children: [
                      const Text(
                        "Sample Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          formModel.addItemsListItem(
                            const SampleItem(packQuantity: "1"),
                          )
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shadowColor: Colors.grey,
                          backgroundColor: Colors.deepPurple,
                          shape: const CircleBorder(),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpGridItem(
                  xs: 12,
                  sm: 8,
                  md: 8,
                  lg: 9,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Sample Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                const SpGridItem(
                  xs: 12,
                  md: 2,
                  lg: 2,
                  sm: 2,
                  child: Text(
                    "Quantity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                SpGridItem(
                  child: ReactiveAddEntryListFormFormGroupArrayBuilder<
                      SampleItemForm>(
                    extended: formModel.itemsListExtendedControl,
                    itemBuilder: (context, i, formItem, _) {
                      return SpGrid(
                        margin: const EdgeInsets.only(bottom: 5),
                        spacing: 20,
                        children: [
                          SpGridItem(
                            xs: 12,
                            sm: 8,
                            md: 8,
                            lg: 9,
                            child: CustomReactiveTextFieldWithLabel(
                              key12131: descriptionName.itemIndexKey(i),
                              formControl: formItem?.descriptionControl,
                              hinttext: "Enter Sample ${i + 1} description",
                              showlabel: false,
                            ),
                          ),
                          SpGridItem(
                            xs: 12,
                            sm: 2,
                            md: 2,
                            lg: 2,
                            child: CustomReactiveTextFieldWithLabel(
                              key12131: packQuantityName.itemIndexKey(i),
                              formControl: formItem?.packQuantityControl,
                              hinttext: "Pack ${i + 1} Quantity",
                              showlabel: false,
                            ),
                          ),
                          SpGridItem(
                            xs: 12,
                            sm: 3,
                            md: 3,
                            lg: 1,
                            aligment: Alignment.bottomLeft,
                            padding: const EdgeInsets.only(left: 20),
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                formModel.removeItemsListItemAtIndex(i);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SpGrid(
              spacing: 25,
              runSpacing: 1,
              width: MediaQuery.of(context).size.width,
              children: [
                const SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  child: Text(
                    "Comments or remarks",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                SpGridItem(
                  xs: 12,
                  sm: 12,
                  md: 12,
                  lg: 12,
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomReactiveTextFieldWithLabel(
                    key12131: commentsName.itemKey,
                    formControl: formModel.commentsControl,
                    showlabel: true,
                    label: "Comments/Remarks",
                    hinttext: "Enter comments or remarks from the customer",
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                if (formModel.form.valid &&
                    formModel.itemsListControl.value!.isNotEmpty) {
                  debugPrint(formModel.model.toString());

                  formModel.submit(
                    onValid: (_) => submitEntry(
                      jsonEncode(_.toJson()),
                      Provider.of<User>(context, listen: false).token!,
                      (int statusCode) => {
                        if (statusCode == 200)
                          {
                            MotionToast.success(
                              position: MotionToastPosition.top,
                              title: const Text(
                                "Successful",
                                style: TextStyle(fontSize: 21),
                              ),
                              description: const Text(
                                "Added a new Entry",
                                style: TextStyle(fontSize: 21),
                              ),
                            ).show(context)
                          }
                        else if (statusCode == 500)
                          {
                            submitEntry(
                              jsonEncode(_.toJson()),
                              Provider.of<User>(context, listen: false).token!,
                              (int statusCode) => {
                                if (statusCode == 200)
                                  {
                                    MotionToast.success(
                                      position: MotionToastPosition.top,
                                      title: const Text(
                                        "Successful",
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      description: const Text(
                                        "Added a new Entry",
                                        style: TextStyle(fontSize: 21),
                                      ),
                                    ).show(context)
                                  }
                              },
                            ),
                          }
                        else
                          {
                            MotionToast.error(
                              position: MotionToastPosition.top,
                              title: const Text(
                                "Failed",
                                style: TextStyle(fontSize: 21),
                              ),
                              description: const Text(
                                "Addition failed! Please try again",
                                style: TextStyle(fontSize: 21),
                              ),
                            ).show(context)
                          }
                      },
                    ),
                  );

                  // onChange?.call(formModel.model);
                } else {
                  formModel.form.markAllAsTouched();
                  formModel.itemsListControl.value!.isNotEmpty
                      ? null
                      : MotionToast.error(
                          position: MotionToastPosition.top,
                          title: const Text(
                            "Failed",
                            style: TextStyle(fontSize: 21),
                          ),
                          description: const Text(
                            "Add atleast 1 sample",
                            style: TextStyle(fontSize: 21),
                          ),
                        ).show(context);
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                child: Center(
                  child: Text(
                    submit.name,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
