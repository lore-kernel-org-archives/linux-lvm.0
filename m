Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1H7Kki15264
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 02:20:46 -0500
Received: from omnifarious.org (ehopper-host33.dsl.visi.com [208.42.65.33])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1H7Kjb23541
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 02:20:46 -0500
From: Eric Mathew Hopper <hopper@omnifarious.org>
Subject: Re: [linux-lvm] LVM 1 volumes and 2.6.2 kernel
Message-ID: <20040217072039.GA23328@omnifarious.org>
References: <200402151804.14727.dhill@nacnud.force9.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <200402151804.14727.dhill@nacnud.force9.co.uk>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 17 02:19:37 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: dhill@nacnud.force9.co.uk

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2004 at 06:04:14PM +0000, Duncan Hill wrote:
> Silly me decided a month or so back to migrate to 2.6, but I forgot that =
I had=20
> a LVM1 installation on my portable drive.  Said installation doesn't seem=
 to=20
> work now - even with dm-mod loaded, I get errors about /dev/mapper/contro=
l. =20
> What parts am I missing?
>=20
> Fedora Core 1
> 2.6.2 kernel
> lvm1 and lvm2 packages installed.

I had the same problem, and the answer you got isn't the right one for
Fedora Core 1.

First, you want to update mkinitrd.  I have mkinitrd-3.5.18-1.

This will upgrade /sbin/nash to have another builtin command called
'mkdmnod'.

Then you need to do a bunch of stuff to the /boot/initrd-<whatever>
file.  I will assume you already know how to do the whole dance
necessary to mount it as a filesystem.

First, copy /sbin/nash to initrd's bin directory and make a hard link to
initrd's sbin directory.

Then update the linuxrc file to have the command to make the device
mapper node in it (mkdmnod).  Here is what my linuxrc file looks like:

#!/bin/nash

echo "Loading jbd.ko module"
insmod /lib/jbd.ko=20
echo "Loading ext3.ko module"
insmod /lib/ext3.ko=20
echo "Loading dm-mod.ko module"
insmod /lib/dm-mod.ko=20
echo Mounting /proc filesystem
mount -t proc /proc /proc
echo "Making device mapper node"
mkdmnod
echo Creating block devices
mkdevices /dev
echo Scanning logical volumes
vgscan
echo Activating logical volumes
vgchange -ay
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/MonstVG/monstroot /sysroot
pivot_root /sysroot /sysroot/initrd
umount /initrd/proc

Then, do the unmount compress dance to make a new initrd file, and if
you reboot using it, things should be much better.

There are still some things that need doing to your rc scripts.  My
/dev/MonstVG directory now consists of a family of soft-links to devices
in /dev/mappper, but their should be scripts and stuff lying around that
handle that for you.

It makes me significantly less inclined to use Debian when I discover
people using it offering advice as if it's the only thing that exists.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAMcDHjtsvlOwvazYRAnEcAJ0XK94Q0O4NdYb4Cbm4o57H1UPDBACfReY8
Z8uSLwvEOxaN78jqy+VWWUA=
=MwuY
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
