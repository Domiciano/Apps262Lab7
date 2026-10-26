import 'package:get_it/get_it.dart';
import 'package:moviles_auth/features/auth/data/repository/auth_repository_impl.dart';
import 'package:moviles_auth/features/auth/data/repository/profile_repository_impl.dart';
import 'package:moviles_auth/features/auth/data/source/supabase_auth_data_source.dart';
import 'package:moviles_auth/features/auth/data/source/supabase_profile_data_source.dart';
import 'package:moviles_auth/features/auth/domain/repository/auth_repository.dart';
import 'package:moviles_auth/features/auth/domain/repository/profile_repository.dart';
import 'package:moviles_auth/features/auth/domain/usecases/get_my_profile_usecase.dart';
import 'package:moviles_auth/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:moviles_auth/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:moviles_auth/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:moviles_auth/features/avatar/data/repository/avatar_repository_impl.dart';
import 'package:moviles_auth/features/avatar/data/source/device_photo_data_source.dart';
import 'package:moviles_auth/features/avatar/data/source/supabase_avatar_data_source.dart';
import 'package:moviles_auth/features/avatar/domain/repository/avatar_repository.dart';
import 'package:moviles_auth/features/avatar/domain/usecases/change_avatar_usecase.dart';
import 'package:moviles_auth/features/compose/ui/bloc/compose_bloc.dart';
import 'package:moviles_auth/features/home/ui/bloc/feed_bloc.dart';
import 'package:moviles_auth/features/login/ui/bloc/login_bloc.dart';
import 'package:moviles_auth/features/posts/data/repository/post_repository_impl.dart';
import 'package:moviles_auth/features/posts/data/source/supabase_post_data_source.dart';
import 'package:moviles_auth/features/posts/data/source/supabase_post_image_data_source.dart';
import 'package:moviles_auth/features/posts/domain/repository/post_repository.dart';
import 'package:moviles_auth/features/posts/domain/usecases/get_feed_usecase.dart';
import 'package:moviles_auth/features/posts/domain/usecases/get_my_posts_usecase.dart';
import 'package:moviles_auth/features/posts/domain/usecases/pick_post_image_usecase.dart';
import 'package:moviles_auth/features/posts/domain/usecases/publish_post_usecase.dart';
import 'package:moviles_auth/features/posts/domain/usecases/toggle_like_usecase.dart';
import 'package:moviles_auth/features/register/ui/bloc/register_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(() => SupabaseAuthDataSource());
  sl.registerLazySingleton(() => SupabaseProfileDataSource());
  sl.registerLazySingleton(() => DevicePhotoDataSource());
  sl.registerLazySingleton(() => SupabaseAvatarDataSource());
  sl.registerLazySingleton(() => SupabasePostDataSource());
  sl.registerLazySingleton(() => SupabasePostImageDataSource());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerLazySingleton<AvatarRepository>(() => AvatarRepositoryImpl());
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl());

  sl.registerLazySingleton(() => SignInUseCase());
  sl.registerLazySingleton(() => SignUpUseCase());
  sl.registerLazySingleton(() => SignOutUseCase());
  sl.registerLazySingleton(() => GetMyProfileUseCase());
  sl.registerLazySingleton(() => ChangeAvatarUseCase());
  sl.registerLazySingleton(() => GetFeedUseCase());
  sl.registerLazySingleton(() => GetMyPostsUseCase());
  sl.registerLazySingleton(() => ToggleLikeUseCase());
  sl.registerLazySingleton(() => PickPostImageUseCase());
  sl.registerLazySingleton(() => PublishPostUseCase());

  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(() => RegisterBloc());
  sl.registerFactory(() => FeedBloc());
  sl.registerFactory(() => ComposeBloc());
}
