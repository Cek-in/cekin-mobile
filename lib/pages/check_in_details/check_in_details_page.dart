import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../strings/strings_provider.dart';
import '../../ui/flexible_view.dart';
import '../../ui/sliver_app_bar.dart';
import '../../utils/types.dart';
import 'check_in_details_bloc.dart';

class CheckInDetailsPage extends StatefulWidget {
  final CheckInDetailsBloc _bloc;

  const CheckInDetailsPage(this._bloc, {Key? key}) : super(key: key);

  @override
  State<CheckInDetailsPage> createState() => _CheckInDetailsPageState();
}

class _CheckInDetailsPageState extends State<CheckInDetailsPage> {
  final Completer<GoogleMapController> _controller = Completer();

  CheckIn get checkIn => widget._bloc.checkIn;

  late final CameraPosition _checkInLocation;

  @override
  void initState() {
    super.initState();
    _checkInLocation = CameraPosition(
      target: LatLng(checkIn.place.latitude, checkIn.place.longitude),
      zoom: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, b) => buildHeader(context),
        body: buildBody(),
      ),
    );
  }

  List<Widget> buildHeader(BuildContext context) {
    final s = StringsProvider.i.strings.checkInDetails;
    return [
      CekInSliverAppBar(
        title: s.title,
        expandedSpace: Center(
          child: Text(
            widget._bloc.checkIn.place.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      )
    ];
  }

  Widget buildBody() {
    return FlexibleView(
      child: buildMap(),
    );
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _checkInLocation,
      rotateGesturesEnabled: false,
      myLocationButtonEnabled: false,
      tiltGesturesEnabled: false,
      onMapCreated: _controller.complete,
      markers: {
        Marker(
          markerId: MarkerId(checkIn.id),
          position: _checkInLocation.target,
        )
      },
    );
  }
}
