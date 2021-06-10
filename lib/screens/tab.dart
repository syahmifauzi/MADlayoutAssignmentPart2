import 'package:flutter/material.dart';

import '../models/device.dart';

class TabScreen extends StatelessWidget {
  final List<Device> devices;
  final Function onDeviceToggled;

  TabScreen(this.devices, this.onDeviceToggled);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade200, Colors.grey.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1.1,
        children: devices
            .map((device) => Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/${device.image}',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          onTap: () => onDeviceToggled(device.id),
                        ),
                        Spacer(),
                        if (!device.isOn)
                          Icon(
                            Icons.power_off_outlined,
                            color: Colors.grey,
                          ),
                      ]),
                      Spacer(),
                      Text(device.title),
                      SizedBox(height: 4.0),
                      Text(
                        '• ${device.isOn ? 'ON' : 'OFF'}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: device.isOn ? Colors.teal : Colors.black87,
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
