# Task 6.1 Networking with Linux  

  1. Testing virtual network was configured as shown on the figure 1:  
  ![Screen1](./task_images/Screenshot_1.png)  

  2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).  
    1. **VM1:**  
     - second network card was added via Virtualbox Management Console:  
     ![Screen2](./task_images/Screenshot_2.png)  
     - Check a name given to added network interface:  
     ![Screen3](./task_images/Screenshot_3.png)  
     - ... and enabling interface:  
     ![Screen4](./task_images/Screenshot_4.png)  
     - Configuring a network interfaces via netplan settings config file:  
     ![Screen5](./task_images/Screenshot_5.png)  
     **sudo netplan apply** then.  
     - Network interfaces configuration now:  
     ![Screen6](./task_images/Screenshot_6.png)  
     - Configuration of firewall:  
         _Cleaning all chains and removing rules:_  
         **iptables -F**  
         **iptables -F -t nat**  
         **iptables -F -t mangle**  
         **iptables -X**  
         **iptables -t nat -X**  
         **iptables -t mangle -X**  
         _Permiting of inbound traffic to loopback interface:_  
         **iptables -A INPUT -i lo -j ACCEPT**  
         _Accept all traffic from internal network on internal interface:_  
         **iptables -A INPUT -i enp0s8 -s 172.16.0.0/24 -j ACCEPT**  
         _Accepting ping (two most safety types):_  
         **iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT**  
         **iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT**  
         _Allow internal connections, which where permitted earlier:_  
         **iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT**  
         _Accepting traffic forwarding as well for new and current connections:_  
         **iptables -A FORWARD -i enp0s8 -o enp0s3 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT**  
         _Accepting forwarding from external network to internal only for packets, which are a part of existing connections:_  
         **iptables -A FORWARD -i enp0s3 -o enp0s8 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT**  
         _Make an adresses translation for IPs, which belong to local network:_  
         **iptables -t nat -A POSTROUTING -o enp0s3 -s 172.16.0.0/24 -j MASQUERADE**  
         _Configuring default policies:_  
         **iptables -P INPUT DROP**  
         **iptables -P FORWARD DROP**  
         **iptables -P OUTPUT ACCEPT**  
      Result config:  
      ![Screen7](./task_images/Screenshot_7.png)  
      - Also enebled IPv4 forwarding in **/etc/sysctl.conf**:  
      ![Screen8](./task_images/Screenshot_8.png)  
    2. **VM2:**  
     - Configuring a network interface via netplan settings config file:  
     ![Screen9](./task_images/Screenshot_9.png)  
     **sudo netplan apply** then.  
     - Result network interfaces configuration:  
     ![Screen10](./task_images/Screenshot_10.png)  

  3. Check the route from VM2 to Host:  
  ![Screen11](./task_images/Screenshot_11.png)  

  4. Check the access to the Internet, (just ping, for example, 8.8.8.8).  
  ![Screen12](./task_images/Screenshot_12.png)  

  5. Determine, which resource has an IP address 8.8.8.8.  
  Changing netplan config to add nameservers:  
  ![Screen13](./task_images/Screenshot_13.png)  
  With command **host** possible to determine, that IP 8.8.8.8 8.8 belongs to public DNS service provided by Google:  
  ![Screen14](./task_images/Screenshot_14.png)  

  6. Determine, which IP address belongs to resource epam.com.  
  Using **nslookup** command:  
  ![Screen15](./task_images/Screenshot_15.png)  

  7. Determine the default gateway for your HOST and display routing table.  
  **mtr google.com**:  
  ![Screen16](./task_images/Screenshot_16.png)  
  VM2 routing table:  
  ![Screen17](./task_images/Screenshot_17.png)  
  VM1 routing table:  
  ![Screen18](./task_images/Screenshot_18.png)  
  Host's routing table:  
  ![Screen19](./task_images/Screenshot_19.png)  

  8. Trace the route to google.com:  
  ![Screen20](./task_images/Screenshot_20.png)  
  ![Screen19](./task_images/Screenshot_21.png)  
