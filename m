Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3DMRMj07250
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 18:27:22 -0400
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3DMRL87003520
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 18:27:21 -0400
Received: from [129.112.118.137] (helo=utsouthwestern.edu)
	by swlx166.swmed.edu with esmtp (Exim 4.30) id 1BDWN8-0003aO-Ul
	for linux-lvm@redhat.com; Tue, 13 Apr 2004 17:27:14 -0500
Message-ID: <407C693E.2020700@utsouthwestern.edu>
Date: Tue, 13 Apr 2004 17:27:10 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig271B0FD8695D5ECE6FED06F0"
Subject: [linux-lvm] >2TB with LVM v1.0.3?
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
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig271B0FD8695D5ECE6FED06F0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm running Redhat v7.2 (very old I know) and LVM v1.0.3 .  I have a 
1600GB ext3 partition currently in use and am planning to grow that by ~ 
6000GB.  From the documentation that I have found, it looks like I may 
be able to do this without modification to my system.  However, I'm 
querying to verify it..

Current ext3 filesystem has 4KB block size (supposedly good to 16TB total.)

I have one LV defined with a size of "3456106496".  I have two PVs, the 
first (sdc) with a size of "1646481408" and a PE size of "1048576", the 
second (sdd) with a size of "1815863296" and a PE size of "1048576" as well.

Allocation of the ext3 is at "1152717492" 1k-blocks used and "548221548" 
1k-blocks available right now.  The RAID system that the storage resides 
on has, up until now, sort-of enforced a roughly <2TB limit per device 
(2 cabinets currently with 1600GB and the RAID can not span cabinets,) I 
can continue to allocate ~ 2TB per device to fit within the kernel 2.4 
32-bit block device limit.  I do not know if I am actually limited to 
1TB per device as I've read before from Redhat, so that may be a 
possibility.

Here is my current vgdisplay
[root@swlx201 root]# vgdisplay
--- Volume group ---
VG Name               data
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               1.61 TB
PE Size               1 GB
Total PE              1648
Alloc PE / Size       1648 / 1.61 TB
Free  PE / Size       0 / 0


Any comments, questions, etc VERY welcome.

Peter Smith



--------------enig271B0FD8695D5ECE6FED06F0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFAfGlC/TMBbARZqsERArZ5AJ42GUtp7GTWGCbQ3x2YrpdYYD0jUACaA4sM
7r3pLG/MwMeNdmKkqb5GVRI=
=NZMg
-----END PGP SIGNATURE-----

--------------enig271B0FD8695D5ECE6FED06F0--
