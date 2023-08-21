import 'package:flutter/material.dart';
import 'package:theme_customization/widgets/faded_bar_menu.dart';
import 'package:theme_customization/widgets/staggered_dual_list_view.dart';

class CoffeCup {
  CoffeCup({
    required this.asset,
    required this.name,
  });

  final String asset;
  final String name;
}

final coffeCupList = <CoffeCup>[
  CoffeCup(
    asset: 'assets/coffe1.jpg',
    name: 'Single cup',
  ),
  CoffeCup(
    asset: 'assets/coffe2.jpg',
    name: 'Retro cup',
  ),
  CoffeCup(
    asset: 'assets/coffe3.jpg',
    name: 'Beautiful cup',
  ),
];

class StaggaredDualListPage extends StatelessWidget {
  const StaggaredDualListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinterest menu with staggared layout'),
      ),
      body: const _MainView(),
    );
  }
}

class _MainView extends StatefulWidget {
  const _MainView();

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  double _oldOffset = 0;
  bool _visible = true;
  final _controller = ScrollController();

  var _selectedItem = 0;

  bool get _currentOffsetIsBigger => _oldOffset < _controller.offset;
  bool get _currentOffsetIsSmaller => _oldOffset > _controller.offset;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateMenuVisibility);
  }

  void _updateMenuVisibility() {
    if (_controller.offset == 0) {
      _toggleVisibility(true);
      return;
    }
    if (_currentOffsetIsSmaller) {
      _oldOffset = _controller.offset;
      if (_visible) return;
      _toggleVisibility(true);
    } else if (_currentOffsetIsBigger) {
      _oldOffset = _controller.offset;
      if (!_visible) return;
      _toggleVisibility(false);
    }
  }

  void _toggleVisibility(bool isVisible) {
    setState(() {
      _visible = isVisible;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: StaggaredDualView(
            controller: _controller,
            childAspectRatio: .7,
            itemCount: 12,
            spacing: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            itemBuilder: _buildItem,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: LayoutBuilder(builder: (context, constraint) {
              return SizedBox(
                width: constraint.maxWidth * .5,
                child: FadedBarMenu(
                  selectedItem: _selectedItem,
                  onChange: _updateSelectedIcon,
                  isVisible: _visible,
                  items: [
                    FadedMenuItem(
                      icon: const Icon(
                        Icons.person,
                      ),
                      activeIcon: Icon(
                        Icons.person,
                        color: colors.secondary,
                      ),
                    ),
                    FadedMenuItem(
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      activeIcon: Icon(
                        Icons.favorite,
                        color: colors.secondary,
                      ),
                    ),
                    FadedMenuItem(
                      icon: const Icon(
                        Icons.settings,
                      ),
                      activeIcon: Icon(
                        Icons.settings,
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = coffeCupList[index % coffeCupList.length];

    return CoffeCard(item: item);
  }

  void _updateSelectedIcon(int value) {
    if (_selectedItem == value) return;
    setState(() {
      _selectedItem = value;
    });
  }
}

class CoffeCard extends StatelessWidget {
  const CoffeCard({
    super.key,
    required CoffeCup item,
  }) : _item = item;

  final CoffeCup _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: Image.asset(
                _item.asset,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                _item.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
