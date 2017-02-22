# wercker-step-swiftlint

[![License][badge-license]][license]

[Wercker][wercker] step for [Realm/SwiftLint][github-realm-swiftlint].


## Usage

```yaml
build:
  steps:
    - mitsuse/swiftlint:
```


## Properties

- `version`: the version of SwiftLint (default: `0.16.0`)
- `config`: the path of a configuration for linting (default: `.swiftlint.yml`)


## License

The content of this repository are licensed under the MIT License unless otherwise noted.
Please read [LICENSE][license] for the detail.

[badge-license]: https://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square
[license]: LICENSE
[wercker]: https://app.wercker.com/
[github-realm-swiftlint]: https://github.com/realm/SwiftLint
