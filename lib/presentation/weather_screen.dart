import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/bloc/weather_bloc.dart';
import 'package:weather_appp/bloc/weather_event.dart';
import 'package:weather_appp/bloc/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [IconButton(
          icon:const Icon(Icons.replay_outlined,
        size: 20,
        color: Colors.blueAccent,), onPressed:(){
          context.read<WeatherBloc>().add(WeatherFetched());
        },
        )],
      ),
      body: BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context,state){
            final data = state.weatherModel;

          // final currentTemp = data?.currentTemp;
          // final currentSky = data?.currentSky;
          // final currentPressure = data?.currentPressure;
          // final currentWindSpeed = data?.currentWindSpeed;
          // final currentHumidity = data?.currentHumidity;
         switch(state.status){
          case Status.loading:
          return Center(child: CircularProgressIndicator());

          case Status.error:
          return Center(child: Text('Error fetching'));

          case Status.success:
          
           return Center(
             child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ) ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10
                    ),
                    child: Padding(padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                         Text(
                                  'currentTemp K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Icon(
                                //   currentSky == 'Clouds' || currentSky == 'Rain'
                                //       ? Icons.cloud
                                //       : Icons.sunny,
                                //   size: 64,
                                // ),
                                const SizedBox(height: 16),
                                // Text(
                                //   currentSky!,
                                //   style: const TextStyle(
                                //     fontSize: 20,
                                //   ),
                                // ),
                      ],
                    ),),),
                  ),
                ),
                
                )
              ],
                       ),
                     ),
           );
         }
          
    
       }
      ),
    );
  }
}