From: SI Reasoning <si@mindspring.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZW6UaRQ88huN2Kgya2pC"
Message-Id: <1071879353.2903.140.camel@sidell.home.network>
Mime-Version: 1.0
Subject: [linux-lvm] problems converting from root-lvm to standard
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
Date: Sun Dec 21 15:47:12 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

--=-ZW6UaRQ88huN2Kgya2pC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have had a root-lvm for some time now and I have been attempting to
convert my root-lvm to a standard /dev/hdxx root. Unfortunately it has
not gone smoothly.

My host system is Gentoo. I used a live-cd (knoppix) mounted the old
lvm-root (/dev/sys/root) and the new root (/dev/hde5) and from within
the mounted lvm-root I ran
find -xdev | cpio -pvmd /mnt/root

Then I mounted the various other partitions within the new root,
/mnt/root such as=20
mount /dev/hde3 /mnt/root/boot
mount -t proc proc /mnt/root/proc
mount /dev/sys/usr /mnt/root/usr
etc...
I then "chroot /mnt/root"
from within chroot I went to /boot
and tried to mkinitrd
mkinitrd initrd-2.4.20-xfs-r3.gz 2.4.20-xfs-r3
but it failed with the message along the lines of:
/dev/null permission denied.
I tried several ways to get around that including chmod 666 /dev/null
but it failed.

So I tossed the live-cd and booted into gentoo with
2.4.20-xfs-r3 S
(single user mode)

from within I reset up chroot as above and was able to mkinitrd. I then
setup lilo.conf and changed to root=3D/dev/hde5 on the default "linux" and
created links within /boot with initrd > initrd-2.4.20-xfs-r3.gz and
vmlinuz > vmlinuz-2.4.20-xfs-r3.
I ran lilo and it looked fine and rebooted.

Unfortunately I got a kernel panic. The first sign of something wrong
was when it could not write in the partition table (in /dev maybe) and
then I got the message that I should try "initrd=3D " at kernel boot.

Any ideas where I may have gone wrong? My understanding is that lvm-root
is much more difficult with lvm2, esp since it is not directly part of
2.6 and I am wanting to setup an easier way to convert to lvm2 so that I
could go back and forth between 2.4 and 2.6.



--=20
SI Reasoning
si@mindspring.com
gpg public key ftp://ftp.p-p-i.com/pub/si-mindspring-pubkey.asc
=20
The significant problems we face cannot be solved by=20
the same level of thinking that created them.=20
-Albert Einstein

Preventive War is like committing suicide for fear of death. - Otto Von Bis=
marck

--=-ZW6UaRQ88huN2Kgya2pC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/45S5Q3BM1ElJCVIRAuA/AJwNIDQrO6v9NjwyVLRadapVWQ4jyQCdG7Kf
lSWuwCvBw+xz8n4RQd13qSg=
=21Nt
-----END PGP SIGNATURE-----

--=-ZW6UaRQ88huN2Kgya2pC--
