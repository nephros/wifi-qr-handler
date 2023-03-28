#!/bin/sh

service="com.jolla.settings"
path="/com/jolla/settings/ui"
iface="com.jolla.settings.ui"
method=showAddNetworkDialogFromQR

options='wifi:S:MY-Access-Point;T:WPA2-EAP;P:AVerySecretPassword;H:false;I:my-identity;A:anon-identity;PH2:MSCHAPv2;;'

echo busctl call $service $path $iface ${method} "s" "$options"
busctl --user call $service $path $iface ${method} "s" "$options"


