import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _creatSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _creatSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glutén!',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _creatSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _creatSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _creatSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  settings.isVegeterian,
                  (value) => setState(() => settings.isVegeterian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
