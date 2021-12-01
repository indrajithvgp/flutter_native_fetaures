import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final loction = await Location().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: () async {
                // final locData = await Location().getLocation();
                // final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
                //     latitude: locData.latitude,
                //     longitude: locData.longitude);
                // setState(() {
                //   _previewImageUrl = staticMapImageUrl;
                // });
              },
              icon: Icon(Icons.location_on),
              textColor: Theme.of(context).primaryColor,
              label: Text('Current Location'),
            ),
            FlatButton.icon(
              onPressed: () async {
                await _getCurrentUserLocation();
                // final locData = await Location().getLocation();
                // final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
                //     latitude: locData.latitude,
                //     longitude: locData.longitude);
                // setState(() {
                //   _previewImageUrl = staticMapImageUrl;
                // });
              },
              icon: Icon(Icons.location_on),
              textColor: Theme.of(context).primaryColor,
              label: Text('Current Location'),
            ),
          ],
        )
      ],
    );
  }
}
