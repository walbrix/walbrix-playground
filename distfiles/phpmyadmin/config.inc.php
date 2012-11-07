<?php
// from http://labs.unoh.net/2009/03/ip.html
function inCIDR($cidr) {
    $ip = $_SERVER['REMOTE_ADDR'];
    list($network, $mask_bit_len) = explode('/', $cidr);
    $host = 32 - $mask_bit_len;
    $net = ip2long($network) >> $host << $host; // 11000000101010000000000000000000
    $ip_net = ip2long($ip) >> $host << $host; // 11000000101010000000000000000000
    return $net === $ip_net;
}
                    
$private_access = (inCIDR("192.168.0.0/16") or inCIDR("172.16.0.0/12") or inCIDR("10.0.0.0/8"));
if ($private_access) {
    $cfg['Servers'][1]['AllowNoPassword'] = true;
}
?>
