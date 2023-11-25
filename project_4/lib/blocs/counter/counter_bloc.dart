import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/counter/counter_event.dart';
import 'package:project_4/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounter()) {
    on<CounterEvent>((event, emit) {});
  }
}
