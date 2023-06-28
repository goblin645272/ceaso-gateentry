import 'package:app/dashboard/screens/addEntry/components/myform_route.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:app/dashboard/screens/addEntry/components/header.dart';

class CreateEntry extends StatefulWidget {
  const CreateEntry({super.key});

  @override
  State<CreateEntry> createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            Header(),
            SizedBox(height: 0.5 * defaultPadding),
            AddEntryListFormWidget(),
          ],
        ),
      ),
    );
  }
}
