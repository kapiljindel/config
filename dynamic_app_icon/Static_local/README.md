# 🎨 Static App Icon Changer (Flutter – Local Switching)

This Flutter project allows users to switch between predefined **static app icons** from within the app — without using any external services like Firebase.

✅ This project was reviewed and structured with **ChatGPT** to ensure it is **safe for publishing on GitHub** and does **not violate** any GitHub policies or terms of service.

---

## 🚀 Features

- Switch between multiple app icons from a Flutter UI page
- All icons are bundled locally inside the app
- Does **not** require internet or Firebase
- Simple and user-driven icon switching

---

## 🛠️ Setup Instructions

### 1. Add Your Icon Assets

Add your `.png` icon files inside the following directory: android/app/src/main/res/drawable/

For example:
icon1.png
icon2.png
icon3.png


> ✅ Icons must follow Android’s resolution requirements (e.g., 48x48dp or higher).

### 2. Update `AndroidManifest.xml`

Navigate to: android/app/src/main/AndroidManifest.xml


And set the default app icon:

```xml
<application android:icon="@drawable/icon1" android:label="YourAppName"  ... >
```
### 3. Update Package Name in MainActivity.kt
```
Navigate to: android/app/src/main/kotlin/com/yourcompany/yourapp/MainActivity.kt

And update the package declaration at the top:
package com.yourcompany.yourapp

Make sure this matches your app’s actual package name.

```
### 4. Switch Icons in Flutter Page (UI Logic)

Create a UI screen in Flutter where the user can choose which icon to use.

You'll need to use Platform Channels or native Kotlin code to apply the selected icon dynamically.

❗ Changing app icons dynamically without restarting the app requires native implementation on Android only. iOS does not support it without user prompt.


### 🤖 ChatGPT Review & GitHub Safety Disclaimer

This project and its README content were created and reviewed with the assistance of ChatGPT by OpenAI to ensure they are safe and appropriate for public sharing on GitHub.

✅ No API keys, secrets, or external credentials are included
✅ The project works fully offline with no backend or services required
✅ Content complies with GitHub’s Terms of Service
 and Community Guidelines
✅ Intended strictly for open-source, educational, and non-commercial use

⚠️ If GitHub or any relevant authority finds this repository to be unsafe or in violation of any policy in the future, we are fully prepared to take immediate action, including removing or modifying the content to ensure compliance.

