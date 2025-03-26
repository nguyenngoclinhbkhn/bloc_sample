import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/data/network/api_posts_sample/post_repository_ex.dart';
import 'package:sample_bloc/data/network/api_posts_sample/post_response.dart';
import 'package:sample_bloc/presentation/bloc_data.dart';
import 'package:sample_bloc/widget/loading/loading.dart';

///TODO: Sample

abstract class DataEvent {}

class LoadDataEvent extends DataEvent {}

abstract class DataState {}

class DataStateInit extends DataState {}

class DataStateLoaded extends DataState {
  final PostResponse response;

  DataStateLoaded(this.response);
}

class Menu1Bloc extends BlocData<DataEvent, DataState> {
  Menu1Bloc() : super(DataStateInit()) {
    on<LoadDataEvent>((event, emit) async {
      await _onFetchPosts(event, emit);
    });
  }

  Future<void> _onFetchPosts(
    LoadDataEvent event,
    Emitter<DataState> emit,
  ) async {
    try {
      Loading.show();
      await Future.delayed(const Duration(seconds: 2));
      final postResponse = await getPostResponse();
      emit(DataStateLoaded(postResponse));
    } catch (e) {
      debugPrint('----- get post failure: ${e.toString()}');
    } finally {
      Loading.dismiss();
    }
  }
}
