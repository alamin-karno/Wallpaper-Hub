import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/features/home/presentation/ui/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  final _selectedTab = ValueNotifier<int>(0);
  late final _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _selectedTab.dispose();
    super.dispose();
  }

  void _onChangeTap(int index) {
    if (index != _selectedTab.value) {
      _selectedTab.value = index;

      if ((index - _tabController.index).abs() > 1) {
        _tabController.index = index;
      } else {
        _tabController.animateTo(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomePage(),
          Container(
            color: Colors.red.shade400,
          ),
          Container(
            color: Colors.blue.shade400,
          ),
          Container(
            color: Colors.yellow.shade400,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.antiAlias,
        child: ValueListenableBuilder(
          valueListenable: _selectedTab,
          builder: (context, _selected, child) {
            return NavigationBar(
              maintainBottomViewPadding: true,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: _selected,
              onDestinationSelected: _onChangeTap,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_max_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(CupertinoIcons.square_grid_2x2),
                  label: 'Category',
                ),
                NavigationDestination(
                  icon: Icon(CupertinoIcons.heart_fill),
                  label: 'Favorite',
                ),
                NavigationDestination(
                  icon: Icon(CupertinoIcons.settings_solid),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
