import 'package:finances/pages/accounts_list.dart';
import 'package:finances/pages/overview.dart';
import 'package:finances/providers/navbar_provider.dart';
import 'package:finances/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page {
  const Page(this.label, this.icon, this.destination);

  final String label;
  final Widget icon;
  final Widget destination;
}

const List<Page> pages = <Page>[
  Page('Overview', Icon(Icons.dashboard_outlined), Overview()),
  Page('Accounts', Icon(Icons.account_balance_outlined), AccountsList()),
  // Page('Transactions', Icon(Icons.payments_outlined)),
  // Page('Credit cards', Icon(Icons.credit_card_outlined)),
  // Page('Budgets', Icon(Icons.percent_outlined)),
  // Page('Goals', Icon(Icons.ads_click_outlined)),
  // Page('Reports', Icon(Icons.find_in_page_outlined)),
  // Page('Charts', Icon(Icons.pie_chart_outline)),
  // Page('Categories', Icon(Icons.local_offer_outlined)),
  // Page('Tools', Icon(Icons.build_outlined)),
  // Page('Settings', Icon(Icons.settings_outlined)),
  // Page('About', Icon(Icons.info_outline)),
  // Page('Synchronize', Icon(Icons.sync_outlined)),
  // Page('Dark mode', Icon(Icons.dark_mode_outlined)),
];

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  double groupAlignment = -1.0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(
      builder: (context, navbar, child) {
        return NavigationRail(
          selectedIndex: _selectedIndex,
          groupAlignment: groupAlignment,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });

            Provider.of<SidebarProvider>(context, listen: false)
                .changeSelectedIndex(index);
          },
          labelType: labelType,
          extended: navbar.extended,
          destinations: pages.map(
            (Page destination) {
              return NavigationRailDestination(
                label: Text(destination.label),
                icon: destination.icon,
              );
            },
          ).toList(),
        );
      },
    );
  }
}
