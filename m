Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88Gb3R4006375
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 12:37:03 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88Gb0ou028329
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 12:37:00 -0400
Received: from [10.100.0.195] (class1-nat.gurulabs.com [67.137.148.4])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 8D650684CA
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 09:36:21 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] lvm on CentOS with raid1 and grub
Date: Fri, 8 Sep 2006 09:34:46 -0600
References: <45012C0E.9080509@ambra.ro>
In-Reply-To: <45012C0E.9080509@ambra.ro>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1500851.Z2YqJfNerf";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200609080935.23315.peregrine@openbrainstem.net>
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
To: LVM <linux-lvm@redhat.com>

--nextPart1500851.Z2YqJfNerf
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 08 September 2006 02:38am, Sterpu Victor wrote:
> After a reboot I couldn't boot from none of my hdd's.
> I receive just a grub console. Now I must reinstall grub, but in order
> to do this I need to know the name of the root partion in the LVM.
> To find out this I moved one of the hdd's in another computer and I
> tried to mount the LVM partition.

You can not put /boot/ on top of LVM or RAID, except RAID 1 but you have to=
 be=20
careful if you need to boot from the second (or later) drive.

There are patches out there for GRUB to allow it to read LVM and they make =
it=20
possible to boot when the /boot/ files are on LVM.  Last I heard, they were=
=20
still officially "experimental" but apparently pretty much working.  I thin=
k=20
I read somewhere that the plan was to support LVM with GRUB2 when it=20
releases, but don't quote me on that, I can't seem to find the reference at=
=20
the moment.

> I do "modprobe dm-mod" and when I do "vgchange -ay" I get the message:
>   File descriptor 3 left open
>   File descriptor 5 left open
>   File descriptor 7 left open
>   No volume groups found
> I have no LVM devices in /dev.
> The alternative is to reinstall the OS, but....
>
> Thank you.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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

--nextPart1500851.Z2YqJfNerf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFAY27vkZHMmRgzLURApT2AJ9bZ/1hukGlsAE2UJYVLOEIq1AbIgCghzTq
0OpP8adF4huO6vfFIG0qgyw=
=lqYw
-----END PGP SIGNATURE-----

--nextPart1500851.Z2YqJfNerf--
