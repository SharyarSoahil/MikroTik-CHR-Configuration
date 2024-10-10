**Steps Taken to Complete This Task**

* Step 1: Setting Up MikroTik CHR on VirtualBox  
* **Download VirtualBox:** Installed VirtualBox on the local machine.  
* **Obtain CHR Image:** Downloaded the MikroTik CHR image from the official MikroTik website.  
* **Create a Virtual Machine**: Imported the CHR image into VirtualBox and configured resources like CPU, RAM, and storage.  
* Initial Setup: Configured basic settings, including IP addresses and routing to ensure connectivity to the CHR instance.

Step 2: **Configuring Firewall Rule via Winbox**

* Install Winbox: Downloaded and installed Winbox for accessing the CHR instance.  
* Connect to CHR: Connected to the MikroTik CHR instance using its IP address and credentials.  
* Create Firewall Rule: Added a new firewall rule that blocks access from any source to the destination IP address 1.1.1.1 on TCP port 443.  
* Save Configuration: Captured a screenshot of the firewall rule and saved it as Firewall.png.

Step 3: **Setting Up Ansible for RADIUS Configuration**  
Install Ansible: Set up Ansible on the local machine.  
Copy code  
sudo apt update  
sudo apt install ansible

Create Playbook: Created a new Ansible playbook named RADIUS.yml to configure the RADIUS client on the MikroTik CHR. The playbook included the following task:

Adding a RADIUS client with server IP: 35.227.71.209, secret key: testing123, and service type: hotspot.

Create Hosts File: Created a hosts file named hosts with the MikroTik CHR details.

\[mikrotik\]  
192.168.100.84 ansible\_user=admin ansible\_password=1122 ansible\_connection=network\_cli ansible\_network\_os=routeros

Execute Playbook: Ran the playbook using the command:

ansible-playbook \-i hosts RADIUS.yml

Capture Output: Captured a screenshot of the Ansible output showing successful execution and saved it as Ansible.png.

**Challenges Encountered**

* **Working with Ansible for the First Time**: This was my first experience working with Ansible, and I faced several initial issues. Setting up the playbook and understanding how Ansible interacts with MikroTik required some research and troubleshooting.  
* **Community MikroTik Repository Not Available**: One major issue was that the community.mikrotik Ansible collection repository was not readily available. This caused the RADIUS.yml playbook to fail in communicating with the MikroTik router. Despite trying multiple installation methods, I could not get the collection to work as expected. The screenshot in the Screenshots folder captures the error encountered during this process.  
* **Firewall Configuration Conflicts**: The initial firewall rule conflicted with the default configuration. This was resolved by changing rule priorities and ensuring the correct source/destination IP and ports were used.  
* **Network Interface Configuration**: Setting up and testing the second interface in VirtualBox required adjusting network adapter settings and ensuring compatibility with MikroTik.

**References and Resources**

* **MikroTik CHR Documentation**: This documentation provides detailed instructions and guidelines on setting up and configuring MikroTik CHR.  
  * MikroTik CHR Documentation  
* **Ansible Documentation for Network Modules**: The official Ansible documentation offers comprehensive information on using various network modules, including those for MikroTik.  
  * Ansible Network Modules Documentation  
* **VirtualBox User Manual**: This manual contains all the necessary information for installing and configuring VirtualBox, as well as managing virtual machines.  
  * VirtualBox User Manual  
* **MikroTik Community Forums**: A valuable resource for troubleshooting, configuration tips, and discussions related to MikroTik products.  
  * MikroTik Community Forums  
* **Ansible YouTube Tutorials**: A collection of video tutorials that provide visual guides on using Ansible for various tasks, including network configurations.  
  * [Ansible YouTube Tutorials](https://www.youtube.com/results?search_query=ansible+tutorial)

**Ubiquiti Hotspot Configuration**

Steps to Configure Captive Portal:

1. **Access the UniFi Controller**:  
   * Log in to your Ubiquiti UniFi Network Controller through your web browser.  
2. **Navigate to Settings**:  
   * Click on the **Settings** gear icon in the bottom left corner of the dashboard.  
3. **Create a New WiFi Network**:  
   * Under the **WiFi** section, click on **Create New WiFi Network**.  
   * Set the **Name** for the WiFi network (e.g., "WiFi").  
4. **Enable Hotspot**:  
   * Click on **Advanced Options** and toggle the **Enable Hotspot** option to "ON."  
5. **Configure the Landing Page**:  
   * Go to the **Insights** section, select **Hotspot**, and then navigate to the **Landing Page** option.  
6. **Set Up Authentication**:  
   * Click on **Authentication** and enable **External Portal Server**.  
   * Enter the **IP Address** of the external portal server.  
7. **Save Settings**:  
   * After configuring the hotspot, click on **Save Settings**.  
8. **Adjust Security Options**:  
   * Go back to **Settings**, uncheck **Encrypted URL**, and check the **Domain** and **Secure Portal** options.  
   * Click on **Save Settings** again to apply these changes.  
9. **Test Configuration**:  
   * Connect to the guest network and verify that the captive portal appears as expected.

