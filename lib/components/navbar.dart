import 'package:finances/providers/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Consumer<NavbarProvider>(
        builder: (context, navbar, child) {
          return IconButton(
            onPressed: () {
              navbar.switchNavbar();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
      title: const Text('Finances'),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_left_outlined),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {},
              child: const Text('January'),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right_outlined),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Consumer<NavbarProvider>(builder: (context, navbar, child) {
          // @TODO Make this work
          return FloatingActionButton.small(
            onPressed: navbar.addFunction,
            shape: CircleBorder(),
            elevation: 0.0,
            focusElevation: 0.0,
            highlightElevation: 0.0,
            hoverElevation: 0.0,
            tooltip: 'Show menu',
            child: const Icon(Icons.add_outlined),
          );
        }),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_outlined),
          tooltip: 'Show menu',
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/v2/C5603AQF4uS1FWXDLTA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1640623532101?e=1743638400&v=beta&t=0T94A3HhO71xsESl57SU880X4yTTia_p9zEAfz7ao60'),
          ),
          tooltip: 'Esther Peixoto\nestherpeixoto13@gmail.com',
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
      elevation: 1,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.black12,
          height: 1.0,
        ),
      ),
    );
  }
}
