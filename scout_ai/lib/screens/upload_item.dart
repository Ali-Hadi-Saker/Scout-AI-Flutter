import 'package:flutter/material.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey, width: 3)
              ),
              child: Center(
                child: Icon(Icons.add_a_photo, size: 28,),
                
              ),
              
            ),
            SizedBox(height: 15,),
            CustomizedButton(
              color: AppColors.primaryButtonColor,
              text: "Start Search", 
              onPressed: ()=>{})
          ],
        ),
      ),
    );
  }
}