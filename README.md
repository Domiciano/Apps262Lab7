# Laboratorio 7 · Foto de perfil

Punto de partida del **Laboratorio 7**: el muro del Laboratorio 6, ya resuelto, al que le falta la foto de perfil. La guía completa está en el visor del curso, en la lección *Laboratorio 7 · Foto de perfil*.

## Cómo correrlo

1. Pon la `Project URL` y la `publishable key` de **tu** proyecto de Supabase en `lib/main.dart`.
2. Copia aquí la carpeta `supabase/` de tu proyecto del Laboratorio 6, que trae tu `link` y las migraciones de `profiles`, `posts` y `likes`. Agrega la migración de avatares que dice el laboratorio y súbela con `npx supabase db push`.
3. Corre la app:

```bash
flutter pub get
flutter run
```

## Qué ya funciona

- **Todo el Laboratorio 6.** Registro, inicio de sesión, el muro paginado, los «me gusta» y publicar.
- **Las dependencias y los permisos.** `image_picker` y `uuid` ya están en el `pubspec.yaml`. Los textos de permiso de cámara y fotos ya están en `ios/Runner/Info.plist`, y el permiso de archivos en los `entitlements` de macOS.
- **Toda la interfaz de la foto.** `ProfilePage` muestra el componente `Avatar` con un botón de cámara. `HomeScreen` abre una hoja con *Elegir de la galería* y *Tomar una foto*, y lanza `AvatarChangeRequested`. `PostCard` ya dibuja la foto del autor de cada post.
- **Las entidades.** `PhotoSource`, `PickedPhoto`, `Profile` con `avatarPath` y `avatarUrl`, y `Post` con `authorAvatarUrl`.
- **El estado.** `FeedState` trae `avatarStatus` (`idle`, `uploading`, `failure`) con su `copyWith`.

Mientras no exista una foto, `Avatar` muestra la inicial del nombre. Toca la cámara del perfil y elige una opción: el evento aparece en la consola, pero la foto no cambia.

```text
FeedBloc recibió AvatarChangeRequested(gallery)
```

## Qué te toca

- `avatar/domain/repository/avatar_repository.dart`: el contrato para elegir, subir y borrar una foto.
- `auth/domain/repository/profile_repository.dart`: una operación más para guardar el `path` de la foto en el perfil.
- `avatar/domain/usecases/change_avatar_usecase.dart`: elegir, subir con un nombre nuevo, apuntar el perfil y borrar la foto anterior, en ese orden.
- `avatar/data/source/device_photo_data_source.dart`: el único archivo que abre la galería o la cámara.
- `avatar/data/source/supabase_avatar_data_source.dart`: el único archivo que usa `_client.storage`. El nombre de cada foto es aleatorio.
- `avatar/data/repository/avatar_repository_impl.dart`: cumple el contrato delegando en los dos data sources.
- `auth/data/source/supabase_profile_data_source.dart` y `posts/data/source/supabase_post_data_source.dart`: leer `avatar_path` y convertirlo en URL.
- `home/ui/bloc/feed_bloc.dart`: el `on` de `AvatarChangeRequested`, que hoy solo imprime.

`flutter test` comprueba que la interfaz lanza los eventos correctos.
