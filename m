From: nik-da-3'9'' <nik39@gmx.net>
Message-ID: <3051931894.20030110143835@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Volume Group with 4 HDs- one crashed
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
Date: Fri Jan 10 07:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello ,

I'm having a hard time with LVM, in my PC I have setup a VG with 4
harddisks, and one of the HDs crashed. Well, I know I should have
backed up the data,
which I did, but the backup is far too old. You know how hard it is to backup
big big HDs/partitions w/o having bunches of backup media. Anyway, I have
consulted Heinz, who was so kind pointing to LVM2, with its help it should have
been possible to mount the VG partially. What I did was:

1. upgrade my kernel, so I could use the device-mapper, which is important
for LVM2
2. installed LVM2
3. tried "vgchange -P -ay", which gave me following output:

> -----
>   3 logical volume(s) in volume group "data" now active
>     Finding volume group "mpeg"
>   3 PV(s) found for VG mpeg: expected 4
>   Logical volume (mp3) contains an incomplete mapping table.
>     2 logical volume(s) in volume group "mpeg" already active
>   3 PV(s) found for VG mpeg: expected 4
>   Logical volume (mp3) contains an incomplete mapping table.
>     Found volume group "mpeg"
>   3 PV(s) found for VG mpeg: expected 4
>   Logical volume (mp3) contains an incomplete mapping table.
>     Found volume group "mpeg"
>   3 PV(s) found for VG mpeg: expected 4
>   Logical volume (mp3) contains an incomplete mapping table.
>     Found volume group "mpeg"
>   3 PV(s) found for VG mpeg: expected 4
>   Logical volume (mp3) contains an incomplete mapping table.
>     Found volume group "mpeg"
>     Activated logical volumes in volume group "mpeg"
>   2 logical volume(s) in volume group "mpeg" now active
> ----
> 
> vgdisplay :
>    Finding volume group "mpeg"
>  3 PV(s) found for VG mpeg: expected 4
> Volume group "mpeg" doesn't exist
> 
> ----

even vgscan did not help:

: # LVM2.1.95.12/tools/lvm vgscan -v
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "data"
  Found volume group "data" using metadata type lvm1
    Finding volume group "mpeg"
  3 PV(s) found for VG mpeg: expected 4
  Volume group "mpeg" not found

: # mount -a
mount: special device /dev/mpeg/mp3 does not exist
mount: special device /dev/mpeg/movie does not exist

VG "data" is a VG on different SCSI-HDs (which is backed up on a reg
basis... anyway this VG was never touched, as it didnt crash).

I also remove the devnodes left by LVM 1 (/dev/mpeg/mp3 /dev/mpeg/mpvie),
but still I cant access the VG's.

What to do next? Any help is really appreciated, as there is still lots of
important data on the VGs.

Thanks

-- 
Regards,
 nik-da-3'9''
 mailto:nik39.at.gmx.dot.net@check.this.mailadress.com
