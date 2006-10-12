Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CMq0OO024718
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 23:52:01 +0100
Message-ID: <452EC755.1070603@redhat.com>
Date: Thu, 12 Oct 2006 23:53:09 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Broken hard disk
References: <200610122350.46609.martin.wilmes@java-cup.de>
In-Reply-To: <200610122350.46609.martin.wilmes@java-cup.de>
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

Martin Wilmes wrote:
> Now I installed the old, hopefully still working disk in a different computer 
> and booted with Knoppix 5.0.1 to get some of my data back but vgscan -v comes 
> back with nothing at all.

It's a bit strange that it outputs nothing at all. I'd expect to see
something like:

$ sudo vgscan -v
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "scratch0"
  Couldn't find device with uuid 'ZpQI30-qpx3-Cm54-YcSR-5Ho4-rlUx-uCxGBi'.
  Couldn't find all physical volumes for volume group scratch0.
  Couldn't find device with uuid 'ZpQI30-qpx3-Cm54-YcSR-5Ho4-rlUx-uCxGBi'.
  Couldn't find all physical volumes for volume group scratch0.
  Volume group "scratch0" not found

If there's a PV missing from the volume group.

You can add move 'v's to increase the verbosity of vgscan to see what
it's scanning - do you have any device filters configured in /etc/lvm.conf?

It'd also be good to see what pvscan shows, for e.g.:

$ sudo pvscan
  Couldn't find device with uuid 'ZpQI30-qpx3-Cm54-YcSR-5Ho4-rlUx-uCxGBi'.
  PV /dev/hda2        VG d800_vg0   lvm2 [34.18 GB / 760.00 MB free]
  PV unknown device   VG scratch0   lvm2 [60.00 MB / 0    free]
  PV /dev/loop1       VG scratch0   lvm2 [60.00 MB / 52.00 MB free]
  Total: 3 [34.30 GB] / in use: 3 [34.30 GB] / in no VG: 0 [0   ]

Once you find the volume group, activate it without the missing PV using
the --patial option, e.g:

vgchange -ay --partial <vgname>


Cheers,

Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFLsdU6YSQoMYUY94RAuddAJ4rVU9uHR9njfB/WuYqRg/6bVJkNACgsfpi
vgFdYK7lqpgZ6mJ3bo5VccQ=
=D/8l
-----END PGP SIGNATURE-----
