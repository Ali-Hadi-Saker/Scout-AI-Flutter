import 'package:flutter/material.dart';

class UploadItemScreen extends StatefulWidget {
  const UploadItemScreen({super.key});

  @override
  State<UploadItemScreen> createState() => _UploadItemScreenState();
}

class _UploadItemScreenState extends State<UploadItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>{Navigator.pop(context)}, 
          icon: Icon(
            Icons.arrow_back)),
            title: Center(child: Text("Upload Page")),
      ),
    );
  }
}