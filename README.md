# pogo_tiled

Tiled plugin to the [Pogo Game Engine](https://pub.dev/packages/pogo).

The [Tiled Map Editor](https://www.mapeditor.org/) is an awesome tool for building levels and maps.  The [Tiled package for Dart](https://pub.dev/packages/tiled) is used to parse Tiled's TMX files for map rendering.

## Adding the plugin to your Pogo project

Add the [pogo_tiled package](https://pub.dev/packages/pogo) dependency to your project's `pubspec.yaml`, for example (check your version number):

```yaml
dependencies:
  pogo_tiled: ^0.1.0
```

A plugin import is required in addition to the Pogo import in each source file that uses it:

```dart
import 'package:pogo/game_engine.dart';
import 'package:pogo_tiled/plugin.dart';
```

Currently, you will also need to import some objects from the tiled package to gain any significant functionality.  (NOTE: This, ideally, will not be required once the plugin has been fully refactored for Pogo.)  For example (not definitive):

```dart
import 'package:tiled/tiled.dart' show ObjectGroup, TmxObject;
```

## TiledComponent class

The TiledComponent class is a component for use in building a [GameEntity](https://github.com/juanitogan/pogo/blob/master/doc/game_entity.md).  Currently, Tiled support only renders the visible layers.  [Other advanced features are not yet supported.](https://github.com/flame-engine/tiled.dart/blob/master/CHANGELOG.md)

**TODO: the old version of this is working but this is slated to be rebuilt; will rewrite doc after that.**

## TiledPrefab

A [prefab](https://github.com/juanitogan/pogo/blob/master/doc/prefabs.md) that implements TiledComponent.

----

See the [example app](example/lib/main.dart).
