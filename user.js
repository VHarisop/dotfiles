# Mozilla Custom User Preferences

/* User preferences file with some custom options to better
 * safeguard your privacy. 
 * Based on:
 * [0] https://skytal.es/ 
 * [1] https://www.ghacks.net/2015/08/18/a-comprehensive-list-of-firefox-privacy-and-security-settings/
 */

/* Disable sending additional analytics to web servers */
user_pref("beacon.enabled", false);

/* Disable WebIDE to prevent remote debugging/ addon downloads */
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters");
user_pref("devtools.webide.enabled", false);
user_pref("devtools.debugger.remote-enabled");

/* Disable browser access to the clipboard */
user_pref("dom.event.clipboardevents.enabled", false);

/* Disable geolocation tracking */
user_pref("geo.enabled", false);
user_pref("geo.wifi.logging.enabled", false);
user_pref("geo.wifi.uri", "http://127.0.0.1");

/* Disable WebRTC */
user_pref("media.peerconnection.enabled", false);

/* Enable ssl pipelining and disable spdy */
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.spdy.enabled", false);
user_pref("network.http.spdy.enabled.v3-1", false);

/* Disable dns and address prefetching */
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("security.OCSP.require", true);

