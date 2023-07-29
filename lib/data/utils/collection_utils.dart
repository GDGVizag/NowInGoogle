import 'package:nowingoogle/domain/enums/collection_enum.dart';

class CollectionUtils {
  static String getCollectionPath(Collection collectionType) {
    switch (collectionType) {
      case Collection.Users:
        return "users";
      case Collection.Posts:
        return "posts";
      case Collection.Blogs:
        return "blogs";
    }
  }
}
