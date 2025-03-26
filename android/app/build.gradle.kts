plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.sample_bloc"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.sample_bloc"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 28
        targetSdk = 35
        versionCode = 1
        versionName = "1.0.0"
    }

    signingConfigs {
//        create("key_release") {
//            try {
//                storeFile = file(keystoreProperties.getProperty("store_file"))
//                storePassword = keystoreProperties.getProperty("store_password")
//                keyAlias = keystoreProperties.getProperty("key_alias")
//                keyPassword = keystoreProperties.getProperty("key_alias_password")
//                println("Config KeyStore Success")
//            } catch (e: Exception) {
//                throw Exception("Config key_store failure $e")
//            }
//        }

//        create("key_debug") {
//            try {
//                storeFile = file(keystoreProperties.getProperty("store_file"))
//                storePassword = keystoreProperties.getProperty("store_password")
//                keyAlias = keystoreProperties.getProperty("key_alias")
//                keyPassword = keystoreProperties.getProperty("key_alias_password")
//                println("Config KeyStore Success")
//            } catch (e: Exception) {
//                throw Exception("Config key_store failure $e")
//            }
//        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
//            signingConfig = signingConfigs.getByName("key_release")
        }

        debug {
//            signingConfig = signingConfigs.getByName("key_debug")
        }
    }

    flavorDimensions += "ss_dimension"
    productFlavors {
        create("dev") {
            isDefault = true
            applicationId = "com.example.sample_bloc.dev"
            resValue("string", "app_name", "Base-DEV")
        }

        create("stg") {
            applicationId = "com.example.sample_bloc.stg"
            resValue("string", "app_name", "Base-STG")
        }

        create("product") {
            applicationId = "com.example.sample_bloc"
            resValue("string", "app_name", "Base")
        }
    }
}

flutter {
    source = "../.."
}
