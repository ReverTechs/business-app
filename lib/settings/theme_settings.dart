import 'package:business_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: ListView(
        children: [
          _buildThemeOption(
            context,
            title: 'System Default',
            subtitle: 'Use device settings',
            value: AppThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: (value) {
              themeProvider.setThemeMode(value!);
            },
          ),
          const Divider(height: 1),
          _buildThemeOption(
            context,
            title: 'Light Mode',
            subtitle: 'Always use light theme',
            value: AppThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: (value) {
              themeProvider.setThemeMode(value!);
            },
          ),
          const Divider(height: 1),
          _buildThemeOption(
            context,
            title: 'Dark Mode',
            subtitle: 'Always use dark theme',
            value: AppThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: (value) {
              themeProvider.setThemeMode(value!);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required AppThemeMode value,
    required AppThemeMode groupValue,
    required ValueChanged<AppThemeMode?> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
        ),
      ),
      trailing: Radio<AppThemeMode>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      onTap: () {
        onChanged(value);
      },
    );
  }
}
