Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j150hGO21391
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 19:43:16 -0500
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j150hEUB008012
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 19:43:15 -0500
Received: from [10.73.0.119] (unknown [172.16.1.75])
	by mail.inostor.com (Postfix) with ESMTP id A986D2B521
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 16:25:47 -0800 (PST)
Message-ID: <42041671.3090101@inostor.com>
Date: Fri, 04 Feb 2005 16:42:25 -0800
From: Tom Dickson <tdickson@inostor.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090303010604020806000104"
Subject: [linux-lvm] Failure recipe: 2.4.29, lvm2 lvcreate,
 dd reading from file on RO xfs
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------090303010604020806000104
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

We have a reproduceable failure of device-mapper when running on the 2.4.29 kernel
with XFS. With the XFS logical volume mounted read only, we run a script to
continually read a one gigabyte file from the filesystem.

We run a second script that creates 3 snapshots (10 seconds between them), and
then waits 30 seconds, and throws them away.

After 7-10 iterations, the lvcreate command fails with:

trying to execute lvcreate -sns3 -L5G /dev/H99/v
~  device-mapper ioctl cmd 9 failed: Cannot allocate memory
~  Couldn't load device 'H99-s3'.
~  Problem reactivating origin v

and dmesg says:

~  device-mapper: Unable to allocate hash table space
~  device-mapper: error adding target to table
~  __alloc_pages: 0-order allocation failed (gfp=0x20/0)

At this point, anything reading from /mnt/H99 (the read only mount point) is
deadlocked.

If we run dmsetup resume H99-v, it begins to work again. However, when we tried to
unmount it (at least one time), it caused a kernel BUG() in dm-snapshot.c:1064.
The output of that kernel oops is in dmesg-dm-0204c.out.

The system has 1GB of RAM, highmem enabled, and uses the .config file attached.

We're running further tests to try and track down exactly what is happening, doing
the dd directly from /dev/H99/v seems to work. It looks like the snapshot
allocation is failing, and then failing to resume the source volume.

The failure occurs on our system while running
~  repeat-mk-NO-s3.sh and while-dd-from-abcd
(see test139scripts-0204c.tgz)

In an environment with minimal services (excluding cron to avoid any of
our custom cron actions)and with the xfs fs mounted read-only!
(same problem occurs if rw)

our kernel 2429-db0 is built with the
following patches
~  xfs-2.4.24-pre1-split-acl.bz2
~  linux-2.4.28-pre4-devmapper-ioctl.patch
~  linux-2.4.22-VFS-lock.patch

The dmsetup on the test box reports
~  dmsetup --version
~  Library version:   1.00.21-ioctl (2005-01-07)
~  Driver version:    4.1.1
and lvm reports:
~  lvm version
~  LVM version:     2.00.33 (2005-01-07)
~  Library version: 1.00.21-ioctl (2005-01-07)
~  Driver version:  4.1.1
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFCBBZx2dxAfYNwANIRAsknAJ9Vm7nhxa25u258uc1KA7NokhuSvQCdEeit
B1PZ0pViwTSwOIKaYPkgUQU=
=qaZG
-----END PGP SIGNATURE-----

--------------090303010604020806000104
Content-Type: application/x-compressed;
 name="lvm2.tgz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="lvm2.tgz"

