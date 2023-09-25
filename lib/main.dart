import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String urlMenu = "https://tes-mobile.landa.id/api/menus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: badges.Badge(
          badgeContent: Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.shopping_bag),
        ),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "data:image/jpeg;base64,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"))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Text(
                      "Chicken Katsu",
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 37, 37),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                    child: Text(
                      textAlign: TextAlign.left,
                      "Rp.11000",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 154, 173, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ini deskripsi",
                        style: TextStyle(fontSize: 11),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_circle,
                                color: Color.fromRGBO(0, 154, 173, 1),
                              )),
                          Text(
                            "0",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: Color.fromRGBO(0, 154, 173, 1),
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
