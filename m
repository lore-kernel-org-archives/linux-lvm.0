Subject: Re: [linux-lvm] mount root filesystem on lvm
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <3EBE8FCC.10302@inode.at>
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>
	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>
	 <3EBD22B3.4090808@inode.at>
	 <1052607008.1489.2.camel@chtephan.cs.pocnet.net>
	 <3EBDAFF0.5090608@inode.at> <1052647076.580.9.camel@chtephan.cs.pocnet.net>
	  <3EBE8FCC.10302@inode.at>
Message-Id: <1052680419.1131.8.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun May 11 14:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Manfred Gschweidl <m.gschweidl@inode.at>
Cc: linux-lvm@sistina.com

Am Son, 2003-05-11 um 20.00 schrieb Manfred Gschweidl:

> but now i have an problem... ;-)
> 
> when booting up with the initial ramdisk, and doing a "lvm vgscan" and 
> "lvm vgchange -a y", all volume groups and logical volumes are found 
> ("ls /dev/mapper" on the end of the linuxrc script shows all found 
> logical volumes).
> but after freeing memory of the initial ramdisk and mounting of the root 
> fs, now one of the entries in "/dev/mapper" exists, except the "control" 
> entry. and "lvm vgscan" and "lvm vgchange -a y" does not help. so i 
> cannot mount any other logical volumes?????
> the kernel complaines, that maybe a old kernel driver is using the 
> volume groups, but how can that be???

When nobody created the /dev/control/mapper device on your root file
system, it simply isn't there. ;-)

If you create it once it will stay there. "mknod /dev/mapper/control c
10 63" (or whatever the minor is, see cat /proc/misc)

My linuxrc script creates this dynamically in the ramdisk based on
/proc, but later you'll also need it on the root filesystem. Usually it
is not necessary to do it on every reboot, because the filesystems isn't
deleted between reboots, so creating it once should do it. You also
shouldn't need to run a vgscan in the boot scripts because the known
volume groups are cached in /etc between reboots, you can run it
manually if something changes. Creating /dev/mapper/control once and
adding vgchange -a y to the init scripts is ok.

> cat /proc/devices show up, that there is still an entry for lvm, but 
> also for device-mappper. is this maybe the error???

No, I think they should coexist nicely.

-- 
Christophe Saout <christophe@saout.de>
