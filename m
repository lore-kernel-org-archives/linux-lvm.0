Message-Id: <199911152359.AA04179@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvcreate_initrd & redhat 6.1
Date: Tue, 16 Nov 1999 0:54:36 MET
In-Reply-To: <8525682A.0078290B.00@fund-dc2.txfund.com>; from "Jonathan S. Polacheck" at Nov 15, 99 4:53 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jonathan S. Polacheck" <JPolache@txfund.com>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Got lvm running on at RH 6.1 after patching a 2.2.10 kernal.  All looking
> very good. However, when I ran lvcreate_initrd, it errored out;
> 
> [root@l61 tools]# ./lvmcreate_initrd
> 
> Logical Volume Manager 0.7 by Heinz Mauelshagen  01/07/1999
> 
> lvmcreate_initrd -- this script creates a LVM initial ram disk in
> /boot/initrd.z
> 
> lvmcreate_initrd -- making ram filesystem
> lvmcreate_initrd -- ERROR making ram disk filesystem

Looks like you didn't configure your kernel to support ramdisks.
If you do configure it, don't forget to add initial ramdisk support too.

> 
> Also, any suggestions as to where to put the "vgscan" and "vgchange -a y"
> on this system.  It uses the "Sys V" rc.d setup (no /sbin/init.d/boot
> file).
> 

I'm not used to RedHat but have a look at your /etc/inittab and figure out
what is started at boottime by looking for entries with field 3 containing
"boot" or "bootwait".
Put in vgscan and vgchange into the script started by these
(after root has been mounted rw).

Another solution is (if you want to set up an initrd system with root contained
in an LV anyway) to avoid vgscan and vgchange in the boot script by just
copying the /dev/VolumeGroup/* special files from your initial ramdisk
to your LV based root filesystem.

Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
