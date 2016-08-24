This folder contains the install packages of the OTAWA framework including the MKFFX and OSWA tool (see ../source).
	
Content:
*) otawa-armv7_0.1ubuntu-1_amd64.deb
	Debian package (created 04/2016 with Ubuntu 14.04.2 LTS)
	Install: $ sudo dpkg -i otawa-armv7_0.1ubuntu-1_amd64.deb

*) otawa-armv7-0.1fedora-1.x86_64.rpm
	RPM package (created 05/2016 with Fedora 22)
	Install: $ su
			 $ rpm -i otawa-armv7-0.1fedora-1.x86_64.rpm 

*) otawa-armv7-0.1osx-1_x86_64.pkg
	OS X install package (created 06/2016 with OS X 10.11.5)
	Install: run package
	
*) OSWAPlugin_1.0.0.201608.jar
	WCET Analysis Eclipse Plugin (Interface to OSWA and MKFFX) 
	Install: 
	1) install OTAWA (oswa and mkffx tool required!)
	2) copy OSWAPlugin*.jar to eclipse/dropins folder
	3) start eclipse
	4) open menu: "Window" -> "Show View" -> "Other..."; select "WCET Plugin (OSWA)" -> "WCET Analysis" and click OK
	5) open menu: "Window" -> "Show View" -> "Other..."; select "General" -> "Console" and click OK