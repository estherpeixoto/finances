import 'package:finances/providers/navbar_provider.dart';
import 'package:finances/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon);

  final String label;
  final Widget icon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Overview', Icon(Icons.dashboard_outlined)),
  ExampleDestination('Accounts', Icon(Icons.account_balance_outlined)),
  ExampleDestination('Transactions', Icon(Icons.payments_outlined)),
  ExampleDestination('Credit cards', Icon(Icons.credit_card_outlined)),
  ExampleDestination('Budgets', Icon(Icons.percent_outlined)),
  ExampleDestination('Goals', Icon(Icons.ads_click_outlined)),
  ExampleDestination('Reports', Icon(Icons.find_in_page_outlined)),
  ExampleDestination('Charts', Icon(Icons.pie_chart_outline)),
  ExampleDestination('Categories', Icon(Icons.local_offer_outlined)),
  ExampleDestination('Tools', Icon(Icons.build_outlined)),
  ExampleDestination('Settings', Icon(Icons.settings_outlined)),
  ExampleDestination('About', Icon(Icons.info_outline)),
  ExampleDestination('Synchronize', Icon(Icons.sync_outlined)),
  ExampleDestination('Dark mode', Icon(Icons.dark_mode_outlined)),
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
          destinations: destinations.map(
            (ExampleDestination destination) {
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
