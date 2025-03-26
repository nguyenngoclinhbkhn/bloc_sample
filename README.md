# bloc_sample
Project for bloc flutter

# Environment
Flutter : 3.29.1
Android Studio Meerkat | 2024.3.1
JDK 17
XCode Version 16.2 (16C5032a)

# Generate assets
dart run build_runner build --delete-conflicting-outputs

# Generate resource
dart pub run easy_localization:generate -f keys -o locale_keys.g.dart

# Flavor
```txt
dev
stg
prod
```

## Build
dev
```
flutter build apk -t lib/main_dev.dart --flavor=dev
flutter build appbundle -t lib/main_dev.dart --flavor=dev

flutter build ipa -t lib/main_dev.dart --flavor=dev --export-options-plist=ios/fastlane/ExportOptions_dev.plist
```

stg
```
flutter build apk -t lib/main_stg.dart --flavor=stg
flutter build appbundle -t lib/main_stg.dart --flavor=stg

flutter build ipa -t lib/main_stg.dart --flavor=stg --export-options-plist=ios/fastlane/ExportOptions_stg.plist

```

prod
```
flutter build apk -t lib/main_prod.dart --flavor=prod
flutter build appbundle -t lib/main_prod.dart --flavor=prod

flutter build ipa -t lib/main_prod.dart --flavor=prod --export-options-plist=ios/fastlane/ExportOptions_prod.plist

```

### Release
```
flutter build apk -t lib/main_prod.dart --flavor=prod
flutter build appbundle -t lib/main_prod.dart --flavor=prod

flutter build ipa -t lib/main_prod.dart --flavor=prod --export-options-plist=ios/fastlane/ExportOptions_prod.plist
```