import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ImageService {
  
  /// Get Windows theme cache directory path
  static String getThemeCachePath() {
    final userProfile = Platform.environment['USERPROFILE'];
    if (userProfile == null) {
      throw Exception('Unable to get user profile path');
    }
    return '$userProfile\\AppData\\Roaming\\Microsoft\\Windows\\Themes\\CachedFiles';
  }
  
  /// Read all image files from theme cache directory
  static Future<List<File>> getThemeImages() async {
    try {
      final cacheDir = Directory(getThemeCachePath());
      
      if (!await cacheDir.exists()) {
        // Theme cache directory does not exist
        return [];
      }
      
      final files = await cacheDir.list().toList();
      final imageFiles = <File>[];
      
      for (final file in files) {
        if (file is File) {
          final extension = file.path.toLowerCase();
          if (extension.endsWith('.jpg') || 
              extension.endsWith('.jpeg') || 
              extension.endsWith('.png') || 
              extension.endsWith('.bmp') || 
              extension.endsWith('.gif')) {
            imageFiles.add(file);
          }
        }
      }
      
      return imageFiles;
    } catch (e) {
      // Error reading theme images
      return [];
    }
  }
  
  /// Get desktop directory path
  static Future<String> getDesktopPath() async {
    try {
      final userProfile = Platform.environment['USERPROFILE'];
      if (userProfile == null) {
        throw Exception('Unable to get user profile path');
      }
      return '$userProfile\\Desktop';
    } catch (e) {
      // Error getting desktop path
      rethrow;
    }
  }
  
  /// Save image using file picker
  static Future<bool> saveImageWithDialog(File sourceFile) async {
    try {
      final fileName = sourceFile.path.split('\\').last;
      
      // Open file save dialog
      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Image',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'gif'],
        initialDirectory: await getDesktopPath(),
      );
      
      if (result != null) {
        // Copy file to selected location
        await sourceFile.copy(result);
        return true;
      }
      
      return false;
    } catch (e) {
      // Error saving image
      return false;
    }
  }
  
  /// Check if file is a valid image file
  static bool isValidImageFile(File file) {
    try {
      final extension = file.path.toLowerCase();
      return extension.endsWith('.jpg') || 
             extension.endsWith('.jpeg') || 
             extension.endsWith('.png') || 
             extension.endsWith('.bmp') || 
             extension.endsWith('.gif');
    } catch (e) {
      return false;
    }
  }
  
  /// Get file size (human readable format)
  static String getFileSizeString(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}
