import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_customization/routes/routes.dart';
import 'package:theme_customization/states/theme_state.dart';

void _navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Themes'),
      ),
      drawer: const _Drawer(),
      body: const _SectionsListView(),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeState>();
    final themeStateUnmutable = context.read<ThemeState>();

    final theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundColor: theme.colorScheme.secondary,
              child: Text(
                'MPS',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(
              child: _SectionsListView(),
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              value: themeState.isDarkTheme,
              onChanged: (value) {
                themeStateUnmutable.isDarkTheme = value;
              },
            ),
            SwitchListTile(
              title: const Text('Custom mode'),
              value: themeState.isCustomTheme,
              onChanged: (value) {
                themeStateUnmutable.isCustomTheme = value;
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SectionsListView extends StatelessWidget {
  const _SectionsListView();

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).colorScheme.primary;
    final divider = Divider(color: dividerColor);

    return ListView.separated(
      itemCount: routes.length,
      separatorBuilder: (context, index) => divider,
      itemBuilder: _buildItem,
    );
  }

  Widget? _buildItem(BuildContext context, int index) {
    return _ListItem(
      icon: routes[index].icon,
      title: routes[index].name,
      onTap: () => _navigateTo(context, routes[index].page),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.chevron_right_rounded,
      ),
    );
  }
}
