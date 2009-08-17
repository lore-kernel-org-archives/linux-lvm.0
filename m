Received: from alatyr.englab.brq.redhat.com (alatyr.englab.brq.redhat.com
	[10.34.33.30])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n7H8loIh014349
	for <linux-lvm@redhat.com>; Mon, 17 Aug 2009 04:47:50 -0400
Message-ID: <4A89196E.6020509@redhat.com>
Date: Mon, 17 Aug 2009 10:48:46 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /dev/dm-* or /dev/mapper/*
References: <1250467733.18434.1330126635@webmail.messagingengine.com>
In-Reply-To: <1250467733.18434.1330126635@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/17/2009 02:08 AM, Edward Siefker wrote:
> I originally set up raid-luks-lvm on this machine with debian's
> installer tool, now I am trying to add another encrypted raid1 device to
> the existing volume group.  I already have the raid device set up and
> encrypted, that's no problem.  Now the linux gazette
> (http://linuxgazette.net/140/pfeiffer.html) tells me I should run
> 'pvcreate' on the device in /dev/mapper.  However, if I examine my
> existing physical volumes with 'pvscan' I get the following:
> 
> iblis:/home/hatta# pvscan
>   PV /dev/dm-0   VG iblis-volumes   lvm2 [931.32 GB / 0    free]
>   Total: 1 [931.32 GB] / in use: 1 [931.32 GB] / in no VG: 0 [0   ]

Which version of libdevmapper/dmsetup do you use?

> Apparently I am using /dev/dm-0 instead of /dev/mapper/md1_crypt. I
> wondered if these were maybe two names for the same thing, so I checked
> ls:
> 
> iblis:/home/hatta# ls -ld /dev/dm-0 /dev/mapper/md1_crypt
> brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/dm-0
> brw-rw---- 1 root disk 253, 0 2009-08-16 12:02 /dev/mapper/md1_crypt
> 
> Same major and minor number, if that means anything.

Well, from functional point of view they are same - they point to the
same device, of course. But dmsetup/lvm itself does not create the
/dev/dm-X nodes - the ones in /dev/mapper are the right and official
ones that should always be used.

The /dev/dm-X nodes are created by some general udev rules, dm-X is
only internal kernel name for that device and you can't rely on those
names (because the number X that is assigned is not stable and could
be changed - it depends on the sequence of device activation).

> iblis:/home/hatta# dmsetup info /dev/dm-0
> Device /dev/dm-0 not found
> Command failed

..just forget that /dev/dm-X exists :) The thing is that these nodes
shouldn't be there with recent versions of libdevmapper/dmsetup used
in all distros..


HOWEVER, there has been some work done on udev support in LVM upstream
lately (version 2.02.51, which also includes dmsetup/libdevmapper).
Also, new udev rules have been added to support device mapper devices.
When this udev support is enabled (it's still disabled by default
though), the /dev/dm-X nodes are created directly by device-mapper
rules, then /dev/mapper/ symlinks that point to /dev/dm-X
(and /dev/<vgname>/<lvname> symlinks that point to /dev/dm-X
as well for LVM devices). The reason for doing so is that creating
nodes root /dev directory is considered to be the "standard way".
Nevertheless, you should always use /dev/mapper!

> iblis:/home/hatta# dmsetup info /dev/mapper/md1_crypt 
> Name:              md1_crypt
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        7
> Event number:      0
> Major, minor:      253, 0
> Number of targets: 1
> 
> 
> It works on one, and not the other.  So they're not the same thing.  My
> new device 'md2_crypt' corresponds to /dev/dm-8, if I am to trust the
> major/minor numbers. Should I run pvcreate on /dev/dm-8 or
> /dev/mapper/md2_crypt?

Alays use /dev/mapper. This is the only reliable way :)

Peter
