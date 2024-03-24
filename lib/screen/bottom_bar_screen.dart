import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:netflex_app/screen/favorite_screen.dart';
import 'package:netflex_app/screen/home_screen.dart';
import 'package:netflex_app/screen/persion_screen.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  List<TabItem> items = const [
    TabItem(
      icon: Icons.favorite,
      title: 'Favorite',
    ),
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.person,
      title: 'Profile',
    ),
  ];
  int visit = 1;
  final List<Widget> _pages = [
    const FavoritePage(),
    const HomePage(),
    const PersionPage()
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarInspiredInside(
        items: items,
        backgroundColor: backgrondColor,
        color: Colors.white,
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        colorSelected: Colors.pink,
        indexSelected: visit,
        elevation: 10.0,
        onTap: (index) {
          setState(() {
            visit = index;
          });
        },
        chipStyle: const ChipStyle(
          convexBridge: true,
          background: Colors.white,
        ),
        itemStyle: ItemStyle.circle,
        animated: true,
      ),
      body: _pages[visit],
    );
  }
}
