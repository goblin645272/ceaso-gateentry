import 'dart:math';
import 'package:app/dashboard/constants.dart';
import 'package:app/dashboard/controllers/user_controller.dart';
import 'package:app/dashboard/screens/viewEntry/components/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:simple_grid/simple_grid.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late List<DatatableHeader> _headers;

  final List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;

  int _currentPage = 1;
  final List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<User> collectionUsers = [];
  // ignore: unused_field
  final String _selectableKey = "uniqueId";
  var formatter = DateFormat('dd/MM/yy  hh:mm');

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  final bool _showSelect = false;
  var random = Random();

  _initializeData() {
    _fetchUsers();
    _mockPullData();
  }

  _fetchUsers() async {
    fetchCollectionAuthUserlist(Uri.parse("$apiUrl/user/get-all"), {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization":
          "Bearer ${Provider.of<User>(context, listen: false).token!}",
    }).then((value) => {
          setState(
            () => collectionUsers = value,
          ),
        });
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      fetchentrylist(
        Uri.parse("$apiUrl/entry/"),
        {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization":
              "Bearer ${Provider.of<User>(context, listen: false).token!}",
        },
      ).then(
        (value) => setState(
          () {
            _sourceOriginal.clear();
            _sourceOriginal.addAll(value.map((e) => e.toJson()));
            _sourceFiltered = _sourceOriginal;
            _total = _sourceFiltered.length;
            _source = _sourceFiltered
                .getRange(
                    0, _currentPerPage! > _total ? _total : _currentPerPage!)
                .toList();
            _isLoading = false;
          },
        ),
      );
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      setState(() {
        _sourceFiltered = value.isEmpty
            ? _sourceOriginal
            : _sourceOriginal
                .where(
                  (item) =>
                      item['uniqueId']!
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      item['customer_details']!['name']!
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      formatter
                          .format(DateTime.parse(item['timestamp']))
                          .toLowerCase()
                          .contains(value.toLowerCase()),
                )
                .toList();
      });

      _total = _sourceFiltered.length;
      var rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    /// set headers
    _headers = [
      DatatableHeader(
        text: "ID",
        value: "uniqueId",
        show: true,
        sortable: true,
        flex: 1,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) => Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DatatableHeader(
        text: "Customer Name",
        value: "customer_details",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) {
          return Text(
            value['name'].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Sample count",
        value: "items_list",
        show: true,
        sortable: true,
        flex: 1,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) => Text(
          value.length.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DatatableHeader(
        text: "Recieved on",
        value: "timestamp",
        show: true,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) => Text(
          formatter.format(DateTime.parse(value)),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DatatableHeader(
        text: "Collected on",
        value: "collection_details",
        show: true,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) => Text(
          value != null
              ? formatter.format(DateTime.parse(value['timestamp']))
              : "Not collected",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: value != null ? Colors.black : Colors.red,
            fontWeight: value != null ? FontWeight.normal : FontWeight.w800,
          ),
        ),
      ),
      DatatableHeader(
        text: "Emp",
        value: "collection_details",
        show: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) => value != null
            ? Text(
                value != null ? value['employee_name'] : "Not collected",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            : DropdownButtonFormField2(
                isExpanded: true,
                hint: const Text(
                  "Employee code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  alignLabelWithHint: true,
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
                    top: 10,
                    bottom: 20,
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: collectionUsers
                    .map(
                      (item) => DropdownMenuItem<int>(
                        alignment: Alignment.center,
                        value: item.employeeCode,
                        child: Text(
                          item.employeeCode.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value12) async => {
                  setState(() => {
                        _isLoading = true,
                        _sourceFiltered = [],
                        _source = [],
                      }),
                  updateentrylist(Uri.parse("$apiUrl/entry/update"), {
                    "Content-Type": "application/json; charset=utf-8",
                    "Authorization":
                        "Bearer ${Provider.of<User>(context, listen: false).token!}"
                  }, {
                    "_id": row["_id"],
                    "employee_code": value12.toString(),
                  }),
                  _initializeData(),
                },
              ),
      ),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: ResponsiveDatatable(
        reponseScreenSizes: const [ScreenSize.xs],
        actions: [
          Expanded(
            child: TextField(
              onChanged: _filterData,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.blueGrey[50],
                labelStyle: const TextStyle(fontSize: 12),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 21),
                contentPadding: const EdgeInsets.only(left: 30),
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
          const Spacer(),
          IconButton(
            onPressed: () => print("pressed"),
            icon: const Icon(
              Icons.mail_outline,
              color: Colors.black,
              size: 40,
            ),
          )
        ],
        headers: _headers,
        source: _source,
        selecteds: _selecteds,
        showSelect: _showSelect,
        autoHeight: false,
        dropContainer: (data) {
          return _DropDownContainer(data: data, formatter: formatter);
        },
        onChangedRow: (value, header) {
          print(value.toString() + header.toString());

          /// print(value);
          /// print(header);
        },
        onSubmittedRow: (value, header) {
          /// print(value);
          /// print(header);
        },
        onTabRow: (data) {},
        onSort: (value) {
          setState(() => _isLoading = true);

          setState(() {
            _sortColumn = value;
            _sortAscending = !_sortAscending;
            if (_sortColumn == "customer_details") {
              if (_sortAscending) {
                _sourceFiltered.sort((a, b) => b["$_sortColumn"]['name']
                    .compareTo(a["$_sortColumn"]['name']));
              } else {
                _sourceFiltered.sort((a, b) => a["$_sortColumn"]['name']
                    .compareTo(b["$_sortColumn"]['name']));
              }
            } else if (_sortColumn == "items_list") {
              if (_sortAscending) {
                _sourceFiltered.sort((a, b) => b["$_sortColumn"]
                    .length
                    .toString()
                    .compareTo(a["$_sortColumn"].length.toString()));
              } else {
                _sourceFiltered.sort((a, b) => a["$_sortColumn"]
                    .length
                    .toString()
                    .compareTo(b["$_sortColumn"].length.toString()));
              }
            } else if (_sortColumn == "collection_details") {
              if (_sortAscending) {
                _sourceFiltered.sort((a, b) => (b["$_sortColumn"] != null
                        ? b["$_sortColumn"]['timestamp']
                        : "Not collected")
                    .toString()
                    .compareTo(a["$_sortColumn"] != null
                        ? a["$_sortColumn"]['timestamp']
                        : "Not collected"));
              } else {
                _sourceFiltered.sort((a, b) => (a["$_sortColumn"] != null
                        ? a["$_sortColumn"]['timestamp']
                        : "Not collected")
                    .toString()
                    .compareTo(b["$_sortColumn"] != null
                        ? b["$_sortColumn"]['timestamp']
                        : "Not collected"));
              }
            } else {
              if (_sortAscending) {
                _sourceFiltered.sort(
                    (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
              } else {
                _sourceFiltered.sort(
                    (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
              }
            }

            var rangeTop = _currentPerPage! < _sourceFiltered.length
                ? _currentPerPage!
                : _sourceFiltered.length;
            _source = _sourceFiltered.getRange(0, rangeTop).toList();

            _isLoading = false;
          });
        },
        expanded: _expanded,
        sortAscending: _sortAscending,
        sortColumn: _sortColumn,
        isLoading: _isLoading,
        onSelect: (value, item) {
          if (value!) {
            setState(() => _selecteds.add(item));
          } else {
            setState(() => _selecteds.removeAt(_selecteds.indexOf(item)));
          }
        },
        onSelectAll: (value) {
          if (value!) {
            setState(() =>
                _selecteds = _source.map((entry) => entry).toList().cast());
          } else {
            setState(() => _selecteds.clear());
          }
        },
        footers: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text("Rows per page:"),
          ),
          if (_perPages.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<int>(
                value: _currentPerPage,
                items: _perPages
                    .map((e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text("$e"),
                        ))
                    .toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    _currentPerPage = value;
                    _currentPage = 1;
                    _resetData();
                  });
                },
                isExpanded: false,
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("$_currentPage - $_currentPerPage of $_total"),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            onPressed: _currentPage == 1
                ? null
                : () {
                    var nextSet = _currentPage - _currentPerPage!;
                    setState(() {
                      _currentPage = nextSet > 1 ? nextSet : 1;
                      _resetData(start: _currentPage - 1);
                    });
                  },
            padding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            ),
            onPressed: _currentPage + _currentPerPage! - 1 > _total
                ? null
                : () {
                    var nextSet = _currentPage + _currentPerPage!;

                    setState(() {
                      _currentPage = nextSet < _total
                          ? nextSet
                          : _total - _currentPerPage!;
                      _resetData(start: nextSet - 1);
                    });
                  },
            padding: const EdgeInsets.symmetric(horizontal: 15),
          )
        ],
        headerDecoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        selectedDecoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.green[300]!, width: 1)),
          color: Colors.green,
        ),
        headerTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        rowTextStyle: const TextStyle(color: Colors.green),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  final formatter;
  const _DropDownContainer(
      {Key? key, required this.data, required this.formatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.deepPurple, width: 2)),
      child: Column(
        children: [
          Text(
            data['uniqueId'],
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
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
                  "Recieving details",
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
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Recieved by: ${data['created_name']}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Sample recieved: ${formatter.format(DateTime.parse(data['timestamp']))}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
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
                  "Collection details",
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
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Collected by: ${data['collection_details'] != null ? data['collection_details']['employee_name'] : 'Not collected'}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Collected on: ${data['collection_details'] != null ? formatter.format(DateTime.parse(data['collection_details']['timestamp'])) : 'Not collected'}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
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
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    data['recieving_details'],
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpGrid(
            spacing: 25,
            runSpacing: 2,
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
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Type: ${data["shipping_details"]!['type_of_shipment']}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Courier Name: ${data["shipping_details"]!['courier_name'] != "" || data["shipping_details"]!['courier_name'] != null ? data["shipping_details"]!['courier_name'] : "NA"}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Name: ${data["shipping_details"]!['name']}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Phone: ${data["shipping_details"]!['phone'] ?? 'NA'}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
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
                  "Customer details",
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
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Name: ${data['customer_details']!['name']}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SpGridItem(
                xs: 12,
                sm: 6,
                md: 6,
                lg: 6,
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Address: ${data['customer_details']!['address']}",
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
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
                  "Sample Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              const SpGridItem(
                xs: 12,
                sm: 8,
                md: 8,
                lg: 10,
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
              ...(data['items_list']!.map(
                (item) {
                  return SpGridItem(
                    xs: 12,
                    md: 12,
                    lg: 12,
                    sm: 12,
                    child: SpGrid(
                      spacing: 25,
                      children: [
                        SpGridItem(
                            xs: 12,
                            sm: 8,
                            md: 8,
                            lg: 10,
                            child: Container(
                              padding: const EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                item!['description'],
                                style: const TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            )),
                        SpGridItem(
                          xs: 12,
                          sm: 2,
                          md: 2,
                          lg: 2,
                          child: Container(
                            padding: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              item!['pack_quantity'],
                              style: const TextStyle(
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ))
            ],
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
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    data['comments'],
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
