Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1D9xrDj003859
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 04:59:53 -0500
Message-ID: <47B2BF41.8070701@redhat.com>
Date: Wed, 13 Feb 2008 09:58:25 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate problem
References: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>	<47B2AC45.6030901@redhat.com>	<b646832c0802130104i7d8eb37fkb61d49c5127f316b@mail.gmail.com>
	<b646832c0802130106v3d7c6f6ene7475edc2c599fec@mail.gmail.com>
In-Reply-To: <b646832c0802130106v3d7c6f6ene7475edc2c599fec@mail.gmail.com>
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

Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:
> even though the fdisk output contains "/dev/cciss/c0d0p16" there is no
> such device created under /dev/cciss/.
> Is it because of the above mentioned limitation ?

That's correct - under Linux, IDE hard disks (/dev/hd*) can have up to
63 partitions but SCSI and RAID controllers like the CCISS are limited
to 15 partitions (16 if you count the whole-device) due to the way minor
numbers are allocated to /dev/sd* nodes.

You could cheat and map the additional partitions using kpartx - run
"kpartx -a /dev/cciss/c0d0" and this should create a device-mapper
device for each partition under /dev/mapper/c0d0p*. You can remove them
again with "kpartx -d /dev/cciss/c0d0".

That said, it might be better to reconsider your partitioning scheme and
see if you really need that number of partition table entries.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHsr9B6YSQoMYUY94RAmWfAJ4uXdCCtqX8nKiER8yXqNoHFHaVkQCeOOdM
R3aCmQuHBVUxP/9bbGvrrqg=
=EUlc
-----END PGP SIGNATURE-----
