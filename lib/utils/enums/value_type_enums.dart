enum SystemTileEnum {
  DropDown,
  boolean,
  Default,
  Switcher,
  Decimal,
  text,
  Tile,
  GridDropDown,
}

extension SystemTileExtension on String {
  SystemTileEnum fromStringToEnum() {
    switch (this) {
      case 'DropDown':
        return SystemTileEnum.DropDown;
      case 'Switcher':
        return SystemTileEnum.Switcher;
      case 'boolean':
        return SystemTileEnum.boolean;
      case 'Decimal':
        return SystemTileEnum.Decimal;
      case 'text':
        return SystemTileEnum.text;
      case 'Tile':
        return SystemTileEnum.Tile;
      case 'GridDropDown':
        return SystemTileEnum.GridDropDown;

      default:
        return SystemTileEnum.Default;
    }
  }
}
