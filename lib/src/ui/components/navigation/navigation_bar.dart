import 'package:flutter/material.dart';

class NavigationBarItem {
  final IconData icon;

  NavigationBarItem({required this.icon});
}

class NavigationBar extends StatelessWidget {
  final double height;
  final double width;
  final double? iconSize;
  final List<NavigationBarItem> items;
  final ValueChanged<int> onChanged;
  static const Radius taperRadius = Radius.circular(40);
  static ValueNotifier<int> moveIndicator = ValueNotifier<int>(0);

  const NavigationBar({
    Key? key,
    required this.items,
    required this.onChanged,
    this.height = 120,
    this.width = double.infinity,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentIndex = moveIndicator.value;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: taperRadius,
          topRight: taperRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (i) => GestureDetector(
            onTap: () => _onPressed(i),
            child: Container(
              width: 120,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    items[i].icon,
                    size: iconSize,
                    color:
                        i == currentIndex ? colors.primary : colors.onSurface,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed(int i) {
    onChanged(i);
    moveIndicator.value = i;
  }
}
