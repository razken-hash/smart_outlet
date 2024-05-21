package com.example.smart_outlet

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import android.net.wifi.WifiNetworkSpecifier
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.PatternMatcher
import android.net.NetworkRequest
import android.net.NetworkCapabilities
import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "channelname/wifiworks"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
          call, result ->
          if (call.method == "getTest") {
            val temp = getTest(call.argument<String>("SSID").toString())
    
              result.success(temp)
          // Note: this method is invoked on the main thread.
          // TODO
          }
          if(call.method == "dc") {
              val temp = disconnect()
    
              result.success(temp)
          }
        }
    }
    private fun disconnect(): Int {
        if(android.os.Build.VERSION.SDK_INT >= 29)
        {
            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            connectivityManager.unregisterNetworkCallback(mNetworkCallback)
        }
        return 3434;
    }
    private val mNetworkCallback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                //phone is connected to wifi network
                val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
                connectivityManager.bindProcessToNetwork(network)
            }
    }
    private fun getTest(ssid: String): Int {

        if(android.os.Build.VERSION.SDK_INT >= 29)
        {
            val specifier = WifiNetworkSpecifier.Builder()
            // .setSsidPattern(PatternMatcher("SSID", PatternMatcher.PATTERN_PREFIX))
            .setSsid(ssid)
            .setWpa2Passphrase("Your_Password")
            .build()
        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
            .setNetworkSpecifier(specifier)
            .build()

            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        
        connectivityManager.requestNetwork(request, mNetworkCallback)

        // Release the request when done.
        //

        return 123
        }
        else {
            var networkSSID = ssid;
            var networkPass = "Your_Password";
            var conf = WifiConfiguration()
            conf.SSID = "\"" + networkSSID + "\""
            conf.preSharedKey = "\""+ networkPass +"\""
            var wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager
            var netid = wifiManager.addNetwork(conf)
            wifiManager.disconnect()
            wifiManager.enableNetwork(netid, true)
            wifiManager.reconnect()
            return ssid.length
        }
    }
}
