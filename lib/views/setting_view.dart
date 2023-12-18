import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gnoin_task/fake_data/fake_data.dart';
import 'package:gnoin_task/model/setting_tile.dart';
import 'package:gnoin_task/res/size_config.dart';
import 'package:gnoin_task/views/setting_details_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List<SettingCategory> settingCategories = [];

  @override
  void initState() {
    super.initState();
    final List<Map<String, dynamic>> jsonData =
        List<Map<String, dynamic>>.from(json.decode(fakedata));
    settingCategories =
        jsonData.map((json) => SettingCategory.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 136, 132, 132),
                  ),
                  onPressed: () {},
                ),
                const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Container(
              width: SizeConfig.screenWidth * 0.35,
              height: SizeConfig.screenHeight * 0.05,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: ListView.builder(
          itemCount: settingCategories.length,
          itemBuilder: (context, index) {
            SettingCategory category = settingCategories[index];
            IconData iconData = _getIconData(category.category);
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    iconData,
                    color: const Color.fromARGB(255, 136, 132, 132),
                  ),
                  title: Text(
                    category.category,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 136, 132, 132)),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 136, 132, 132),
                  ),
                  onTap: () => _onCategoryTap(category),
                  tileColor: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  IconData _getIconData(String category) {
    switch (category) {
      case 'General':
        return Icons.settings_outlined;
      case 'Transaction':
        return Icons.currency_rupee_outlined;
      case 'Invoice Print':
        return Icons.print_outlined;
      case 'Taxes & GST':
        return Icons.receipt_long_outlined;
      case 'User Management':
        return Icons.groups_3_outlined;
      case 'Transaction SMS':
        return Icons.sms_outlined;
      case 'Payment Reminder':
        return Icons.watch_later_outlined;
      case 'Party':
        return Icons.people_outline;
      default:
        return Icons.list_alt_outlined;
    }
  }

  void _onCategoryTap(SettingCategory selectedCategory) {
    if (selectedCategory.options.first.options!.isNotEmpty) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SettingDetailsView(selectedCategory: selectedCategory),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } else {
      // Handle case when there are no options
      //print("No object in the tree");
    }
  }
}
