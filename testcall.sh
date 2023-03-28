#!/bin/sh

service="com.jolla.settings"
path="/com/jolla/settings/ui"
iface="com.jolla.settings.ui"
method=showAddNetworkDialogFromQR
#method=.showPage
#page=/usr/share/jolla-settings/pages/wlan/AddNetworkDialog.qml
page=/usr/share/jolla-settings/pages/wlan/mainpage.qml
# typedCall("showPage", { "type": "s", "value": "system_settings/look_and_feel/ambiences" },
#options="'s' 'system_settings/connectivity/wlan'"
#    { showAddNetworkDialog: true }"
#options='"s" wifi:S:WLAN-D4N5J5;T:WPA;P:3070807646888688;H:false;;'
options='wifi:S:WLAN-D4N5J5;T:WPA;P:3070807646888688;H:false;;'

#busctl introspect $service $path
#busctl --user introspect $service $path $iface #.showPage 
#busctl call $service $path $iface .showPage $page $options

echo busctl call $service $path $iface ${interface}${method} "s" "$options"
busctl --user call $service $path $iface ${interface}${method} "s" "$options"

#method=showAddNetworkDialog
#options=""
#echo busctl call $service $path $iface ${interface}${method} "$options"
#busctl --user call $service $path $iface ${interface}${method} "$options"

