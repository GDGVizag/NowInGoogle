import 'package:nowingoogle/domain/enums/collection_enum.dart';

class CollectionUtils {
  static String getCollectionPath(Collection collectionType) {
    switch (collectionType) {
      case Collection.users:
        return "users";
      case Collection.posts:
        return "posts";
      case Collection.blogs:
        return "blogs";
    }
  }
}
