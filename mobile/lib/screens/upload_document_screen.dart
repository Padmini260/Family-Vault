import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({super.key});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  final TextEditingController documentNameController =
      TextEditingController();

  String? selectedCategory;
  File? selectedFile;
  String? selectedFileName;

  bool isLoading = false;

  Future<void> chooseFile() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          "pdf",
          "jpg",
          "jpeg",
          "png",
          "doc",
          "docx",
        ],
      );

      if (result == null) {
        return;
      }

      final path = result.files.single.path;

      if (path == null) {
        showMessage("Unable to access selected file.");
        return;
      }

      setState(() {
        selectedFile = File(path);
        selectedFileName = result.files.single.name;
      });
    } catch (error) {
      debugPrint("File picker error: $error");
      showMessage("Unable to select file.");
    }
  }

  void uploadDocument() {
    final documentName = documentNameController.text.trim();

    if (documentName.isEmpty) {
      showMessage("Please enter a document name.");
      return;
    }

    if (selectedCategory == null) {
      showMessage("Please select a document category.");
      return;
    }

    if (selectedFile == null) {
      showMessage("Please choose a file.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Temporary test only.
    // Real backend upload will be connected next.
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "File selected successfully. Backend upload will be connected next.",
          ),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    documentNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Document"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.cloud_upload,
              size: 90,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              "Upload Your Document",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Select a document from your device.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Document Name
            TextField(
              controller: documentNameController,
              decoration: InputDecoration(
                labelText: "Document Name",
                hintText: "Example: Aadhaar Card",
                prefixIcon: const Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Category
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: "Document Category",
                prefixIcon: const Icon(Icons.category),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Identity",
                  child: Text("Identity"),
                ),
                DropdownMenuItem(
                  value: "Education",
                  child: Text("Education"),
                ),
                DropdownMenuItem(
                  value: "Finance",
                  child: Text("Finance"),
                ),
                DropdownMenuItem(
                  value: "Medical",
                  child: Text("Medical"),
                ),
                DropdownMenuItem(
                  value: "Other",
                  child: Text("Other"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Choose File
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: isLoading ? null : chooseFile,
                icon: const Icon(Icons.attach_file),
                label: Text(
                  selectedFileName == null
                      ? "Choose File"
                      : "Change File",
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Selected File
            if (selectedFileName != null)
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.insert_drive_file,
                    color: Colors.blue,
                  ),
                  title: Text(
                    selectedFileName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text("File selected"),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            setState(() {
                              selectedFile = null;
                              selectedFileName = null;
                            });
                          },
                  ),
                ),
              ),

            const SizedBox(height: 30),

            // Upload Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : uploadDocument,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(Icons.upload),
                label: Text(
                  isLoading ? "Processing..." : "Upload Document",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}