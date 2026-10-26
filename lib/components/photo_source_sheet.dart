import 'package:flutter/material.dart';

import 'package:moviles_auth/features/avatar/domain/entities/photo_source.dart';

/// Bottom sheet that closes with the PhotoSource the user chose.
class PhotoSourceSheet extends StatelessWidget {
  const PhotoSourceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Elegir de la galería'),
            onTap: () => Navigator.pop(context, PhotoSource.gallery),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera_outlined),
            title: const Text('Tomar una foto'),
            onTap: () => Navigator.pop(context, PhotoSource.camera),
          ),
        ],
      ),
    );
  }
}
