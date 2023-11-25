abstract class CartState {
  final num counter;

  CartState({required this.counter});
}

class InitialState extends CartState {
  InitialState({required super.counter});
}

class UpdateCartState extends CartState {
  UpdateCartState({required super.counter});
}
class UpdateCountState extends CartState {
  UpdateCountState({required super.counter});
}
class CounterState extends CartState {
  CounterState({required super.counter});
}
