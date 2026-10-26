import 'package:moviles_auth/features/avatar/domain/entities/photo_source.dart';
import 'package:moviles_auth/features/avatar/domain/entities/picked_photo.dart';

/// The only file that opens the gallery or the camera of the phone.
class DevicePhotoDataSource {
  Future<PickedPhoto?> pick(PhotoSource source) async {
    throw UnimplementedError();
  }
}
