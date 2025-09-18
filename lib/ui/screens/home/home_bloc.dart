import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perfume_shop/data/models/home_page_model.dart';
import 'package:perfume_shop/data/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _repository;
  HomeBloc(this._repository) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(_fetchData);
  }
  Future<void> _fetchData(
    FetchHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      HomePageModel homedata = await _repository.getHomeData();
      emit(HomeSuccess(homedata: homedata));
    } catch (e) {
      emit(HomeFailure(error: e.toString()));
    }
  }
}
