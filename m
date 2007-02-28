Received: from [10.32.64.203] (dhcp-0-203.surrey.redhat.com [10.32.64.203])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1SGY7J8024948
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 16:34:07 GMT
Message-ID: <45E5AF1C.8030704@redhat.com>
Date: Wed, 28 Feb 2007 16:34:36 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help: Mount point does not report full size of LV.
References: <5d25729a0702280810s256fc262s75a2c9557a6b391b@mail.gmail.com>
In-Reply-To: <5d25729a0702280810s256fc262s75a2c9557a6b391b@mail.gmail.com>
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

Nick Gyma wrote:
> Hey all, linux n00b here runing ubuntu:
> 
> I added a 3rd hdd to my system today and tried to extend the logical
> volume i currently had with the new added space. it was previously a
> windows NTFS disk (formatted clean before transfer). after going through
> the steps it all displays properly under "vgdisplay -v" but when i
> actually go and check the mount point folder size it is still the same
> as before and has not increased along w/ the volume group and logical
> volume.

Sounds like you just need to tell the file system to grow into the new
space - lvresize or lvextend *only* affect the block device (logical
volume).

> I've tried to remove the hdd from the VG to try and redo it but i get
> errors when trying to use "vgreduce" to remove the PV, saying "physical
> volume "dev/hdd1" still in use", even after running a "pvmove" command
> which resulted in "no extents avail for allocation".

Careful with that! Although in this case it should be safe, reducing a
block device with a file system on it is potentially risky - if you get
the size wrong, you can chop the end off & loose data.

> Is there a way to fix the LV as it is so that the mount point
> /home/nick/video is correct? or should i wipe it all out and start over?
> if so, how do i go about doing that? do i delete all data on the LV then
> do a vgremove then fdisk everything, deleting all partitions and start
> over?

By the sound of it, the lvextend worked - does lvdisplay show the
correct (new) size for the logical volume?

If it does, you now need to resize the file system it contains. Since
this was NTFS, you'll need to use the ntfsresize tool for this:

http://man.linux-ntfs.org/ntfsresize.8.html

To grow the fs to fit the new device size, you just need to do:

# ntfsresize /path/to/lv

Note that the file system must be unmounted for this step.

Your distribution may provide ntfsresize with the tools to work with
NTFS file systems. If not, you can use a rescue CD that includes it.
I've had good results with systemrescuecd in the past:

http://www.sysresccd.org/Main_Page

Kind regards,

Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFF5a8c6YSQoMYUY94RAvdRAKChQnXulqXqG4Ip6UnfPFazxIjTBgCgnvLN
UzyLOYQjLCx8PY7IcTXp2sc=
=9XDs
-----END PGP SIGNATURE-----
