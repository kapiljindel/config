
# 🔄 Dynamic App Icon Changer (Flutter + Firebase)

This Flutter project allows you to change the **app icon dynamically** using remote configuration via **Firebase Firestore**.

✅ This project was reviewed and structured with **ChatGPT** to ensure that it is **safe for publishing on GitHub** and does **not violate** any GitHub policies or terms of service.

---

## 🚀 Features

- Change the app icon dynamically from Firebase
- Use Firestore to manage which icon is active
- No need to update the app for icon changes
- Clean and maintainable structure

---

## 🛠️ Setup Instructions
### 1. Add Your App Icons

Add your `.png` icon files to this directory: android/app/src/main/res/drawable/


> ✅ Make sure the icons follow Android resolution standards (e.g., 48x48 dp or higher).

---

### 2. Update AndroidManifest.xml

Go to: android/app/src/main/AndroidManifest.xml


And update the app icon reference:

```xml
<application
    android:icon="@drawable/icon1"
    ... >

### 3. Update Package Name in MainActivity.kt

Go to: android/app/src/main/kotlin/com/yourcompany/yourapp/MainActivity.kt

And update the package name at the top of the file: package com.yourcompany.yourapp

🔥 Firebase Firestore Configuration

This project uses Cloud Firestore to remotely control which app icon should be used.

settings (collection)
   └── default_config (document)
           └── app_icon: ".icon1" (string)

Example Document:

   {
  "app_icon": ".icon1"
   }


⚠️ Do not include .png in the Firestore value. It should match your drawable icon filename exactly (e.g., .icon1 refers to icon1.png).




---

## 🤖 ChatGPT Review & GitHub Safety Disclaimer

This project and its README content were created and reviewed with the assistance of **ChatGPT by OpenAI** to ensure they are safe and appropriate for public sharing on **GitHub**.

- ✅ No sensitive information (such as API keys or credentials) is included.
- ✅ Firebase configuration files are ignored via `.gitignore`.
- ✅ The content complies with GitHub’s [Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) and [Community Guidelines](https://docs.github.com/en/site-policy/github-terms/github-community-guidelines).
- ✅ The code and documentation are intended for educational and open-source use only.

> ⚠️ If GitHub or any relevant authority finds this repository to be unsafe or in violation of any policy in the future, we are fully prepared to **take immediate action, including removing or modifying the content** to ensure compliance.

