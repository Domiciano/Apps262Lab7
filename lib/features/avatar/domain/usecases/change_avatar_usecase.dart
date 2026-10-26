import 'package:moviles_auth/features/auth/domain/entities/profile.dart';
import 'package:moviles_auth/features/avatar/domain/entities/photo_source.dart';

/// Uploads a new profile photo, points the profile to it and deletes the old one.
class ChangeAvatarUseCase {
  Future<Profile?> call(PhotoSource source) async {
    throw UnimplementedError();
  }
}
