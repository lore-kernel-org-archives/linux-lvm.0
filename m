Message-ID: <01C02742.093B9B40.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: [linux-lvm] 2.2.17+LVM+online-ext2
Date: Mon, 25 Sep 2000 22:43:33 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Well, it appears I was falsely testing the online ext2 patch...
apparently ext2online wants a loopback fs mounted on /dev/loopx
instead of straight on a file (using losetup to create the loopx
device), but oh well I needed to go to .17 anyway

Thanks for all the info.  Next stop: journaling (ext3/reiser)

Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOdANVXC+DNfF0nVpEQIjswCgvdkvpHXc9q5c4xU5eKiVIseef+EAoJag
Z/0e8G9fXKR5CAWFI/2ubwNI
=6S/o
-----END PGP SIGNATURE-----
