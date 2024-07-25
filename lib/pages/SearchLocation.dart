import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_widget1/bloc/location_bloc.dart';
import 'package:location_widget1/pages/LocationList.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  SearchLocationState createState() => SearchLocationState();
}

class SearchLocationState extends State<SearchLocation> {
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  List<String> letters = [];

  void createList(List<String> locations) {
    for (int i = 0; i < locations.length; i++) {
      if (!letters.contains(locations[i][0])) {
        letters.add(locations[i][0].toUpperCase());
      }
    }
    letters.sort();
  }

  @override
  void initState() {
    super.initState();
    createList(context.read<LocationBloc>().state.location);
  }

  void scrollToLetter(String s, List<String> locations) {
    double height = 400 / 8.5;
    for (int i = 0; i < locations.length; i++) {
      if (locations[i].toUpperCase().startsWith(s)) {
        // print(locations[i]);
        scrollController.animateTo(i * height,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                cursorColor: const Color.fromRGBO(76, 106, 177, 1),
                controller: textController,
                decoration: const InputDecoration(
                    hintText: 'Filter Location',
                    icon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 76, 106, 177),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                onChanged: (String value) {
                  context
                      .read<LocationBloc>()
                      .add(FilterListEvent(value: value));
                  state.location.sort();
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: LocationList(
                      controller: scrollController,
                      filteredLocations:
                          context.read<LocationBloc>().state.location,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ListView.builder(
                          itemCount: letters.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                              child: ListTile(
                                title: Text(
                                  letters[index],
                                  style: const TextStyle(
                                      color: Color(0xFF4C6AB1),
                                      fontFamily: 'Poppins',
                                      fontSize: 10),
                                ),
                                onTap: () {
                                  scrollToLetter(letters[index - 1].toString(),
                                      state.location);
                                },
                              ),
                            );
                          })),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
