import 'package:flutter/material.dart';
import 'package:flutter_application_test/enum.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: TabMenu.values
            .map((e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.txt,
                ))
            .toList(),
        onTap: (int index) {
          final selectedTab = TabMenu.values[index];
          onSelected(context, selectedTab);
        },
      ), //
    );
  }
}
