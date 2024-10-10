# 2024-10-10 18:35:03 by RouterOS 7.16
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full name=LAN
/ip pool
add name=dhcp_pool0 ranges=\
    192.168.100.1-192.168.100.89,192.168.100.91-192.168.100.254
/user-manager limitation
add name="100 GB" rate-limit-min-rx=8000000B rate-limit-min-tx=8000000B \
    rate-limit-rx=10000000B rate-limit-tx=10000000B
/user-manager profile
add name="Test user" name-for-users="Test user" validity=unlimited
/user-manager user
add name=Sharyar
/ip dhcp-client
add interface=LAN
/ip dhcp-server
add address-pool=dhcp_pool0 interface=LAN name=dhcp1
/ip dhcp-server network
add address=192.168.100.0/24 gateway=192.168.100.90
/ip dns
set servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=drop chain=forward dst-address=1.1.1.1 dst-port=443 log=yes \
    protocol=tcp
/radius
add address=35.227.71.209 service=hotspot
/radius incoming
set accept=yes
/system note
set show-at-login=no
/user-manager
set certificate=*0 enabled=yes
/user-manager profile-limitation
add limitation="100 GB" profile="Test user"
/user-manager router
add address=35.227.71.209 name="Mirkrotik OS"
/user-manager user-profile
add profile="Test user" user=Sharyar
