Sinatra Hello World
=
Geoffrey Harrison
Email: [Geoffrey.Harrison@lynxdigital.com.au](mailto:Geoffrey.Harrison@lynxdigital.com.au)

----------

Introduction
-
This project will deploy the Sinatra "Hello World" application from Github to a vanilla CentOS 6 minimum installation or CentOS 6 Vagrant machine. It is designed to show an array of different techniques for managing Puppet Modules.

All the code presented has been parsed successfully with 'puppet-lint'. (except 'secure' module)

The modules have been tested with:

* CentOS 6.5  (Some modules are CentOS 6 specific).
* Puppet 3.6

> A Vagrant configuration file has been provided for testing on local development workstations.

Installation
-
The project can be executed in two different ways:

1. Executed on a third party virtual machine or server
2. Executed in the provided Vagrant environment

In order to use the bootstrap script on a cleanly installed third party machine:

1. Build a Clean CentOS 6.5 minimum installation
2. Login with 'root' account configured during install and activate the network card. 
> Ensure the installation has Internet access.

3. Deploy the files to the server
4. Modify the proxy.sh file for any proxies which may be required to reach the Internet.
5. Make the deployment folder the current directory.
6. Execute "bootstrap.sh" to install puppet, the application, and secure the server installation.

To execute the vagrant environment:

1. Install Vagrant.
2. Make the project folder the current directory.
3. Modify the proxy.sh file for any proxies which may be required to reach the Internet.
3. Issue the 'vagrant up' command to build the environment on the local machine.

Once successfully complete, the Hello World application will be active and the server will be secured.

> The URL Will Be located at http://'1.2.3.4'/helloworld WHERE 1.2.3.4 is the IP address of the CentOS 6 installation
> 
> *N.B. The Default Ip Address Of The Vagrant Machine Is 192.168.58.10*

 Server Access
-
For third party machines, you can access the machine by using the provided PEM file: ssh -i PEMFILE user@1.2.3.4

For vagrant machines, you can issue the 'vagrant ssh' command to access the SSH prompt as the vagrant user. You can also access the machine by using the provided PEM file: ssh -i PEMFILE user@192.168.58.10

> N.B. Password authentication is disabled as is remote 'root' access by default.

Puppet Modules
-
The deployment uses a number of configurable, re-usable modules all linked together via a single application deployment class. Executing this class will install everything else.

> The name of the deployment class is 'ruby::app::helloWorld'.

Below is a description of each module:

* **Accounts** - Installs user groups and users. Also configures SSH key access for user accounts.
* **Apache**   - Installs and configures the base Apache web server.
* **Base**     - Links together base components which are installed to all servers.
* **Concat**   - Imported module used for concatenating files from different sources.
* **Firewall** - Builds firewall using IPTables dynamically for other modules.
* **Git** - Installs git and clones git repositories. Provides a git shortcut to Vcsrepo.
* **Ntp** - Installs ntp and configures a client by default to Internet time server.
* **Ruby** - Install ruby and passenger. Deploys ruby applications and gems.
* **Secure** - Contains security enhancements for server built from the CIS Standard For RHEL 6. Runs during puppet "post" phase. Disables insecure services, protocols, filesystems, and hardens config even if other modules have changed settings.
* **Ssh** - Install SSH server/client and configure SSH services.
* **Sudo** - Install and configure sudo. Create sudo files for individual users.
* **Timezone** - Install tzdata and configures server timezone.
* **Vcsrepo** - Imported module for handling version control systems.
* **Yum** - Install and manage yum modules on system.

