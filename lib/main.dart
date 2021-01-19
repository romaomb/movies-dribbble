// @dart=2.9
// The comment above is necessary so we don't get a "Cannot run with sound null
// safety, because the following dependencies" error.
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  // Provider won't allow you to provide a Cubit and unfortunately, BlocProvider
  // doesn't have a builder for us to immediately use the value. We need to add
  // this so we don't get a "Tried to use Provider with a subtype of Listenable/
  // Stream (OffsetPositionCubit)." error. Listenable/Stream providers don't
  // work with Cubit.
  final previousCheck = Provider.debugCheckInvalidValueType;
  Provider.debugCheckInvalidValueType = <T>(T value) {
    if (value is Cubit) return;
    previousCheck<T>(value);
  };
  runApp(MoviesApp());
}
