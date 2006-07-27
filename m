Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RHFQvH019421
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 13:15:27 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6RHFGlk022565
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 13:15:18 -0400
Received: from dhcp189.glwlan.gurulabs.com (hq-nat2.gurulabs.com
	[67.137.148.11])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 945A96835C
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 11:15:10 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] Performance impact of LVM
Date: Thu, 27 Jul 2006 11:14:57 -0600
References: <20060727120250.GB17454@freshdot.net>
In-Reply-To: <20060727120250.GB17454@freshdot.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1798065.kOHNV9jqVl";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200607271115.02076.peregrine@openbrainstem.net>
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

--nextPart1798065.kOHNV9jqVl
Content-Type: text/plain;
  charset="ansi_x3.4-1968"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 27 July 2006 06:02am, Sander Smeenk wrote:
> Hello list!
>
> I've recently subscribed here as i have some questions about LVM,
> particularly the performance impact of LVM on disk IO.
>
> I'm a happy LVM user, on my workstation at home i've used it for a long
> time. No special setups or anything, but it's nice to be able to resize
> partitions on the fly, or have a number of disks act as one huge disk...
>
> So, when I had to reinstall all servers for the company I work for, i
> decided to use LVM for the same reasons stated above. But now i wonder:
> Does LVM have any impact on disk IO? Are there any tests done on this
> subject?
>
> I couldn't really find any on the internet. Most of the things you find
> are implementation issues and 'how does it work' stuff ;-)
>
> I'm running LVM2 (2.02.06) on Debian 'sid' (unstable, but i hate that wor=
d)
> using linux kernels 2.6.17.xx.
>
> For example, one of my servers has 4x 34gb SCSI disks and 2x IDE disks.
> One of the IDE disks has a 250MB boot partition, the rest is LVM
> partition, the other IDE disk has one big LVM partition, same goes for
> the 4 SCSI disks.
>
> Then i made a scsi_vg01, with all the scsi disks and a ide_vg01 with all
> the ide disks, and started lvcreating "partitions" inside those vg's.
> That's basically how i set up LVM on all of my servers. Some servers
> have different disk-configurations though...

Any particular reason to not include all the disks in a single VG?

Also, this setup will actually leave you more vulnerable to single disk=20
failures.  I would *highly* recommend using RAID to aggregate your disks=20
together, then use LVM on top of that to make things manageable.

> Can anyone shed any light on this approach? Are there impacts on
> performance of read / write actions? Any information is welcomed.

When you try to read or write to a VG, the LVM code is used by the VFS laye=
r=20
in the Kernel to decide the physical device/track/sector address to send th=
e=20
I/O operation to.

The only "extra" LVM I/O done is when you are (re)configuring LVM.  Things=
=20
like creating, resizing & deleting an LV require a little bit of disk I/O, =
of=20
course.  Other than the small amount of overhead when using snapshot volume=
s,=20
there isn't any other impact on I/O performance.

However, I wonder if the LVM address look-up code is better than, equal to =
or=20
any worse than that for a plain block device (e.g. partition, loopback=20
mounted file, etc.).  If there is a statistically relevent delta there, I=20
think it would only impact I/O latency and even then, it couldn't be much.

When booting your system, it does have to take a moment and "vgscan" for VG=
s. =20
This is pretty fast, but it adds a second or two to your bootup time.

That's all I can think of off the top of my head.  HTH.
=2D-=20
Lamont R. Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart1798065.kOHNV9jqVl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBEyPSWvkZHMmRgzLURAj2jAKC/xDoD2E8CODqck9KVhvvYgPZOJQCeNq2i
dEnI98Z71SBitp3/7Ehl7nY=
=tDZH
-----END PGP SIGNATURE-----

--nextPart1798065.kOHNV9jqVl--
