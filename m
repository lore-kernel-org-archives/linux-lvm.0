Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3SE96d9031137
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 15:09:06 +0100
Message-ID: <463354A0.5040604@redhat.com>
Date: Sat, 28 Apr 2007 15:05:20 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can't mount vfat fs on lvm created by winxp guest
	on xen
References: <20070428103303.GA11539@gentoo>
In-Reply-To: <20070428103303.GA11539@gentoo>
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

Yann Boutin wrote:
> Greetings, 
> I've had no success with mounting a vfat file system created by a 
> Windows XP guest on a lvm volume. Windows XP guest is running under xen 3.0.5 rc3.
> 
> # mount -t vfat /dev/vg1/win1 /mnt/
> mount: wrong fs type, bad option, bad superblock on /dev/vg1/win1,
>        missing codepage or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
> 

Presumably, the windows install partitioned the raw storage?

Try running "file -s /dev/vg1/win1". If it says something like this:

/dev/sda: x86 boot sector; partition 1: ID=0x83, active, starthead 1,
startsector 63, 208782 sectors; partition 2: ID=0x8e, starthead 0,
startsector 208845, 195157620 sectors, code offset 0x48

Then there's a partition table on the device and the VFAT file system is
in a partition on it.

You can map those partitions using kpartx. Run:

kpartx -a /dev/vg1/win1

And you should see some new entries in /dev/mapper like win1p1 win1p2
etc. You can remove them with:

kpartx -d /dev/vg1/win1

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGM1Sg6YSQoMYUY94RAlCnAKCv70L+TzHdHQJrV/kydbMr2hJ8OACg1uQI
WPbSmrbKqOA8jABNsB5LvU0=
=8r7K
-----END PGP SIGNATURE-----
