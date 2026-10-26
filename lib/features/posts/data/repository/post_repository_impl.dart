import 'package:moviles_auth/features/posts/data/source/supabase_post_data_source.dart';
import 'package:moviles_auth/features/posts/domain/entities/post.dart';
import 'package:moviles_auth/features/posts/domain/repository/post_repository.dart';

/// Fulfils PostRepository by delegating on the Supabase data source.
class PostRepositoryImpl implements PostRepository {
  final SupabasePostDataSource _dataSource = SupabasePostDataSource();

  @override
  Future<List<Post>> fetchFeed({required int page, required int size}) {
    return _dataSource.fetchFeed(page: page, size: size);
  }

  @override
  Future<List<Post>> fetchMine({int limit = 3}) {
    return _dataSource.fetchMine(limit: limit);
  }

  @override
  Future<void> create(String content) {
    return _dataSource.create(content);
  }

  @override
  Future<void> like(String postId) {
    return _dataSource.like(postId);
  }

  @override
  Future<void> unlike(String postId) {
    return _dataSource.unlike(postId);
  }
}
