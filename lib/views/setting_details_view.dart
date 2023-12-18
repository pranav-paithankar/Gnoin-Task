import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnoin_task/model/setting_tile.dart';
import 'package:gnoin_task/res/component/decimal.dart';
import 'package:gnoin_task/res/component/dropdown.dart';
import 'package:gnoin_task/res/component/switch.dart';
import 'package:gnoin_task/res/size_config.dart';
import 'package:gnoin_task/utils/enums/value_type_enums.dart';

class SettingDetailsView extends StatelessWidget {
  final SettingCategory selectedCategory;

  const SettingDetailsView({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 136, 132, 132),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          selectedCategory.category,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ListView.builder(
          itemCount: selectedCategory.options.length,
          itemBuilder: (context, index) {
            final option = selectedCategory.options[index];

            print('type${option.type}');
            return (option.type.toString().fromStringToEnum() !=
                    SystemTileEnum.Switcher)
                ? ExpansionTile(
                    leading: buildIcon(
                      option.icon,
                    ),
                    title: option.iconSecond == null
                        ? Text(
                            option.title,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 136, 132, 132)),
                          )
                        : Row(
                            children: [
                              Text(
                                option.title,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 136, 132, 132)),
                              ),
                              const Icon(
                                Icons.star_purple500_outlined,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                    expandedAlignment: Alignment.centerLeft,
                    childrenPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: selectedCategory.categoryType != "Switcher"
                        ? option.type != null && option.type == "GridDropDown"
                            ? [
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: 50,
                                  ),
                                  itemCount: option.options!.length,
                                  itemBuilder: (context, index) {
                                    print(jsonEncode(option));
                                    return TileValueWidget(
                                        type: option.type!,
                                        value: option.options![index].values);
                                  },
                                ),
                              ]
                            : option.options!.map((e) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: e.description != null
                                            ? SizeConfig.screenHeight * 0.08
                                            : SizeConfig.screenHeight * 0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (e.type
                                                    .toString()
                                                    .fromStringToEnum() !=
                                                SystemTileEnum.Switcher)
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          e.title,
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        e.description ?? "",
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                          color: Color.fromARGB(
                                                              255,
                                                              136,
                                                              132,
                                                              132),
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            TileValueWidget(
                                                type: e.type!, value: e.values)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade300)),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList()
                        : [
                            TileValueWidget(
                                type: option.type!, value: option.values)
                          ],
                  )
                : TileValueWidget(type: option.type!, value: option.values);
          },
        ),
      ),
    );
  }

  Widget? buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(icon, color: const Color.fromARGB(255, 136, 132, 132));
    } else if (icon is String) {
      return iconMapping[icon] != null
          ? Icon(iconMapping[icon]!)
          : const Icon(Icons.error, color: Color.fromARGB(255, 136, 132, 132));
    } else {
      return null;
    }
  }
}

class TileValueWidget extends StatelessWidget {
  const TileValueWidget({super.key, required this.type, required this.value});
  final String type;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widgetAsPerType(),
      ],
    );
  }

  Widget widgetAsPerType() {
    final enumType = type.fromStringToEnum();
    print(type);
    print(value);
    switch (enumType) {
      case SystemTileEnum.DropDown:
        var items = value.cast<String>();
        return CustomDropdown(items: items, initialValue: value.first);

      case SystemTileEnum.boolean:
        var _switchValue = value;
        return CustomSwitch(initialValue: _switchValue);

      case SystemTileEnum.Decimal:
        var count = value;
        return Decimal(count: count);

      case SystemTileEnum.text:
        return Text('');

      case SystemTileEnum.Switcher:
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Regular',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Thermal',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        );

      case SystemTileEnum.Tile:
        return IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios));

      case SystemTileEnum.GridDropDown:
        var items = value.cast<String>();
        return CustomDropdown(items: items, initialValue: items.first);

      default:
        return Text(type);
    }
  }
}

// Mapping from icon names to IconData values
final Map<String, IconData> iconMapping = {
  'Icons.app_registration_outlined': Icons.app_registration_outlined,
  'Icons.lock_outline': Icons.lock_outline,
  'Icons.plagiarism_outlined': Icons.plagiarism_outlined,
  'Icons.backup_outlined': Icons.backup_outlined,
  'Icons.compare_arrows_outlined': Icons.compare_arrows_outlined,
  'Icons.text_snippet_sharp': Icons.text_snippet_sharp,
  'Icons.table_chart_outlined': Icons.table_chart_outlined,
  'Icons.hotel_class_outlined': Icons.hotel_class_outlined,
  'Icons.print_outlined': Icons.print_outlined,
};
