import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:csv/csv.dart';

class UploadCsvScreen extends StatefulWidget {
  const UploadCsvScreen({super.key});

  @override
  State<UploadCsvScreen> createState() => _UploadCsvScreenState();
}

class _UploadCsvScreenState extends State<UploadCsvScreen> {
  String? _csvContent;
  bool _isLoading = false;

  Future<void> _pickCsvFile() async {
    try {
      setState(() => _isLoading = true);
      
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
      
      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final content = await file.readAsString();
        final rows = const CsvToListConverter().convert(content);
        
        setState(() {
          _csvContent = rows.map((row) => row.join(', ')).join('\n');
        });
        
        // TODO: Implement API call to upload CSV data
        // await _uploadCsvData(rows);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error processing CSV: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload CSV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _pickCsvFile,
              child: _isLoading 
                ? const CircularProgressIndicator()
                : const Text('Select CSV File'),
            ),
            const SizedBox(height: 20),
            if (_csvContent != null) ...[
              const Text(
                'Preview:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(_csvContent!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
