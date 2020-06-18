import 'package:pogo/game_engine.dart';
import 'package:tiled/tiled.dart' hide Image;

//TODO redux and pogo-ize this; is a pivot relevant?

class TiledComponent {
  String filename;
  TileMap map;
  //Image image; //TODO usage?
  Map<String, Raster> images = <String, Raster>{};
  Future future;
  bool _loaded = false;

  Paint paint = System.defaultPaint;

  TiledComponent(this.filename) {
    future = _load();
  }

  Future _load() async {
    map = await _loadMap();
    //image = await Pogo.rasterCache.load(map.tilesets[0].image.source); //TODO usage?
    images = await _loadImages(map);
    _loaded = true;
    print(map.width);
    print(map.height);
  }

  Future<TileMap> _loadMap() {
    return Assets.bundle.loadString('assets/tiles/' + filename).then((contents) {
      final parser = TileMapParser();
      return parser.parse(contents);
    });
  }

  Future<Map<String, Raster>> _loadImages(TileMap map) async {
    final Map<String, Raster> result = {};
    await Future.forEach(map.tilesets, (tileset) async {
      await Future.forEach(tileset.images, (tmxImage) async {
        result[tmxImage.source] = await Assets.rasterCache.load(tmxImage.source);
      });
    });
    return result;
  }

  bool loaded() => _loaded;

  void render() {
    if (!loaded()) {
      return;
    }

    map.layers.forEach((layer) {
      if (layer.visible) {
        _renderLayer(layer);
      }
    });
  }

  void _renderLayer(Layer layer) {
    //TODO NOTE: This is broken until tiled 0.4.0 fixes their x/y-order issues and resultant array RangeError.
    //TODO       Might fix myself but plugin is terribly short on documentation and change notes.
    //TODO       Issue submitted.
    layer.tiles.forEach((column) {
      column.forEach((tile) {
        if (tile == null || tile.gid == 0) {
          return;
        }

        final image = images[tile.image.source];

        final rect = tile.computeDrawRect();
        final src = Rect.fromLTWH(rect.left.toDouble(), rect.top.toDouble(),
            rect.width.toDouble(), rect.height.toDouble());
        //TODO px and py instead of x and y now??? but why?
        final dst = Rect.fromLTWH(tile.x.toDouble(), tile.y.toDouble(),
            rect.width.toDouble(), rect.height.toDouble());

        GameCanvas.main.drawImageRect(image.source, src, dst, paint);
      });
    });
  }

  Future<ObjectGroup> getObjectGroupFromLayer(String name) {
    return future.then((onValue) {
      return map.objectGroups
          .firstWhere((objectGroup) => objectGroup.name == name);
    });
  }

}
