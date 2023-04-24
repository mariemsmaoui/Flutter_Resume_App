import 'package:flutter/material.dart';

class About extends StatelessWidget {

  final List<String> items = ['Education', 'Academic experience', 'Professiona experience', 'Associative Life'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'This is the about page',
          style: TextStyle(fontSize: 50),
        ),
      ),
      bottomSheet: Container(
        height: 600,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'This is a subtitle for item $index',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                leading: Icon(
                  Icons.circle,
                  color: Colors.blue,
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // handle onTap event for the item
                },
              ),
            );
          },
        ),
      )
      ,
    );
  }
}
