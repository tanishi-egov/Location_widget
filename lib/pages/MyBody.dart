import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:location_widget1/pages/constants.dart';
import 'package:location_widget1/pages/SearchLocation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_widget1/bloc/location_bloc.dart';

@RoutePage()
class MyBodyScreen extends StatefulWidget {
  const MyBodyScreen({super.key});

  @override
  MyBodyState createState() => MyBodyState();
}

class MyBodyState extends State<MyBodyScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width * 0.05),
                  color: const Color(0xFFabc4ff),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 9,
                        child:
                            Text('Locations', style: styling.headingTextStyle),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            color: const Color.fromARGB(255, 76, 106, 177),
                            onPressed: () {
                              context
                                  .read<LocationBloc>()
                                  .add(VisiblityToggle());
                            },
                            icon: Icon(
                              state.isVisible
                                  ? Icons.minimize_rounded
                                  : Icons.expand_circle_down,
                            )),
                      )
                    ],
                  )),
              Visibility(
                visible: state.isVisible,
                child: Container(
                  height: height * 0.8,
                  width: width * 0.9,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: const SearchLocation(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
