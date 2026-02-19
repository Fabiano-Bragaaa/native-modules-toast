package com.nativetoast

import android.widget.Toast
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = NativeToastModule.NAME)
class NativeToastModule(reactContext: ReactApplicationContext) : NativeToastSpec(reactContext) {

  override fun getName() = NAME

  override fun showToast(message: String) {
    Toast.makeText(reactApplicationContext, message, Toast.LENGTH_SHORT).show()
  }

  companion object {
    const val NAME = "NativeToast"
  }
}
