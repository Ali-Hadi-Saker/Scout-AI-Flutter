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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Results",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                height: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 15,)
,              Text("Map View",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600

              ),),
              SizedBox(height: 15,),
              Container(
                height:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              )
          ],),
        ),
      ),
    );
  }
}