import 'package:connectivitycheck_using_cubit/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit,InternetState>(
            listener: (context,state){
              if(state == InternetState.Gained){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Connected!"),backgroundColor: Colors.green,));
              }
              else if(state == InternetState.Lost){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet not Connected!"),backgroundColor: Colors.red,));
              }
            },
            builder: (context, state)
            {
              if(state == InternetState.Gained){
                return Text('Connected');
              }
              else if(state == InternetState.Lost){
                return Text('Not Connected');
              }
              else{
                return Text("Loading...");
              }
            },
          ),
        ),
      ),

    );
  }
}
