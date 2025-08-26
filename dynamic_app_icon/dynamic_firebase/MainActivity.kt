package com.example.testing

import android.content.ComponentName
import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.dynamic_icon"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "changeIcon") {
                val iconName = call.argument<String>("icon")
                if (iconName != null) {
                    changeIcon(iconName)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Icon name missing", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun changeIcon(name: String) {
        val pm = applicationContext.packageManager
        val packageName = applicationContext.packageName
        val sharedPref = applicationContext.getSharedPreferences("settings", MODE_PRIVATE)
        val currentIcon = sharedPref.getString("current", ".DefaultIcon")

        if (currentIcon == name) return

        // Disable old icon
        pm.setComponentEnabledSetting(
            ComponentName(packageName, "$packageName$currentIcon"),
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
            PackageManager.DONT_KILL_APP
        )

        // Enable new icon
        pm.setComponentEnabledSetting(
            ComponentName(packageName, "$packageName$name"),
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
            PackageManager.DONT_KILL_APP
        )

        sharedPref.edit().putString("current", name).apply()
    }
}
