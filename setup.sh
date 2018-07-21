########################################################
# create a file /usr/bin/tunnel_shell
########################################################
#!/bin/bash
trap '' 2 20 24
clear
echo -e "Remote Network Connection Socks Proxy Gateway tunnel started, shell disabled by the system administrator"
while [ true ] ; do
sleep 10
done
exit 0

########################################################
# creat a group called tunnel_group
########################################################
groupadd tunnel_group

########################################################
# add user
########################################################
useradd -M -G tunnel_group -s /usr/bin/tunnel_shell tunnel_user

########################################################
# set user password
########################################################
passwd tunnel_user

########################################################
# add to /etc/ssh/sshd_config
########################################################
Match Group tunnel_group
   AllowTcpForwarding yes
   #X11Forwarding no
   PermitTunnel yes
   GatewayPorts yes
   AllowAgentForwarding yes
   PermitOpen localhost: 1080
   ForceCommand echo 'This account can only be used for Remote Network Connection Socks Proxy Gateway and has be restricted accordingly'

########################################################
# connect
########################################################
ssh <Remote Network Connection Socks Proxy Gateway> -l tunnel_user -i <private_key> -D localhost:12345

