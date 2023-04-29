import 'package:counter_hive/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador con persistencia'),
      ),
      body: Consumer<CounterProvider>(builder: (context, provider, _) {
        return ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              '${provider.getCounter}',
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            SwitchListTile(
                title: Text('Switch.. on? off?'),
                value: provider.getSwitched,
                onChanged: (newVal) {
                  provider.setSwitch(newVal);
                }),
            SizedBox(
              height: 250,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Guardar'),
              onPressed: () {
                provider.saveCounter();
              },
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.upload),
              label: Text('Cargar'),
              onPressed: () {
                provider.loadCounter();
              },
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().incrementCounter();
        },
      ),
    );
  }
}
