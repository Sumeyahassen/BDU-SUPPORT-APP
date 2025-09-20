plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}


    android {
    namespace = "com.example.bdu_exam_app"
    compileSdk = 35             // ← upgrade from 34 to 35
    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.example.bdu_exam_app"
        minSdk = flutter.minSdkVersion
        targetSdk = 35          // ← upgrade from 34 to 35
        versionCode = 1
        versionName = "1.0"
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
