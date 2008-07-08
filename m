Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m68C3LOF006425
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2008 08:03:21 -0400
Received: from thunderbird6.fab.redhat.com (vpn-6-49.fab.redhat.com
	[10.33.6.49])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m68C3K8S006434
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2008 08:03:20 -0400
Message-ID: <487356B5.1070904@redhat.com>
Date: Tue, 08 Jul 2008 12:59:49 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Replace lvm-disk without being able to connect two
	disks at the same time
References: <1215391635.29815.28.camel@localhost.localdomain>
In-Reply-To: <1215391635.29815.28.camel@localhost.localdomain>
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

Eckhard Kosin wrote:
> Hi all,
> 
> on my laptop I have to replace the disk.  The filesystem is on lvm2.
> The old disk has 40GB, the new one 250GB.  Of course on the new disk vg
> and lv sizes will differ from the old one.  With the laptop there is no
> possibility to plug in the old and the new disk at the same time.

If you really want both disks attached just pick up a cheap USB-ATA
enclosure - you can pick them up for just a few dollars now.

> So my plan is as follows:
> 
>       * Backup all data.
>       * Remove old disk and plugin new disk.
>       * Create vgs  and lvs on the new disk as desired.
>       * Restore all data.

Personally I would just backup my data (i.e. /home) from the system and
then re-install to the new disk & restore the data.

> However I suspect that in the last step the new lvm-metadata will be
> overwritten by the metadata of the old disk.  Which files I have to
> exclude from the restore to do not touch the new metadata?

LVM2 metadata isn't stored in a file (well, only for backup/archival
purposes). It's stored directly in an area that's normally at the start
of the PV (between the label and the beginning of the physical extents).

> Or is there a better strategy to replace a lvm-disk without the
> possibility to connect the new disk and the old disk at the same time to
> the box?

Unless you really want to swap the disks out while maintaining the same
VG (vgextend with the new disk, pvmove, vgreduce to remove the old disk)
there's nothing wrong with this approach. Whichever way you do it you'll
need to be careful to create a working boot configuration on the new
drive. I.e. separate /boot partition, grub/lilo install/configuration etc.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkhzVrUACgkQ6YSQoMYUY95pDACgjz843HaAthmz4iDEpdN4cGD2
UZkAn38brcPbiI8voNSpBttMKjOrZ3du
=yIh0
-----END PGP SIGNATURE-----
