import 'package:flutter/material.dart';

import 'components/searchfield_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchFieldWidget(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.refresh_sharp),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "search data",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
