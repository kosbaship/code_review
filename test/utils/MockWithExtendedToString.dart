import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

abstract class MockWithExpandedToString extends Mock {
  @override
  String toString({ DiagnosticLevel minLevel = DiagnosticLevel.debug }) => super.toString();
}
