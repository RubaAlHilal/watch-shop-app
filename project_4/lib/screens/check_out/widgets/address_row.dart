import 'package:flutter/material.dart';
import 'package:project_4/data/global_data.dart';

class AddressRow extends StatefulWidget {
  const AddressRow({Key? key}) : super(key: key);

  @override
  State<AddressRow> createState() => _AddressRowState();
}

String currentOption = currentUser.address![0]["name"];

int selectedIndex = 0;

class _AddressRowState extends State<AddressRow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.normal,
                offset: Offset(15, 85),
                blurRadius: 70,
              ),
            ],
          ),
        ),
        ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: currentUser.address!.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shadowColor: Colors.transparent,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 205,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: -5,
                      leading: Radio(
                        activeColor: const Color(0xfffccf78),
                        value: currentUser.address![index]["name"],
                        groupValue: currentOption,
                        onChanged: (value) {
                          currentOption = value.toString();
                          selectedIndex = index;
                          setState(() {});
                        },
                      ),
                      title: Text("${currentUser.address![index]["name"]}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.mode_edit_outline_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42.0, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            "${currentUser.address![index]["road"]}",
                            style: const TextStyle(color: Color(0xFF847F7F)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.phone_android_outlined),
                            const SizedBox(width: 4),
                            Text("${currentUser.address![index]["phone"]}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
