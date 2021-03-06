import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/src/locator.dart';
import 'package:notesapp/src/services/database_service.dart';
import 'package:notesapp/src/services/prefs_service.dart';
import 'package:notesapp/src/viewModel/theme_view_model.dart';
import 'package:notesapp/src/widgets/scrollable_centerd_sized_box.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
      ),
      body: SafeArea(
        child: ScrollableCenteredSizedBox(
          child: SettingsPageLayout(),
        ),
      ),
    );
  }
}

class SettingsPageLayout extends StatefulWidget {
  @override
  _SettingsPageLayoutState createState() => _SettingsPageLayoutState();
}

class _SettingsPageLayoutState extends State<SettingsPageLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: locator<PrefsService>().userPreferences.darkModeEnabled,
          onChanged: (bool value) {
            setState(
              () {
                Provider.of<ThemeViewModel>(context, listen: false).darkMode = value;
                locator<DatabaseService>()
                    .addOrUpdateUser(locator<PrefsService>().userData)
                    .catchError((_) => {});
              },
            );
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
      ],
    );
  }
}
