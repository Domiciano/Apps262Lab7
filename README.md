# Laboratorio 7 · Fotos en el muro

Punto de partida del **Laboratorio 7**: el muro del Laboratorio 6, ya resuelto, al que le faltan las fotos. La guía paso a paso está en el visor del curso, en la lección *Laboratorio 7 · Fotos en el muro*.

- **Parte 1 · Foto de perfil.** Subir la foto, guardar su path en `profiles` y mostrarla en el perfil y junto a cada post.
- **Parte 2 · Posts con imagen (avanzada).** El composer adjunta una foto, la muestra antes de publicar y el muro la pinta bajo el texto.

Las fotos de perfil van en un **bucket público**, `avatars`: se muestran con una URL fija. Las de los posts van en un **bucket privado**, `post-images`: solo quien inició sesión las ve, a través de URLs firmadas.

## Cómo correrlo

1. Pon la `Project URL` y la `publishable key` de **tu** proyecto de Supabase en `lib/main.dart`.
2. Copia aquí la carpeta `supabase/` de tu Laboratorio 6. Declara los buckets en `supabase/config.toml` y agrega las migraciones que dice el laboratorio.
3. Corre la app:

```bash
flutter pub get
flutter run
```

## Qué ya funciona

- **Todo el Laboratorio 6.** Registro, inicio de sesión, el muro paginado, los «me gusta» y publicar texto.
- **Las dependencias y los permisos.** `image_picker` y `uuid` en el `pubspec.yaml`, los textos de permiso en `ios/Runner/Info.plist` y el permiso de archivos en los `entitlements` de macOS.
- **Toda la interfaz.** `Avatar`, `PhotoSourceSheet` (galería o cámara), el botón de cámara de `ProfilePage`, la vista previa y el botón *Quitar foto* de `ComposeScreen`, y la imagen de `PostCard`.
- **Las entidades y los contratos.** `PhotoSource`, `PickedPhoto`, `Profile` con `avatarPath` y `avatarUrl`, `Post` con `authorAvatarUrl` e `imageUrl`, y los contratos `AvatarRepository`, `ProfileRepository` y `PostRepository` completos.
- **Los eventos y los estados.** `AvatarChangeRequested`, `ComposePhotoRequested`, `ComposePhotoRemoved`, `FeedState.avatarStatus` y `ComposeState.photo`, con sus `copyWith`.

Los métodos nuevos de cada capa ya existen con su firma, pero su cuerpo es `throw UnimplementedError()`. Los `on` nuevos de los Bloc solo imprimen el evento que reciben:

```text
FeedBloc recibió AvatarChangeRequested(gallery)
ComposeBloc recibió ComposePhotoRequested(camera)
```

## Qué te toca

**Parte 1**

- `avatar/domain/usecases/change_avatar_usecase.dart`: `call`.
- `avatar/data/source/device_photo_data_source.dart`: `pick`.
- `avatar/data/source/supabase_avatar_data_source.dart`: `upload` con nombre aleatorio y `remove`.
- `avatar/data/repository/avatar_repository_impl.dart`: los tres métodos, delegando.
- `auth/data/source/supabase_profile_data_source.dart` y su `Impl`: `updateAvatarPath`, y la URL pública en `getProfile`.
- `posts/data/source/supabase_post_data_source.dart`: `avatar_path` en el select y su URL pública en `_toPost`.
- `home/ui/bloc/feed_bloc.dart`: el `on` de `AvatarChangeRequested`.

**Parte 2**

- `posts/domain/usecases/pick_post_image_usecase.dart`: `call`.
- `posts/domain/usecases/publish_post_usecase.dart`: subir la foto antes de crear el post.
- `posts/data/source/supabase_post_image_data_source.dart`: `upload`.
- `posts/data/repository/post_repository_impl.dart`: `pickImage` y `uploadImage`.
- `posts/data/source/supabase_post_data_source.dart`: `image_path` en `create` y en el select, y las URLs firmadas en `_toPosts`.
- `compose/ui/bloc/compose_bloc.dart`: los `on` de la foto, y pasar `state.photo` al publicar.

`flutter test` comprueba que la interfaz lanza los eventos correctos.
