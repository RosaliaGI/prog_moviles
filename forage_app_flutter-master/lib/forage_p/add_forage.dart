import 'package:flutter/material.dart';

class AddForage extends StatelessWidget {
  AddForage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new forage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 24),
            TextField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
            SizedBox(height: 24),
            TextField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Location"),
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (newVal) {
                  //
                },
              ),
              title: Text("Currently in season"),
            ),
            SizedBox(height: 24),
            TextField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Notes"),
              ),
            ),
            Row(
              children: [
                MaterialButton(
                  child: Text("SAVE"),
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Text("DELETE"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
