import 'package:project_4/models/watch_model.dart';

abstract class CartEvent {
  final Watch watch;

  CartEvent(this.watch);
}

class AddItemEvent extends CartEvent {
  AddItemEvent(super.watch);
}

class AddItemFromDetailsEvent extends CartEvent {
  final int count;
  AddItemFromDetailsEvent(super.watch, this.count);
}

class IncreseEvent extends CartEvent {
  IncreseEvent(super.watch);
}

class DecreseEvent extends CartEvent {
  DecreseEvent(super.watch);
}

class RemoveItemEvent extends CartEvent {
  RemoveItemEvent(super.watch);
}
