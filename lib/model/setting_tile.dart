class SettingTileOption {
  final String title;
  final dynamic icon;
  final String? iconSecond;
  final String? subtitle;
  final String? type;
  final dynamic values;
  final String? description;
  final String? suffix;
  // ignore: non_constant_identifier_names
  final dynamic default_value;
  final List<SettingTileOption>? options;

  SettingTileOption({
    required this.title,
    this.icon,
    this.iconSecond,
    this.subtitle,
    this.type,
    this.values,
    this.description,
    this.suffix,
    // ignore: non_constant_identifier_names
    this.default_value,
    this.options,
  });

  factory SettingTileOption.fromJson(Map<String, dynamic> json) {
    return SettingTileOption(
      title: json['title'] ?? '',
      icon: json['icon'],
      iconSecond: json['icon_second'],
      subtitle: json['subtitle'],
      type: json['type'],
      values: json['values'],
      description: json['description'],
      suffix: json['suffix'],
      default_value: json['default_value'],
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => SettingTileOption.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
      'icon_second': iconSecond,
      'subtitle': subtitle,
      'type': type,
      'values': values,
      'description': description,
      'suffix': suffix,
      'default_value': default_value,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }
}

class SettingCategory {
  final String category;
  final String categoryType;
  final List<SettingTileOption> options;

  SettingCategory(
      {required this.category,
      required this.options,
      required this.categoryType});

  factory SettingCategory.fromJson(Map<String, dynamic> json) {
    final category = json.keys.first;
    final categoryType = json['categoryType'] ?? '';
    final optionsList = (json[category] as List<dynamic>?)
        ?.map((e) => SettingTileOption.fromJson(e))
        .toList();
    return SettingCategory(
        category: category,
        options: optionsList ?? [],
        categoryType: categoryType);
  }

  Map<String, dynamic> toJson() {
    return {
      category: options.map((e) => e.toJson()).toList(),
    };
  }
}
