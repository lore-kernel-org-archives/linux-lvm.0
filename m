Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66Fm4019489
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 11:48:04 -0400
Received: from behemoth.sci.local (e2hst115.csg.stercomm.com [204.214.2.115])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i66Fm3e1021580
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 11:48:03 -0400
Received: from stercomm.com (localhost [127.0.0.1])
	by behemoth.sci.local (Postfix) with ESMTP id 30AE3A8E
	for <linux-lvm@redhat.com>; Tue,  6 Jul 2004 10:47:58 -0500 (CDT)
Message-ID: <40EAC9AD.5000002@stercomm.com>
Date: Tue, 06 Jul 2004 10:47:57 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Hardware Raid - LVM the way to go?
References: <7B5E506659A5D344A505F0F27972D87549CB0A@datafx-sbs.DataFX.local>
In-Reply-To: <7B5E506659A5D344A505F0F27972D87549CB0A@datafx-sbs.DataFX.local>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael Bellears wrote:
> We have a new Compaq server, with a Raid Controller capable of handling
> 12 SCSI HD's - We currently only have 5 (In Raid 5)
> 
> We want to be able to "grow" the data partition as need dictates(i.e.
> Add new HD's, grow the Raid 5 array, and data partition) - LVM looks the
> way to go.
> 
> My *usual* partitioning scheme, is:
> 
> /dev/cciss/c0d0p1 /boot (100M)
> /dev/cciss/c0d0p2 / (all of the disk not used by /boot and swap.)
> /dev/cciss/c0d0p5 /swap (~1G)
> 
> I'm installing via Debian-Installer(Beta-4) - Which gives LVM
> options...Would I create all my partitions as per my "normal" setup, but
> mark them as LVM?

Sort of.  You actually mark partitions (or whole disks) as physical
volumes (PVs) and then assign the PVs to a volume group (VG) and then
you can start carving out areas called logical volumes (LVs)... which
translate to you old idea of what partitions are used for.

You can then use lvextend when necessary to extend the size of
any logical volume and if you have a filesystem that is dynamically
resizeable... you can use the filesystem specific tool to resize it
to fill the extra LV space.

e.g.

Let's say you have a partition /dev/cciss/c0d0p1 that is 10G in size and
you have used your partitioning tools to type the partition as LVM.

Now you can make it a PV:
# pvcreate /dev/cciss/c0d0p1

After you have created the PVs you want.... you can add them to
existing VGs or you may want to create a VG.
# vgcreate debianvg /dev/cciss/c0d0p1

Create your LVs:
# lvcreate -L 2G -n usr debianvg
(you'll end up with a /dev/debianvg/usr with 2G of size)
# lvcreate -L 4G -n home debianvg
# lvcreate ...etc...

Make a filesystem on your LVs:
# mkreiserfs /dev/debianvg/usr
# mkreiserfs /dev/debianvg/home
# ....

Now after installation.. let's say you want to enlarge /usr (assuming
you mounted /dev/debianvg/usr at /usr) by 1G.
# lvextend -L +1G /dev/debianvg/usr
# resize_reiserfs /dev/debianvg/usr

Reiser will allow you to resize without having to umount
the partition.  Depending on your filesystem choice, you may
have to umount the partition in order to resize it.

I too use the Compaq/HP equipment.  I usually create a dedicated
VG for the OS (to hold /usr,/opt,/tmp,/var,etc) and then other
VGs for user data (/home, etc.... though I usually call it
/localhome to avoid automount issues with things like NIS).
So I will have at least 2 partitions... or possibly two
raid disks (e.g. I might create a mirror of two drives for
the OS VG and raid5 the other drives for user data VGs).

I would avoid placing / under LVM, just for some flexibility...
and therefore, you want to think about the number of LVs you'll
want to create to avoid things going needlessly into /.  I
use unique VG names to avoid issues should a disk get moved
into another host.  I still create a small /boot area, though
arguably that won't be needed anymore.  It's also outside of
LVM and since it's usually small, I use ext2.

With today's larger disks and with journaled filesystems, I
usually don't create a journaled fs that's less than 750M.
But that's my minimum nowadays.

So... roughly:

swap (whatever size you need)
/          300M reiserfs
/boot       60M ext2 (probably more than most will need, depends on
                    how many kernels you tend to keep around)

Now the OS VG:
/usr       2.5G reiserfs (usr LV)
/opt       1.5G reiserfs (opt LV) (smaller probably for non-SUSE dists)
/var       750M reiserfs (var LV)
/var/lib   750M reiserfs (varlib LV) (for SUSE again, for YaST update space)
/tmp       750M reiserfs (tmp LV)

Now from the user data VG:
/usr/local   1G reiserfs (local LV)
/localhome   1G reiserfs (home LV) (obviously both can be as large as you want)

Though I didn't mention this, you can grow a VG by adding more
PVs to it.

Whew... all of this is probably written up somewhere else.