H4sIAPUVBEIAA+xaCZAUVZpuRJwdGIVACW86sQVBga6rD45GszKzqp6VV2dmVXejTNJ2F1BQ
dDVd1c0xYovKKCKieIQGyuUB4oqICF7YzjDIgnixDDDLInjMcDojMK7iQNf+mVnVlVX1MtuN
cHdjIzYjiKL//3v/+997//uP914ykkg63aMSDS3R5mRihMPl8DSMTE6eU/Qzfg74yj0e+HW5
PS6H6Vf/XJ5yR5ETenY6nE6P01XkcFa4yt1FhOPnVMLqa00k61sIoijZGG2Ylog3WeHo+PT6
aBMRSkRaEjh+ejBdv/9HvuKF/1Q065ILvUU9v1k6Qfiq8rLfvjW448vhSs/kgP5HPrxq7YaK
Mfc88dT6/mMSb+zmo7eP5967bPX8usMdr35z/fP3Pfn+r9DEvX9jotO3o+CyfUeu2XzXZXMP
rv7XRUNeKJmwfdOWlZPXdv7x4sY4cW19bMy5Rxf5R/uuXlExJ/TWXzzXDi66Gl32wuJFL59o
f+7fOpkxy+df9eyNva8USvYfax97/uvO1rb1z1342Vj29fAT7z+887uZ+28+y9at7ljR951x
xafWbdv24Lqbt1XPmLGH70j946V/rDx0qHrT/VsHLRhysvrYj1t/KL7xh7VzlBcWjb9lROqi
nT9sf7h+0O86Fly7o/3qG8/ePG7gf6z7bN6cc53nX1k1q8fgY2MvGr3a+cuqoxOKiw+t7fPm
Wz1ayoI9nL+44obGx/uL0QBZ9driW878i/fSkjdanp9RUeM9Opbo+6JrwLEezw47cii2u2jq
2ZnNT7T3WbokVb7x4RR6/O4+r/frd8XES94NzJsTvPs3yz5NFLf2WvNGrxXjBjkJqubdodfv
HnxVv69SU3ef/TFedbj4mNHw5V+en7yk3+nShtkXjO/34pW/PzSgaLhQrpY9/aseb0sfp6bd
lpp+8JFzm1eWnXu1tvPpZRN737n/9VV379w47SS5LnXxsAf6u/rcUL363G0XfXVo4r2Oj0+0
719yov2mG89+cmvboJjzvUsWHvBWNSzne9/Wc/Gpfz457a7wyPDIAZcMXzPPNfCFFduQZ+8F
/b+lnhy/5ubRl3POhX19j900eNEdbb3nfvTWuPXPX3fzY/SWwYOvnxR+Zdnwe4Rju+If9Jp6
dvucFzrjp5t2tPcZvza1/JmBF7/heeCNk8v2f/9cH2bGwZXrbucnj5vXc1PvM/u2HJzw95dP
/PWbyBXf3/590XvNUzve/6J+8UfSLOqUa8iCvseLO09esyc4sX2jclPTm57iCz9YWTnTIyx6
p7Xj+6VLnijateECYsIXzBNnPtld9P3GlzwrHm7ffuPx1H7HiI87vti/ofPQg3v/kPpw/+Wf
pbY+M/HSTZuXP3JpbNxNJWv4t4eU7B++9t6336ys73tuR9W9X14ceqz/osj1iYr7tl83f9Pp
sUMGkRv7xYe/wz+4c/P8vYuGne9z5YkPnvrzFfJDsw8nRlw5YUd74kBR67mG11LxBwLvz2A/
vrl8/dcdF58nUt/95oJP5ne01ayY8e2+d1c/OaL+uyPffvnr13Z1fP5Ijz1nFrs7p2/d8Oiy
bakNnfsevD41oHOzen+P2OaviwanPprec8/p+NJRqRcXrB+5t13+a2rzquKvO+YdTbX+oVP4
/PiUUmbN+Ymfzpy11ZV69pVU28BUw4ekb1NnydOpzdftSE3tXC7tm3Kg6PiH130y8+5nUo9/
+vfh12xTFnlTB/osvWXu+eKa46knh51o/2bNyz+2//m3jx0ouvalne2Xn+iYt+h45/IFEZit
0UfUVYde+uHg8o+/gg007cSbD6Smd25rv3bQdrCwVYM7515FD/z393t9Vbzks119vjg45s3w
6SPJ0cKWo5JnSI/inQe2V3tP94j0m3Pb07v6KKeOX7SOrL/yvqMfXv2n2MI+owfO/9Prp5KX
/dpx5oq5t93aO5wa+DtVnLjjwQ/k3m0nWy4csWThu6VnFp3c99C2Xgs+ffq7hUGJOPHOmCkz
XlVvv3fbqyvZa+ilne6nHl3f9scze1D/XseP3nlyy7sD9pxaPHz14eKS2JnvDm2I6Tv5UOv9
U8QXzx2e3czff7Rk15Ct9/zitdi0cyN7tB3qM/H3b/2t7+lbiL49L2IeWr+54vC332yZMPau
OQePLD9PXf3AhcfPlu5tP7DxkZIv26m/pF45Wt25/c4J16x6NegT1z26u+h50/f5ks6e2+aW
DS8S/7e99c//jWyIN02KTv5v7cM+/pe5y8rKTfHfCfHfA9//x///ia+kdwlBtiZhcMloQ30s
NpuYHGmKtNQnI43E9PppEcKwj9FEY7zphiQRaYwme5f0pgTeh/xqbWV51WwQkP5T9oZkIpog
muJJIhFJZlAhRDs1XG+tLyreGAHBydaWaHI2EYu0RWJEvDkZjTclsnKZWpGREMfwCslmGrLx
+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
--------------090303010604020806000104--
