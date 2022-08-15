import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              validator: (vlaue) {
                if (vlaue!.isEmpty) {
                  return 'phone number must not be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                  20.0,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
