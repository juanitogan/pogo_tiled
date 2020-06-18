import 'package:pogo/game_engine.dart';
import 'package:pogo_tiled/src/components/tiled_component.dart';

export 'package:pogo_tiled/src/components/tiled_component.dart';

/// A [GameEntity] containing a [TiledComponent].
/// This gives components position, Z order, rotation, and scale.
///
/// This creates a prefabricated entity intended for single-use entities.
class TiledPrefab extends GameEntity {
  TiledComponent tiledComponent;

  TiledPrefab(
      this.tiledComponent,
      {
        Vector2 position,
        int     zOrder = 0,
        double  rotation,
        double  rotationDeg,
        Vector2 scale,
        bool    enabled = true,
        GameEntity parent,
      }
  ) : super(
    position:    position,
    zOrder:      zOrder,
    rotation:    rotation,
    rotationDeg: rotationDeg,
    scale:       scale,
    enabled:     enabled,
    parent:      parent,
  );

  @override
  void update() {
    tiledComponent.render();
  }

}
