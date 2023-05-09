

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
 // const Map({Key? key}) : super(key: key);

 final _mapController = MapController(initMapWithUserPosition:true);
 var markerMap =<String,String>{};
 @override
 void initState(){
   super.initState();
 //  mapController.dispose();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     _mapController.listenerMapSingleTapping.addListener(() async{

       var position = _mapController.listenerMapSingleTapping.value;
       if(position!=null){
         await _mapController.addMarker(position,markerIcon: const MarkerIcon(
           icon:Icon(Icons.pin_drop, color:Colors.blue,size:48),

         ));

         var key ='${position!.latitude}_${position!.longitude}';
         markerMap[key]=markerMap.length.toString();
       }
     });
   });
 }
  @override
  void dispose(){
 super.dispose();
 _mapController.dispose();
 }

  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(
        controller:_mapController,
        trackMyPosition: true,
        initZoom: 12,
        minZoomLevel: 14,
        maxZoomLevel: 14,
        stepZoom: 1.0,
        androidHotReloadSupport: true,
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: MarkerIcon(
            icon: Icon(
              Icons.add_home_work_sharp,color :Colors.red,
              size: 100,
            ),
          ),
        ),
        roadConfiguration: RoadOption(
          roadColor: Colors.yellow.shade600,
        ),
        markerOption: MarkerOption(
            defaultMarker: MarkerIcon(
              icon: Icon(
                Icons.location_city_outlined,
                color: Colors.blue,
                size: 56,
              ),
            )
        ),
        onMapIsReady: (isReady) async {
          if(isReady){
            await Future.delayed(const Duration(seconds: 1),() async{
              await _mapController.currentLocation();
      });

          }
        },

        onGeoPointClicked:(geoPoint){
          if (geoPoint!=null){
            showModalBottomSheet(context: context, builder: (context) {
             return Card(
               child:Padding(padding: const EdgeInsets.all(8),
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.min,


               ))

             );
            });
            
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.setZoom(stepZoom: 1.0);
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
