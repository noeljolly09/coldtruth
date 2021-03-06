import 'package:flutter/material.dart';
import 'package:idec_face/custom_widgets/drawer/profilephoto.dart';

import '../../constants.dart';
import '../../screens/stores/stores.dart';
import 'drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppConstants.primaryColor),
            margin: EdgeInsets.only(bottom: 40.0),
            currentAccountPicture: ProfilePhotoDrawer(),
            accountName: Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              'Domain',
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawerItem(
            svg: "assets/svg/home.svg",
            text: "Stores",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StoresPage()));
            },
          ),
          drawerItem(
            svg: "assets/svg/device.svg",
            text: "Analytics",
            onTap: () {},
          ),
          drawerItem(
            svg: "assets/svg/support.svg",
            text: "Reports",
            onTap: () {},
          ),
          drawerItem(
            svg: "assets/svg/settings.svg",
            text: "Users",
            onTap: () {},
          ),
          const Divider(color: AppConstants.customblack),
          drawerItem(
            svg: "assets/svg/logout.svg",
            text: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
