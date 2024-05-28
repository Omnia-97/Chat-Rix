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
        id: 'family',
        categoryName: 'Family',
        categoryImage: '🏠',
      ),
      RoomCategoryModel(
        id: 'friends',
        categoryName: 'Friends',
        categoryImage: '🤜🏻🤛🏻',
      ),
      RoomCategoryModel(
        id: 'love',
        categoryName: 'Love',
        categoryImage: '💖',
      ),
      RoomCategoryModel(
        id: 'work',
        categoryName: 'Work',
        categoryImage:'🏢',
      ),
      RoomCategoryModel(
        id: 'music',
        categoryName: 'Music',
        categoryImage:'🎵',
      ),
      RoomCategoryModel(
        id: 'movies',
        categoryName: 'Movies',
        categoryImage: '🎬',
      ),
      RoomCategoryModel(
        id: 'sports',
        categoryName: 'Sports',
        categoryImage: '⚽',
      ),
      RoomCategoryModel(
        id: 'gaming',
        categoryName: 'Gaming',
        categoryImage: '🎮',
      ),
      RoomCategoryModel(
        id: 'others',
        categoryName: 'Others',
        categoryImage: '🔎',
      ),

    ];
  }
}
