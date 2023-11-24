import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/watch_model.dart';

void addItemToCart(Watch watch) {
  if (!cartList.contains(watch)) {
    cartList.add(watch);
    watch.count = watch.count + 1;
    itemsTotal.value += watch.price;
    grandTotal.value = itemsTotal.value;
  } else {
    watch.count = watch.count + 1;
    itemsTotal.value += watch.price;
    grandTotal.value = itemsTotal.value;
  }
}

void addItemToCartFromDetails(Watch watch, int count) {
  if (!cartList.contains(watch)) {
    cartList.add(watch);
    watch.count = watch.count + count;
    itemsTotal.value += watch.price * count;
    grandTotal.value = itemsTotal.value;
  } else {
    watch.count = watch.count + count;
    itemsTotal.value += watch.price * count;
    grandTotal.value = itemsTotal.value;
  }
}
