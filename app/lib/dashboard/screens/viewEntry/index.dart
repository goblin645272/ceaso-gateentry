import 'package:app/dashboard/screens/viewEntry/components/datapage.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:app/dashboard/screens/viewEntry/components/header.dart';

class ViewEntry extends StatefulWidget {
  const ViewEntry({super.key});

  @override
  State<ViewEntry> createState() => _ViewEntryState();
}

class _ViewEntryState extends State<ViewEntry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: const Column(
          children: <Widget>[
            Header(),
            SizedBox(height: 0.5 * defaultPadding),
            DataPage(),
          ],
        ),
      ),
    );
  }
}
