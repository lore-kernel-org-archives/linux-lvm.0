Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DE5ii16608
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 09:05:44 -0500
Received: from demonserver.de (p15093797.pureserver.info [217.160.109.186])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DE5ib23015
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 09:05:44 -0500
Received: from demonlord.de (160.12.204.212.sr1.DTM1.ip.versanet.de [212.204.12.160])
	(authenticated bits=0)
	by demonserver.de (8.12.8/8.12.8) with ESMTP id i1DE5dK8010788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:05:40 +0100
Message-ID: <402CD9E4.8070402@demonlord.de>
From: Christian Reiss <email@demonlord.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig3858B1768637FF1308261F0E"
Subject: [linux-lvm] LVM Problems :)
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
Date: Fri Feb 13 09:13:39 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3858B1768637FF1308261F0E
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greetings!

I am trying to dissolve a running LVM, so i am doing
the e2fsadm, lvreduce, pvmove thingy. But ever since I
removed the first hdd, I am unable to resize the lvm
any more. The error can be seen below, with e2fsadm.
I also included the vg&lvdisplay commands.

I am running the LVM1 sources (non-cvs, approx mid last
year), as i am unable to run LVM2 (need to downgrade kernel
to 2.4.22 (no patch included in lvm2 for 2.4.23)).
Also, I am (too dumb/unable) to locate a e2fsadm alike
tool for lvm2, as e2fsadm needs the lvm-tab thingy,
which lvm2 no longer provides.

Any help is greatly appreciated. :)

-Christian.


::::::::::::::::::
::: vgdisplay ::::

--- Volume group ---
VG Name               share
VG Access             read/write
VG Status             available/NOT resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                256
Cur PV                11
Act PV                11
VG Size               1.12 TB
PE Size               32 MB
Total PE              36668
Alloc PE / Size       34108 / 1.04 TB
Free  PE / Size       2560 / 80 GB
VG UUID               PSYbaQ-bl8d-xvHp-6re2-hoKd-9mE5-Wa5Tqz

:::::::::::::::
:: lvdisplay ::

--- Logical volume ---
LV Name                /dev/share/data
VG Name                share
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                1.04 TB
Current LE             34108
Allocated LE           34108
Allocation             next free
Read ahead sectors     1024
Block device           58:0

:::::::::::::
:: e2fsadm ::

e2fsadm -L-10G /dev/share/data
e2fsadm -- logical volume size for "/dev/share/data" invalid

:::::::::::
:: df -h ::

Filesystem            Size  Used Avail Use% Mounted on
/dev/share/data       941G  910G   32G  97% /share/filebase


-- 
Christian Reiss <email@demonlord.de>
demonserver.de

Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
Public Key can be obtained here: http://www.demonlord.de/pgp.txt

--------------enig3858B1768637FF1308261F0E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFALNnmGLayMgL/cbIRArCHAJ4v11cM7C4Vug90pLSzLKRzPN5ycQCgqzFA
xM6PN7U9Luso7ebuXPnyWl0=
=ELQh
-----END PGP SIGNATURE-----

--------------enig3858B1768637FF1308261F0E--
