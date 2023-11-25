import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_event.dart';
import 'package:project_4/blocs/cart/bloc/cart_state.dart';
import 'package:project_4/data/global_data.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialState(counter: 1)) {
    num count = 1;
    // add to cart
    on<AddItemEvent>((event, emit) {
      if (!cartList.contains(event.watch)) {
        cartList.add(event.watch);
        event.watch.count = event.watch.count + 1;
        itemsTotal.value += event.watch.price;
        grandTotal.value = itemsTotal.value;
        emit(UpdateCartState(counter: event.watch.count));
      } else {
        event.watch.count = event.watch.count + 1;
        itemsTotal.value += event.watch.price;
        grandTotal.value = itemsTotal.value;
        emit(UpdateCartState(counter: event.watch.count));
      }
      //
    });

    on<AddItemFromDetailsEvent>((event, emit) {
      if (!cartList.contains(event.watch)) {
        cartList.add(event.watch);
        event.watch.count = event.watch.count + count;
        itemsTotal.value += event.watch.price;
        grandTotal.value = itemsTotal.value;

        emit(UpdateCartState(counter: event.watch.count));
      } else {
        event.watch.count = event.watch.count + 1;
        itemsTotal.value += event.watch.price;
        grandTotal.value = itemsTotal.value;
        emit(UpdateCartState(counter: event.watch.count));
      }
      //
    });
    //increase counter
    on<IncreseEvent>((event, emit) {
      //
      event.watch.count = event.watch.count + 1;
      itemsTotal.value = itemsTotal.value + event.watch.price;
      grandTotal.value = (itemsTotal.value - discount);
      emit(UpdateCountState(counter: event.watch.count));
    });

    //decrease counter
    on<DecreseEvent>((event, emit) {
      if (event.watch.count == 1) {
        itemsTotal.value = itemsTotal.value - event.watch.price;
        grandTotal.value = (itemsTotal.value - discount);
        event.watch.count = 0;
        cartList.remove(event.watch);
        emit(UpdateCountState(counter: 1));
      } else {
        event.watch.count = event.watch.count - 1;
        itemsTotal.value = itemsTotal.value - event.watch.price;
        grandTotal.value = (itemsTotal.value - discount);
        emit(UpdateCountState(counter: event.watch.count));
      }
    });
    // remove item from cart
    on<RemoveItemEvent>((event, emit) {
      itemsTotal.value -= (event.watch.price * event.watch.count);
      grandTotal.value = itemsTotal.value - discount;
      event.watch.count = 0;
      cartList.remove(event.watch);
      emit(UpdateCartState(counter: 1));
    });
  }
}
