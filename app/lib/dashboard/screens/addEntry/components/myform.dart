import 'package:app/dashboard/helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'myform.gform.dart';

@ReactiveFormAnnotation()
class AddEntryList extends Equatable {
  final String? recievingDetails;

  final List<SampleItem> itemsList;
  final ShippingDetails? shippingDetails;
  final CustomerDetails? customerDetails;
  final String? comments;

  const AddEntryList({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.recievingDetails = '',
    @FormArrayAnnotation() this.itemsList = const [],
    @FormControlAnnotation<ShippingDetails>(
      validators: [requiredValidator],
    )
    this.shippingDetails = const ShippingDetails(),
    @FormControlAnnotation<CustomerDetails>(
      validators: [requiredValidator],
    )
    this.customerDetails = const CustomerDetails(),
    @FormControlAnnotation<String>() this.comments = '',
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recieving_details'] = recievingDetails;
    if (shippingDetails != null) {
      data['shipping_details'] = shippingDetails!.toJson();
    }
    if (customerDetails != null) {
      data['customer_details'] = customerDetails!.toJson();
    }
    data['items_list'] = itemsList.map((v) => v.toJson()).toList();
    data['comments'] = comments;
    return data;
  }

  @override
  List<Object?> get props => [
        recievingDetails,
        shippingDetails,
        customerDetails,
        itemsList,
        comments,
      ];
}

@ReactiveFormAnnotation(name: 'StandaloneSampleItem')
@FormGroupAnnotation()
class SampleItem extends Equatable {
  final String? description;

  final String? packQuantity;
  const SampleItem({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.description = '',
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.packQuantity,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['pack_quantity'] = packQuantity;
    return data;
  }

  @override
  List<Object?> get props => [
        description,
        packQuantity,
      ];
}

@FormGroupAnnotation()
class ShippingDetails extends Equatable {
  final String? courierName;

  final String? name;
  final String? typeOfShipment;
  final String? phone;
  const ShippingDetails({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.name = '',
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.typeOfShipment = '',
    @FormControlAnnotation<String>() this.courierName = '',
    @FormControlAnnotation<String>() this.phone = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_of_shipment'] = typeOfShipment;
    data['courier_name'] = courierName;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }

  @override
  List<Object?> get props => [typeOfShipment, courierName, phone, name];
}

@FormGroupAnnotation()
class CustomerDetails extends Equatable {
  final String? name;

  final String? address;

  const CustomerDetails({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
    this.address = '',
    @FormControlAnnotation<String>() this.name = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }

  @override
  List<Object?> get props => [address, name];
}
