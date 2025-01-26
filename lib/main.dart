import 'package:finances/components/navbar.dart';
import 'package:finances/components/sidebar.dart';
import 'package:finances/providers/navbar_provider.dart';
import 'package:finances/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavbarProvider()),
          ChangeNotifierProvider(create: (context) => SidebarProvider()),
        ],
        child: const NavigationRailExampleApp(),
      ),
    );

class NavigationRailExampleApp extends StatelessWidget {
  const NavigationRailExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Finances',
      home: const NavRailExample(),
    );
  }
}

class NavRailExample extends StatefulWidget {
  const NavRailExample({super.key});

  @override
  State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Sidebar(),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<SidebarProvider>(
                    builder: (context, sidebar, child) {
                      return Text('selectedIndex: ${sidebar.selectedIndex}');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
