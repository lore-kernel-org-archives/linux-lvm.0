From: Sebastian Beneke <sebastian@beneke-it.de>
Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working
 anymore
Message-Id: <20031107193938.5a03fad3.sebastian@beneke-it.de>
In-Reply-To: <20031103110555.E1850@sistina.com>
References: <20031101142538.34423cb0.sebastian@beneke-it.de>
	<20031103110555.E1850@sistina.com>
Mime-Version: 1.0
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
Date: Fri Nov  7 12:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, 3 Nov 2003 11:05:55 +0100
"Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:

>=20
> Sebastian,
>=20
> you either want to use LVM2/device-mapper and try the "vgchange -P
> ..." option to activate partially available VGs

Heinz,

thanks a lot for your respond. Because I can't compile device-mapper
on the fileserver I decided to move the specific disk to another
machine. Here I compiled a 2.4.21 Kernel with device-mapper and lvm2
and connected the disk as /dev/hdc (same as before). Then I copyed all
the files from /etc/lvmconf and /etc/lvmtab.d to the other machine.

Next I loaded dm-mod (compiled device-mapper as a module).

pvscan found the pv:

***
scratchy:/home/basti# pvscan
  1 PV(s) found for VG storage: expected 2
  Logical volume (stor1) contains an incomplete mapping table.
  PV /dev/hdc    is in exported VG storage [114,44 GB / 0    free]
  Total: 1 [0   ] / in use: 1 [0   ] / in no VG: 0 [0   ]
***

so far so good, but then vgchange gave me these errors:

***
scratchy:/dev/mapper# vgchange -P -ay storage
  Partial mode. Incomplete volume groups will be activated read-only.
  1 PV(s) found for VG storage: expected 2
  Logical volume (stor1) contains an incomplete mapping table.
  1 PV(s) found for VG storage: expected 2
  Logical volume (stor1) contains an incomplete mapping table.
  device-mapper ioctl cmd 9 failed: Das Argument ist ung=FCltig   <=3D=3D=
=3D=3D=20
  Couldn't load device 'storage-stor1'.  1 logical volume(s) in volume
group "storage" now active
***

in /dev/mapper I found these files / devices:

***
scratchy:/dev/mapper# l
insgesamt 28
drwxr-xr-x    2 root     root         4096  7. Nov 19:30 ./
drwxr-xr-x   11 root     root        24576  7. Nov 18:49 ../
crw-------    1 root     root      10,  63  7. Nov 18:02 control
brw-------    1 root     root     254,   0  7. Nov 19:30 storage-stor1
***

as you can see storage-stor1 is 0 bytes - so it didn't work.

As well I tried your LVM-1 workaround on the other machine, didn't
work as well :-(

Here is some more info on the PV:

***
scratchy:/dev/mapper# pvdisplay --verbose
    Scanning for physical volume names
  1 PV(s) found for VG storage: expected 2
  Logical volume (stor1) contains an incomplete mapping table.
  Physical volume "/dev/hdc" of volume group "storage" is exported
  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               storage (exported)
  PV Size               114,50 GB / not usable 62,94 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3662
  Free PE               0
  Allocated PE          3662
  PV UUID               woPtjg-SME7-mnSd-GaZd-f3C7-RwtW-4I4WKs
***

As I told the list in another mail, I killed the missing second PV
with a 1 byte (?) dd and created a new VG on it. So I think the data
is still there. Heinz, do you see any way for recreating the original
header(?)-lvm information with a hex editor or something on the
second PV? Maybe this could help me.

I hope anyone can help me out here :-(


Best Regards
Sebastian
