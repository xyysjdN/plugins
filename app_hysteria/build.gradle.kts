plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.exe.hysteria"
        versionCode = 8
        versionName = "app/v2.2.0"
    }
}
