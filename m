Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1C2JK125771
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2006 21:19:20 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1C2JKE8022324
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2006 21:19:20 -0500
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] missing device nodes for vg, but vg appears in scan
Date: Sat, 11 Feb 2006 20:19:15 -0600
References: <200601221454.10959.gmishkin@acs.bu.edu>
In-Reply-To: <200601221454.10959.gmishkin@acs.bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602112019.16075.krakrjak@volumehost.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: gmishkin@bu.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Sunday 22 January 2006 13:53, Geoff Mishkin wrote:
> I am using lvm2 2.01.09 on Gentoo Linux.  My kernel version is 2.6.15 and
> I'm using udev 079.
I'm running 2.6.15 also using lvm
> I am trying to set up an LVM2 VG using a loop device.  My problem is that
> device nodes are never created for my VG.  However, my VG shows up in scans
> (vgscan) and displays (vgdisplay).  Even vgscan --mknodes does not make the
> nodes.  Because I never get a node for my VG, I can't figure out how I am
> supposed to create LV's in it.
First make sure that /etc/lvm/lvm.conf is not filtering out /dev/loop/ 
devices.  Based on the ouput you gave from pvcreate I guess that it isn't, 
but you should double check anyway.  Also read through the options in that 
file one might jump out at you.

> I have the modules loop, dm-mod and dm-snapshot loaded.  Therefore, I do
> have /dev/mapper/control.  Here is what I have done so far:
dm-mod is the only required module.  Well and loop for your set up.

> It looks like my VG is there, but it still isn't showing up in /dev.  I
> read something about how if udev isn't configured properly, you will get
> devices like /dev/dm-# where # is 0-9, instead of named VG nodes.  I don't
> have those either, but I follow the instructions which are to uncomment a
> line in my udev rules:
>
> KERNEL=="dm-[0-9]*",    PROGRAM="/sbin/devmap_name %M %m", NAME="%k",
> SYMLINK+="%c"
I looked at my /etc/udev/rules.d/50-udev.rules and I have the following:
# dm devices (ignore them)
KERNEL=="dm-[0-9]*",    OPTIONS="ignore_device"
# create a symlink named after the device map name
# note devmap_name comes with extras/multipath
#KERNEL=="dm-[0-9]*",   PROGRAM="/sbin/devmap_name %M %m", NAME="%k", 
SYMLINK+="%c"
KERNEL=="device-mapper",        NAME="mapper/control"

I'm just not sure why they aren't getting created.  Even without vgscan you 
should get the devices if you are using udev.  Maybe you upgraded udev and 
zapped the new rules during and etc-update or dispatchconf.
-- 
Zac Slade
