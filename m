From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working anymore
Message-ID: <20031110110403.E28265@sistina.com>
References: <20031101142538.34423cb0.sebastian@beneke-it.de> <20031103110555.E1850@sistina.com> <20031107193938.5a03fad3.sebastian@beneke-it.de>
Mime-Version: 1.0
In-Reply-To: <20031107193938.5a03fad3.sebastian@beneke-it.de>; from sebastian@beneke-it.de on Fri, Nov 07, 2003 at 07:39:38PM +0100
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
Date: Mon Nov 10 04:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Nov 07, 2003 at 07:39:38PM +0100, Sebastian Beneke wrote:
> On Mon, 3 Nov 2003 11:05:55 +0100
> "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
>=20
> >=20
> > Sebastian,
> >=20
> > you either want to use LVM2/device-mapper and try the "vgchange -P
> > ..." option to activate partially available VGs
>=20
> Heinz,
>=20
> thanks a lot for your respond. Because I can't compile device-mapper
> on the fileserver I decided to move the specific disk to another
> machine. Here I compiled a 2.4.21 Kernel with device-mapper and lvm2
> and connected the disk as /dev/hdc (same as before). Then I copyed all
> the files from /etc/lvmconf and /etc/lvmtab.d to the other machine.
>=20
> Next I loaded dm-mod (compiled device-mapper as a module).
>=20
> pvscan found the pv:
>=20
> ***
> scratchy:/home/basti# pvscan
>   1 PV(s) found for VG storage: expected 2
>   Logical volume (stor1) contains an incomplete mapping table.
>   PV /dev/hdc    is in exported VG storage [114,44 GB / 0    free]
>   Total: 1 [0   ] / in use: 1 [0   ] / in no VG: 0 [0   ]
> ***
>=20
> so far so good, but then vgchange gave me these errors:
>=20
> ***
> scratchy:/dev/mapper# vgchange -P -ay storage
>   Partial mode. Incomplete volume groups will be activated read-only.
>   1 PV(s) found for VG storage: expected 2
>   Logical volume (stor1) contains an incomplete mapping table.
>   1 PV(s) found for VG storage: expected 2
>   Logical volume (stor1) contains an incomplete mapping table.
>   device-mapper ioctl cmd 9 failed: Das Argument ist ung=FCltig   <=3D=3D=
=3D=3D=20
>   Couldn't load device 'storage-stor1'.  1 logical volume(s) in volume
> group "storage" now active
> ***
>=20
> in /dev/mapper I found these files / devices:
>=20
> ***
> scratchy:/dev/mapper# l
> insgesamt 28
> drwxr-xr-x    2 root     root         4096  7. Nov 19:30 ./
> drwxr-xr-x   11 root     root        24576  7. Nov 18:49 ../
> crw-------    1 root     root      10,  63  7. Nov 18:02 control
> brw-------    1 root     root     254,   0  7. Nov 19:30 storage-stor1
> ***
>=20
> as you can see storage-stor1 is 0 bytes - so it didn't work.

This is a missinterpreation.
storage-stor1 is a device special file with major 254 and minor 0.

Just use it and try if you can copy data off the partially accessible
logical volume.
Try to mount the filesystem in /dev/storage/stor1 (this symbolic link
should exist and point to /dev/mapper/storage-stor1) readonly.


>=20
> As well I tried your LVM-1 workaround on the other machine, didn't
> work as well :-(
>=20
> Here is some more info on the PV:
>=20
> ***
> scratchy:/dev/mapper# pvdisplay --verbose
>     Scanning for physical volume names
>   1 PV(s) found for VG storage: expected 2
>   Logical volume (stor1) contains an incomplete mapping table.
>   Physical volume "/dev/hdc" of volume group "storage" is exported
>   --- Physical volume ---
>   PV Name               /dev/hdc
>   VG Name               storage (exported)
>   PV Size               114,50 GB / not usable 62,94 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       32768
>   Total PE              3662
>   Free PE               0
>   Allocated PE          3662
>   PV UUID               woPtjg-SME7-mnSd-GaZd-f3C7-RwtW-4I4WKs
> ***
>=20
> As I told the list in another mail, I killed the missing second PV
> with a 1 byte (?) dd and created a new VG on it. So I think the data
> is still there. Heinz, do you see any way for recreating the original
> header(?)-lvm information with a hex editor or something on the
> second PV? Maybe this could help me.

Presumably you have the metadata archives in /etc/lvmconf/ preserved,
pvcreate the PV and vgcfgrestore the metadata to it.

>=20
> I hope anyone can help me out here :-(
>=20
>=20
> Best Regards
> Sebastian
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Regards,
Heinz    -- The LVM Guy --


*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
