import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/peferences_provider.dart';
import 'package:restaurant_app/provider/schedulling_provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = 'settings-page';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const SettingsPageBody(),
    );
  }
}

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  bool condition = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return ListTile(
          title: const Text('Notification'),
          subtitle: const Text('Daily restaurant suggestion'),
          trailing: Consumer<SchedulingProvider>(
            builder: (context, scheduled, _) {
              return Switch(
                value: provider.isDailyNotificationActive,
                onChanged: (value) async {
                  scheduled.scheduledNews(value);
                  provider.enableDailyNotification(value);
                },
              );
            },
          ),
        );
      },
    );
  }
}
