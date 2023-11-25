import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_event.dart';
import 'package:project_4/blocs/cart/bloc/cart_state.dart';
import 'package:project_4/data/constants.dart';
import 'package:project_4/data/global_data.dart';

import 'package:project_4/screens/order/widgets/add_remove_item.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.centerRight,
                  color: Colors.grey,
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  context
                      .read<CartBloc>()
                      .add(RemoveItemEvent(cartList[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .24,
                                height:
                                    MediaQuery.of(context).size.height * .145,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF7F6F6),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(60))),
                              ),
                              Positioned(
                                right: 33,
                                top: -23,
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  cartList[index].image,
                                  scale: 5,
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList[index].name,
                              style: const TextStyle(
                                  color: Color(0xFF233B66),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              cartList[index].description,
                              style: const TextStyle(color: Color(0xFF847F7F)),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "$rupeeIcon${cartList[index].price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      AddRemoveItem(
                        watch: cartList[index],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
