import 'package:isar/isar.dart';

part 'notes.g.dart';

@collection // Need this collection
class Notes {
  // Auto += 1 & Start from 0
  Id id = Isar.autoIncrement;
  late String text;

}