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
      home: const BaseLayout(),
    );
  }
}

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Sidebar(),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Consumer<SidebarProvider>(
                builder: (context, sidebar, child) {
                  return pages[sidebar.selectedIndex].destination;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
