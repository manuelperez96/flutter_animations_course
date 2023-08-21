import 'package:flutter/material.dart';

class FadedBarMenu extends StatelessWidget {
  const FadedBarMenu({
    super.key,
    required List<FadedMenuItem> items,
    required bool isVisible,
    required int selectedItem,
    required ValueChanged<int> onChange,
  })  : _onChange = onChange,
        _selectedItem = selectedItem,
        _items = items,
        _isVisible = isVisible;

  final List<FadedMenuItem> _items;
  final bool _isVisible;
  final int _selectedItem;
  final ValueChanged<int> _onChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: _isVisible ? 1 : 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_items.length, _buildItem),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final item = _items[index];

    return GestureDetector(
      onTap: () => _onChange(index),
      child: index == _selectedItem ? item.activeIcon : item.icon,
    );
  }
}

class FadedMenuItem {
  final Widget icon;
  final Widget activeIcon;

  FadedMenuItem({required this.icon, required this.activeIcon});
}
