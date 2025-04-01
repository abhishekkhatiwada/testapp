plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.testapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"
    

    compileOptions {
        isCoreLibraryDesugaringEnabled = true  
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        minSdk = 23
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions.add("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            versionCode = 1
            versionName = "1.0.0"
        }
        create("dev") {
            dimension = "flavor-type"
            versionCode = 1
            versionName = "1.0.0"
        }
    }

    buildTypes {
        getByName("debug") {
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("debug")
        }
        getByName("release") {
            isMinifyEnabled = true
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib")

    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
