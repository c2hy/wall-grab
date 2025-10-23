import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ImageService {
  
  /// 获取Windows主题缓存目录路径
  static String getThemeCachePath() {
    final userProfile = Platform.environment['USERPROFILE'];
    if (userProfile == null) {
      throw Exception('无法获取用户配置文件路径');
    }
    return '$userProfile\\AppData\\Roaming\\Microsoft\\Windows\\Themes\\CachedFiles';
  }
  
  /// 读取主题缓存目录中的所有图片文件
  static Future<List<File>> getThemeImages() async {
    try {
      final cacheDir = Directory(getThemeCachePath());
      
      if (!await cacheDir.exists()) {
        // 主题缓存目录不存在
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
      // 读取主题图片时出错
      return [];
    }
  }
  
  /// 获取桌面目录路径
  static Future<String> getDesktopPath() async {
    try {
      final userProfile = Platform.environment['USERPROFILE'];
      if (userProfile == null) {
        throw Exception('无法获取用户配置文件路径');
      }
      return '$userProfile\\Desktop';
    } catch (e) {
      // 获取桌面路径时出错
      rethrow;
    }
  }
  
  /// 使用文件选择器保存图片
  static Future<bool> saveImageWithDialog(File sourceFile) async {
    try {
      final fileName = sourceFile.path.split('\\').last;
      
      // 打开文件保存对话框
      final result = await FilePicker.platform.saveFile(
        dialogTitle: '保存图片',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'gif'],
        initialDirectory: await getDesktopPath(),
      );
      
      if (result != null) {
        // 复制文件到选择的位置
        await sourceFile.copy(result);
        return true;
      }
      
      return false;
    } catch (e) {
      // 保存图片时出错
      return false;
    }
  }
  
  /// 检查文件是否为有效的图片文件
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
  
  /// 获取文件大小（人类可读格式）
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
