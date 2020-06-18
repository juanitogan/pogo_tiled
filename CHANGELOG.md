# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- `TiledComponent` refactor.


## [0.0.1] - 2020-06-17
First commit after removing the plugin from the built-in plugins of Pogo.

### Known issues
- **Severely broken.**  Non-square maps generate a RangeError due to issues in tiled 0.4.0.  Cannot regress to an older tiled version due to dependency on latest flutter_svg (and it's XML library that is also used in tiled) in Pogo.


[Unreleased]: https://github.com/juanitogan/pogo/compare/0.0.1...HEAD
[0.0.2]: https://github.com/juanitogan/pogo_tiled/compare/0.0.1...0.0.2
[0.0.1]: https://github.com/juanitogan/pogo_tiled/releases/tag/0.0.1
