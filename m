From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Setup for RAID1 with LVM
Message-ID: <20011117155519.C27459@tiger.bigcats.invalid>
References: <"Csuk, <5E34D857F6BB704CA3369B7553233A81651A7E@ntsviemxs0152.connect.at-work.ent> <ufay9l8hv5v.fsf@epithumia.math.uh.edu> <3.0.6.32.20011115134027.00a7c100@mail.doorpi.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3.0.6.32.20011115134027.00a7c100@mail.doorpi.net>; from bharding@doorpi.net on Thu, Nov 15, 2001 at 01:40:27PM -0600
Content-Transfer-Encoding: quoted-printable
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
Date: Sat Nov 17 09:04:06 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi, Brent!

Brent Harding (bharding@doorpi.net) wrote 34 lines:
> >>>>>> "FC" =3D=3D Ferenc Csuk <Csuk> writes:

> >FC> [...]  when we start pvcreate /dev/md0 we get the following error:
> >FC> invalid partition type 0x83 for /dev/md0" (must be
> >FC> 0x8e). Unfortunatelly we can=B4t change it using fdisk.

> >For whole disk devices only the partition table must be erased, which

> Can it be done to just a partition? I suppose raid devices are consider=
ed
> whole disks no matter what portion of various partitions they take up.

Yep, to the kernel a RAID looks like a complete HD.

83 is, BTW, the standard partition type for Linux, while fd
is the Linux auto raid (automatically Kernel-mounted RAID)

I guess you can simply erase the beginning of the RAID
(/dev/md0) or even make partitions on the RAID -- but I don't
know why you'd want that when you're going with LVM anyway.

-Wolfgang
