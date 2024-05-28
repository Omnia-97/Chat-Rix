import 'package:chat_app/shared/utils/images_path.dart';

class RoomCategoryModel {
  String id;
  String categoryName;
  String categoryImage;

  RoomCategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });
  static List<RoomCategoryModel> getCategories(){
    return [
      RoomCategoryModel(
        id: '1',
        categoryName: 'Family',
        categoryImage: '🏠',
      ),
      RoomCategoryModel(
        id: '2',
        categoryName: 'Friends',
        categoryImage: '🤜🏻🤛🏻',
      ),
      RoomCategoryModel(
        id: '3',
        categoryName: 'Love',
        categoryImage: '💖',
      ),
      RoomCategoryModel(
        id: '4',
        categoryName: 'Work',
        categoryImage:'🏢',
      ),
      RoomCategoryModel(
        id: '5',
        categoryName: 'Music',
        categoryImage:'🎵',
      ),
      RoomCategoryModel(
        id: '6',
        categoryName: 'Movies',
        categoryImage: '🎬',
      ),
      RoomCategoryModel(
        id: '7',
        categoryName: 'Sports',
        categoryImage: '⚽',
      ),
      RoomCategoryModel(
        id: '8',
        categoryName: 'Gaming',
        categoryImage: '🎮',
      ),
      RoomCategoryModel(
        id: '9',
        categoryName: 'Others',
        categoryImage: '🔎',
      ),

    ];
  }
}
