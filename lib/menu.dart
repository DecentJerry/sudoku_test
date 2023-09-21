part of 'enum.dart';

enum TabMenu {
  kHome,
  kaccount,
  kSettings,
}

extension TabMenuFilterExt on TabMenu {
  bool get isBeta {
    return switch (this) {
      TabMenu.kHome || TabMenu.kaccount || TabMenu.kSettings => false,
    };
  }
}

extension ListExt on List<TabMenu> {
  List<TabMenu> get enabled {
    return where(
      (val) => !val.isBeta,
    ).toList();
  }
}

extension TabMenuExt on TabMenu {
  String get txt {
    return switch (this) {
      TabMenu.kHome => "Home",
      TabMenu.kaccount => "Account",
      TabMenu.kSettings => "Settins",
    };
  }

  Icon get icon {
    return switch (this) {
      TabMenu.kHome => const Icon(Icons.home),
      TabMenu.kaccount => const Icon(Icons.account_box),
      TabMenu.kSettings => const Icon(Icons.settings),
    };
  }
}

void onSelected(BuildContext context, TabMenu selectedTab) {
  switch (selectedTab) {
    case TabMenu.kaccount:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Account(),
        ),
      );
      break;
    case TabMenu.kHome:
      // Handle navigation for the Home tab.
      break;
    case TabMenu.kSettings:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Settings(),
        ),
      );
      break;
  }
}
