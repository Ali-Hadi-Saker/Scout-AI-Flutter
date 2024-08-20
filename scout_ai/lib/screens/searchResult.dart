import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search Result",)),
      ),
      body: Column(
        children: [
          Text("Results"),
          Container(
            height: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Text("Map View"),
          Container(
            height:MediaQuery.of(context).size.width,
            color: Colors.grey,
          )
      ],),
    );
  }
}