import 'package:moviles_auth/features/posts/data/repository/post_repository_impl.dart';
import 'package:moviles_auth/features/posts/domain/repository/post_repository.dart';

/// Validates a text and publishes it as a new post.
class PublishPostUseCase {
  static const maxLength = 280;
  final PostRepository _posts = PostRepositoryImpl();

  Future<void> call(String content) async {
    final text = content.trim();
    if (text.isEmpty) throw Exception('Escribe algo antes de publicar');
    if (text.length > maxLength) {
      throw Exception('Máximo $maxLength caracteres');
    }
    await _posts.create(text);
  }
}
