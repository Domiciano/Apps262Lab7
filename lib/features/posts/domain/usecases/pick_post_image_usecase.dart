import 'package:moviles_auth/features/avatar/domain/entities/photo_source.dart';
import 'package:moviles_auth/features/avatar/domain/entities/picked_photo.dart';

/// Picks the photo of a new post and checks that it is not too heavy.
class PickPostImageUseCase {
  Future<PickedPhoto?> call(PhotoSource source) async {
    throw UnimplementedError();
  }
}
