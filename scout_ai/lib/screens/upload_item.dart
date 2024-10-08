import 'package:flutter/material.dart';
import 'package:scout_ai/screens/car_control.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/small_button.dart';

class UploadItemScreen extends StatefulWidget {
  const UploadItemScreen({super.key});

  @override
  State<UploadItemScreen> createState() => _UploadItemScreenState();
}

class _UploadItemScreenState extends State<UploadItemScreen> {
  final TextEditingController _objectNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Upload Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.grey, width: 3)),
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 28,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Input field for object name
            TextField(
              controller: _objectNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Enter object name',
                hintText: 'e.g., Bottle, Car, Person',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SmallButton(
                // gradient: AppColors.primaryButtonGradient,
                btnColor: AppColors.primaryButton,
                isFullWidth: true,
                onPressed: () {
                  final objectName =
                      _objectNameController.text.trim().toLowerCase();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarControlScreen(
                        objectName: objectName,
                      ),
                    ),
                  );
                },
                text: "Start search")
          ],
        ),
      ),
    );
  }
}
