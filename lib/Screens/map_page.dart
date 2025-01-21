import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:organ_donation_app/controller/map_controller.dart';
import 'package:organ_donation_app/widgets/custom_map.dart';


class MapPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Get.put(MapController(),);
    final MapController mapController = MapController();
    
    return Scaffold(
      appBar: AppBar(title: Text("Kandy Hospital",
        
        ),
        centerTitle: true,
      ),
      body: Column(children: [
      
        Expanded(child: CustomMap(),
        ),
      ],
      ),
    );
  }
}