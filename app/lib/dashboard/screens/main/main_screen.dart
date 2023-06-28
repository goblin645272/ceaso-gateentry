import 'package:app/dashboard/controllers/menu_app_controller.dart';
import 'package:app/dashboard/responsive.dart';
import 'package:app/dashboard/screens/addEntry/dashboard_screen.dart';
import 'package:app/dashboard/screens/viewEntry/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 1;

  void onpress(int selectedpage) {
    if (currentPage != selectedpage) {
      setState(() {
        currentPage = selectedpage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        onpress: onpress,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(
                  onpress: onpress,
                ),
              ),
            Expanded(
              flex: 5,
              child: currentPage == 0 ? const CreateEntry() : const ViewEntry(),
            ),
          ],
        ),
      ),
    );
  }
}
