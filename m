Received: from [10.32.64.203] (dhcp-0-203.surrey.redhat.com [10.32.64.203])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l2MFqlmK007193
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 15:52:47 GMT
Message-ID: <4602A6CA.6050809@redhat.com>
Date: Thu, 22 Mar 2007 15:54:50 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] failing hard drive
References: <4602A28E.8010502@arabidopsis.info>
In-Reply-To: <4602A28E.8010502@arabidopsis.info>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Tim,

> It is running Fedora Core 4 (don't ask)
> I want to swap out the drive with a new one (400GB).
> pvmove /dev/hde does not work even though the file system in not full.
> It says there are no free extents (or something like that - I don't want
> to needlessly turn the machine back on since hde is getting worse) I
> guess this is because the underlying stuff is full up.

You're right - it's not the file system being full here, rather it's the
volume group (VG). You can see this by running either:

# vgs
  VG         #PV #LV #SN Attr   VSize  VFree
  VolGroup00   1   2   0 wz--n- 33.81G 32.00M

# vgdisplay
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               33.81 GB
  PE Size               32.00 MB
  Total PE              1082
  Alloc PE / Size       1081 / 33.78 GB
  Free  PE / Size       1 / 32.00 MB
  VG UUID               R3OVax-yaLB-4SDX-V05w-BQSM-eKfV-dnLE2P

> It would be nice if I could just dd the failing drive onto the new drive
> and replace it (using linux on a cd) but I have no reason to believe
> this will work - will it?

This should work OK, although as usual with backups you want to make
sure that nothing is writing to the disk while you take the dd - using a
rescue CD would be fine, or deactivating the volume group before
starting (but if it includes your root file system then you will need to
use a rescue CD).

> Has anyone got a step by step guide of what to do? I guess I must shrink
> the filesystem and then whatever that sits on.

That may work, but you'll need to make enough space within the VG to
accommodate all the data that is currently stored on the failing hde.

To do this, you first have to shrink file systems from the VG, then
shrink the logical volumes (LVs) that the file systems are sitting on.

Another option would be to add the new drive to the system and run:

pvcreate /path/to/new/disk

followed by:

vgextend <VG name> /path/to/new/disk

To temporarily bring the VG up to 10 disks to allow you to remove the
failing member. You should then find the "pvmove /dev/hde" works as
expected (assuming the new disk is at least as big as the one you are
replacing).

> This seems to depend on the version of LVM one is running. I have no
> idea what version comes with Fedora Core 4 or how to find out.

You'll have lvm2 in FC4, although it's a relatively old version now.

Kind regards,

Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGAqbK6YSQoMYUY94RAlG0AJwPGQ60wQ6NyjnouTL9/NsY0fyrwACfdGeS
pyksRh8UAdGrSwlbm2HJ+tI=
=39ku
-----END PGP SIGNATURE-----
