From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003312234.AAA25470@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Can't locate modules when running vgscan
In-Reply-To: <Pine.HPP.3.96.1000330171141.7850C-100000@othello.ucs.indiana.edu> from Chris Shelton at "Mar 30, 2000  5:20: 4 pm"
Date: Sat, 1 Apr 2000 00:34:10 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Shelton <cshelton@indiana.edu>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Because the LVM library scans for a bunch of devices heading to find disks,
the module loader tries to load the corresponding modules in case the drivers
for these devices dont exist in the kernel.

In your case block-major-48 for eg. corresponds to the Mylex DAC960 driver
which you probably dont have in your system.

Basically you can either just ignore these messages _or_
you can change /etc/conf.modules (or /etc/modules.conf) and
set the value in the last field to "off" to avoid them.

Heinz

> I've recently started using the LVM software on one of my systems, and
> I've noticed that there are numerous messages are produced each time I run
> vgscan:
> 
> Mar 30 13:50:19 fmslan kernel: LVM version 0.8i  by Heinz Mauelshagen
> (02/10/1999) 
> Mar 30 13:50:19 fmslan kernel: lvm -- Module successfully initialized 
> Mar 30 13:50:20 fmslan modprobe: can't locate module block-major-48
> Mar 30 13:50:22 fmslan last message repeated 63 times
> Mar 30 13:50:22 fmslan modprobe: can't locate module block-major-49
> Mar 30 13:50:23 fmslan last message repeated 63 times
> Mar 30 13:50:27 fmslan kernel: cdrom: open failed. 
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-33
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-33
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-34
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-34
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-7
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-7
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-9
> Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-9
> 
> I've added these two lines to my /etc/modules.conf:
> alias block-major-58      lvm
> alias char-major-109      lvm
> 
> The system is running kernel version 2.2.14, with version 0.8i of the LVM
> patch.  
> 
> The filesystem created in the logical volume I have created seems to work
> just fine, but I've not sure if I've missed something in the setup that is
> causing these messages to appear.
> 
> Chris Shelton
> 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
