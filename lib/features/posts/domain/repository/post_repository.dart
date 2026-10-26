import 'package:moviles_auth/features/posts/domain/entities/post.dart';

/// Contract of everything the wall can ask about posts and likes.
abstract class PostRepository {
  Future<List<Post>> fetchFeed({required int page, required int size});
  Future<List<Post>> fetchMine({int limit = 3});
  Future<void> create(String content);
  Future<void> like(String postId);
  Future<void> unlike(String postId);
}
