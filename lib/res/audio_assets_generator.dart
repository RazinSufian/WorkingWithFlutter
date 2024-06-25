// import 'dart:async';
// import 'package:build/build.dart';
// import 'package:source_gen/source_gen.dart';
//
// class AudioAssetsGenerator extends Generator {
//   @override
//   FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
//     final buffer = StringBuffer();
//
//     final classElements = library.classes.where((c) => c.name == 'AudioAssets');
//     for (var classElement in classElements) {
//       buffer.writeln('class _\$GeneratedAudioAssets {');
//       buffer.writeln('  static const List<String> allAssets = [');
//
//       for (var field in classElement.fields.where((f) => f.isStatic)) {
//         buffer.writeln('    ${classElement.name}.${field.name},');
//       }
//
//       buffer.writeln('  ];');
//       buffer.writeln('}');
//     }
//
//     return buffer.toString();
//   }
// }
//
// Builder audioAssetsBuilder(BuilderOptions options) =>
//     LibraryBuilder(AudioAssetsGenerator(), generatedExtension: '.audio_assets.g.dart');
