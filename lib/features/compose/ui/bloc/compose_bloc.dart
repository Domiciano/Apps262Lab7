import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviles_auth/features/compose/ui/bloc/compose_event.dart';
import 'package:moviles_auth/features/compose/ui/bloc/compose_state.dart';
import 'package:moviles_auth/features/posts/domain/usecases/publish_post_usecase.dart';

/// Publishes the text written in the compose screen.
class ComposeBloc extends Bloc<ComposeEvent, ComposeState> {
  final PublishPostUseCase _publish = PublishPostUseCase();

  ComposeBloc() : super(const ComposeState()) {
    on<ComposeSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    ComposeSubmitted event,
    Emitter<ComposeState> emit,
  ) async {
    emit(state.copyWith(status: ComposeStatus.loading));
    try {
      await _publish(event.content);
      emit(state.copyWith(status: ComposeStatus.success));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: ComposeStatus.failure,
          errorMessage: e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
