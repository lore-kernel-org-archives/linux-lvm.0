Message-ID: <31A612FE6020D2119F6400A0C9B67EBB0381B06A@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: RE: [linux-lvm] Can't locate modules when running vgscan
Date: Mon, 3 Apr 2000 12:34:11 +0200 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> -----Original Message-----
> From: Heinz Mauelshagen [mailto:mauelsha@ez-darmstadt.telekom.de]
> Sent: Saturday, April 01, 2000 12:34 AM
> To: cshelton@indiana.edu
> Cc: mge@ez-darmstadt.telekom.de; linux-lvm@msede.com
> Subject: Re: [linux-lvm] Can't locate modules when running vgscan
> 
> 
> 
> Because the LVM library scans for a bunch of devices heading 
> to find disks,
> the module loader tries to load the corresponding modules in 
> case the drivers
> for these devices dont exist in the kernel.
> 
> In your case block-major-48 for eg. corresponds to the Mylex 
> DAC960 driver
> which you probably dont have in your system.
> 
> Basically you can either just ignore these messages _or_
> you can change /etc/conf.modules (or /etc/modules.conf) and
> set the value in the last field to "off" to avoid them.

This needs a lot time too, if you have a lot of modules configured in the
kernel. A faster way is:
	cd /sbin && mv modprobe modprobe.old && ln -s /bin/false modprobe
But you should know what you are doing ....



Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 21F
