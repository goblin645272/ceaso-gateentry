import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  final Function onpress;

  const SideMenu({
    Key? key,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 236, 243, 235),
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.bounceIn,
            child: Image.asset(
              "assets/images/logo-2.png",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          DrawerListTile(
            title: "Add gate entry",
            svgSrc: "assets/images/createentry.png",
            press: () => {
              onpress(0),
            },
          ),
          DrawerListTile(
            title: "View entries",
            svgSrc: "assets/images/editentry.png",
            press: () => {
              onpress(1),
            },
          ),
          // ListTile(
          //   onTap: () => {
          //     Provider.of<User>(context, listen: false).dispose(),
          //     Navigator.pushReplacement(
          //       context,
          //       CupertinoPageRoute(
          //         builder: (context) => const LoginPage(),
          //       ),
          //     ),
          //   },
          //   horizontalTitleGap: 2,
          //   leading: Image.asset(
          //     "assets/images/logout.png",
          //     height: 35,
          //     width: 80,
          //   ),
          //   title: const Text(
          //     "Logout",
          //     style: TextStyle(color: Colors.black, fontSize: 21),
          //   ),
          // ),

          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/images/settings.png",
          //   press: () => {
          //     onpress(2),
          //   },
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 2,
      // leading:  SvgPicture.asset(
      //   svgSrc,
      //   colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      //   height: 16,
      // ),
      leading: Image.asset(
        svgSrc,
        height: 35,
        width: 80,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
}
