# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- `TiledComponent` refactor.


## [0.0.1] - 2020-06-17
First commit after removing the plugin from the built-in plugins of Pogo.

### Known issues
- Tried to update tiled from 0.2.1 to 0.4.0 but could not.  Non-square maps generate a RangeError due to x/y-order issues in tiled 0.4.0.  Furthermore, could not update anyhow because 0.4.0 relies on a newer XML library that would also force flutter_svg in Pogo to 0.18.0, which, in turn, relies on a pre-release version of Flutter, for some reason.


[Unreleased]: https://github.com/juanitogan/pogo_tiled/compare/0.0.1...HEAD
[0.0.2]: https://github.com/juanitogan/pogo_tiled/compare/0.0.1...0.0.2
[0.0.1]: https://github.com/juanitogan/pogo_tiled/releases/tag/0.0.1
