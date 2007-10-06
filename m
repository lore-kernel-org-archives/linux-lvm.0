Received: from thunderbird6.fab.redhat.com (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l969dBeI012916
	for <linux-lvm@redhat.com>; Sat, 6 Oct 2007 05:39:12 -0400
Message-ID: <470757EE.5070306@redhat.com>
Date: Sat, 06 Oct 2007 10:39:58 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] could not mount LVM2 read only snapshot
References: <55e074e80710060135g264a3eeatc57178975862f288@mail.gmail.com>
In-Reply-To: <55e074e80710060135g264a3eeatc57178975862f288@mail.gmail.com>
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

Michael Jiang wrote:
> I use 'lvcreate -p r' to create a read only snapshot. got following
> error message when I try to mount it
> 
> "mount: wrong fs type, bad option, bad superblock on /dev/VolGroup00/snap,
>       or too many mounted file systems"
> 
> If I do not use '-p r' and mount -r, then it works fine.
> 

Working fine here:

# lvcreate -L 10M -pr -s -n l0-snap /dev/vg0/l0
  Rounding up size to full physical extent 12.00 MB
  Logical volume "l0-snap" created

# mount -oro /dev/vg0/l0-snap /mnt/snap

# umount  /mnt/snap

# mount /dev/vg0/l0-snap /mnt/snap
mount: block device /dev/vg0/l0-snap is write-protected, mounting read-only

# lvm version
  LVM version:     2.02.21-RHEL4 (2007-03-26)
  Library version: 1.02.17-RHEL4 (2007-02-02)
  Driver version:  4.5.5

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHB1fu6YSQoMYUY94RAjrNAJ43uS//1K5RsahvHSzWA+0dPnKaOQCeIiTb
LOuWlsH9ohqlJZLgjja5/As=
=6L6d
-----END PGP SIGNATURE-----
