Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6EAY9jl022994
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 06:34:09 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m6EAY85e002168
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 06:34:09 -0400
Message-ID: <487B2BA0.8010501@redhat.com>
Date: Mon, 14 Jul 2008 11:34:08 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] sector zero on a Logical Volume
References: <200807131751.57651.gene@czarc.net>
In-Reply-To: <200807131751.57651.gene@czarc.net>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Gene Czarcinski wrote:
> I am hoping that someone on this mailing list is expert enough to answer my 
> question:
> 
> Is there any reason that sector 0 on a Logical Volume should not be all zeros?

All depends what you are doing with it. Many file systems and other
block device users avoid using this sector because it may be "shared"
with the firmware on x86 but there's no requirement for it to be
reserved like this. Ext2/3 are fine (they start in the 1st sector) as
would be LVM2 - e.g. if you were using the LV to provide a physical
volume for a virtualised system.

> My problem occurred when I effectively dd'ed a real disk partition on which 
> grub is installed to a Logical Volume.  When grub in installed into a 
> partition, it not only installs it's boot code but also makes sector 0 on 
> that partition have a fake "msdos" partition table and the kernel (and other 
> software) does not like that at all!!

It is not a "fake" msdos partition table, it's a real one. The
conventions for x86 boot loaders require a partition table since the MBR
(master boot record) consists of a 512 byte sector containing 446 bytes
of executable code followed by the four-entry primary partition table.

You can't install grub without an MBR/partition table so when you
attempt to install it to a device that lacks one grub will lay down a
skeleton MBR on the device.

> My solution was to use dd to zero sector 0 and then everything worked ... 
> could mount the Logical Volume, etc.

Shouldn't be a problem for anything that doesn't store data in this
sector. Just be sure to limit the command to only wipe sector 0.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIeyug6YSQoMYUY94RAurDAJ4keJuVilimG/ftZbFLt18PP6btEQCfUrSL
cSAZeVbaOwxI+uySMI8qzWQ=
=hDCA
-----END PGP SIGNATURE-----
