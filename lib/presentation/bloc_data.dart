import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/data/network/base/repository.dart';

abstract class BlocData<EVENT, STATE> extends Bloc<EVENT, STATE>
    with ApiRepository {
  BlocData(super.initialState);
}
