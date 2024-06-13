package com.example.smart_outlet

import android.content.BroadcastReceiver
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
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.wifi.WifiNetworkSuggestion
import android.net.wifi.WifiNetworkSuggestion.Builder
import android.net.wifi.hotspot2.PasspointConfiguration
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import java.util.logging.Logger

class MainActivity : FlutterActivity() {

    private val CHANNEL = "wificonnector/wifiworks"

    @RequiresApi(Build.VERSION_CODES.Q)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "connectWifi") {
                // Note: this method is invoked on the main thread.
                // TODO
                val logger = Logger.getLogger("info");
                val temp = connectToWifi(
                    call.argument<String>("SSID").toString(),
                    call.argument<String>("password").toString()
                )

               result.success(temp)

            }
            if (call.method == "disconnect") {
                val temp = disconnect()

                result.success(temp)
            }
        }
    }

    private fun disconnect(): Int {
        if (android.os.Build.VERSION.SDK_INT >= 29) {
            val connectivityManager =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            connectivityManager.unregisterNetworkCallback(mNetworkCallback)
        }
        return 3434;
    }

    private val mNetworkCallback = object : ConnectivityManager.NetworkCallback() {
        @RequiresApi(Build.VERSION_CODES.M)
        override fun onAvailable(network: Network) {
            //phone is connected to wifi network
            val connectivityManager =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            connectivityManager.bindProcessToNetwork(network)
        }
    }

    val TAG: String = "logger";

    private fun connectWifi(ssid: String, password: String): Int {

        val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager

        // Check if Wi-Fi is enabled
        if (!wifiManager.isWifiEnabled) {
            wifiManager.isWifiEnabled = true // Attempt to enable Wi-Fi
            // Optionally, handle cases where enabling fails (e.g., user permission)
        }
        if (android.os.Build.VERSION.SDK_INT >= 29) {
            // Use Wi-Fi Suggestion API (Android 10 and above)
            val specifier = WifiNetworkSpecifier.Builder()
                .setSsid(ssid)
                .setWpa2Passphrase(password) // Assuming WPA2 encryption
                .build()
            val request = NetworkRequest.Builder()
                .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
                .setNetworkSpecifier(specifier)
                .build()

            val connectivityManager =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            connectivityManager.requestNetwork(request, mNetworkCallback)

            return 123 // Return a value to indicate request sent (optional)
        } else {
            // Handle Wi-Fi connection for pre-Android 10 devices (deprecated)
            // Consider user education and alternative approaches due to deprecation
            Log.w(TAG, "Connecting to Wi-Fi programmatically for pre-Android 10 is deprecated")

            val config = WifiConfiguration()
            config.SSID = "\"" + ssid + "\""
            config.preSharedKey = "\"" + password + "\""

            val netid = wifiManager.addNetwork(config)
            wifiManager.disconnect()
            wifiManager.enableNetwork(netid, true)
            wifiManager.reconnect()

            return ssid.length // Return a value (optional, may not reflect success)
        }
    }

    @RequiresApi(Build.VERSION_CODES.Q)
    private fun connectToWifi(ssid: String, password: String): Int {
        val suggestion1 = Builder()
            .setSsid(ssid)
            .setIsAppInteractionRequired(true) // Optional (Needs location permission)
            .build();

        val suggestion2 = Builder()
            .setSsid(ssid)
            .setWpa2Passphrase(password)
            .setIsAppInteractionRequired(true) // Optional (Needs location permission)
            .build();

        val suggestion3 = Builder()
            .setSsid(ssid)
            .setWpa3Passphrase(password)
            .setIsAppInteractionRequired(true) // Optional (Needs location permission)
            .build();

//        val passpointConfig =
//            PasspointConfiguration(); // configure passpointConfig to include a valid Passpoint configuration
//        val suggestion4 = Builder()
//            .setPasspointConfig(passpointConfig)
//            .setIsAppInteractionRequired(true) // Optional (Needs location permission)
//            .build();

        val suggestionsList = listOf(suggestion1, suggestion2, suggestion3);

        val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager;

        val status = wifiManager.addNetworkSuggestions(suggestionsList);
        if (status != WifiManager.STATUS_NETWORK_SUGGESTIONS_SUCCESS) {
            // do error handling here
        }

        // Optional (Wait for post connection broadcast to one of your suggestions)
        val intentFilter = IntentFilter(WifiManager.ACTION_WIFI_NETWORK_SUGGESTION_POST_CONNECTION);

        val broadcastReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                if (!intent.action.equals(WifiManager.ACTION_WIFI_NETWORK_SUGGESTION_POST_CONNECTION)) {
                    return;
                }
                // do post connect processing here
            }
        };
        context.registerReceiver(broadcastReceiver, intentFilter);
        return 123
    }
}
