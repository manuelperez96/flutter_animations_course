import 'package:flutter/material.dart';

class BigListItem extends StatelessWidget {
  const BigListItem({
    super.key,
    required this.backgroundColor,
    required this.backgroundIcon,
    required this.mainIcon,
    required this.title,
  });

  final MaterialColor backgroundColor;
  final Widget backgroundIcon;
  final Widget mainIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        backgroundColor.shade700,
                        backgroundColor.shade400,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: <Widget>[
                        mainIcon,
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_sharp,
                          size: 32,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -30,
                top: -20,
                child: Opacity(opacity: .2, child: backgroundIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
