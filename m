Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2MMXBBl016324
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 18:33:11 -0400
Received: from dark-templar.advansoft.us (166-70-63-214.ip.xmission.com
	[166.70.63.214])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2MMX9KQ029992
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 18:33:09 -0400
Received: from corsair.lamontpeterson.net (lrp.dsl.xmission.com
	[166.70.26.153])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 46F606856B
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 16:33:04 -0600 (MDT)
From: Lamont Peterson <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] failing hard drive
Date: Thu, 22 Mar 2007 16:33:00 -0600
References: <4602A28E.8010502@arabidopsis.info>
In-Reply-To: <4602A28E.8010502@arabidopsis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2002323.VFUbVobz02";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200703221633.05727.peregrine@openbrainstem.net>
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

--nextPart2002323.VFUbVobz02
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 22 March 2007 09:36am, Tim Milstead wrote:
> I am a complete noob to lvm.
> I have 9 partitions on 9 (190GB) disks, one of which (according to smart
> tools) is failing - hde.

I'm curious, it sounds like you are not using RAID, but instead have 9 PVs =
in=20
your LVM setup.

If one hard drive will fail in 5,000 hours of use, then 1 in 10 will fail i=
n=20
500 hours of use, or so the thinking goes.  With 9 drives, I'm not surprise=
d=20
that you are experiencing one failing.

If you're not using RAID, might I suggest that you do?  Those 9 disks would=
=20
make a nice RAID5 or RAID6 array, and LVM works beautifully on top of=20
software RAID, hardware RAID or any combination of both.

LVM does not provide redundancy (yes, I know it can do mirroring, but I=20
wouldn't suggest that), it's about easily managing lots of storage space. =
=20
RAID is about reliability/redundancy.  Use the right tool for the right job=
,=20
and use both tools together to get all the best benefits of both.
=2D-=20
Lamont Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart2002323.VFUbVobz02
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBGAwQhvkZHMmRgzLURAhspAJ9uwFrXpsxOCBpDH0MZ61VF1h5BlACgjamr
fl/ZlR6fMT82IJfLrrnqTcQ=
=kqMl
-----END PGP SIGNATURE-----

--nextPart2002323.VFUbVobz02--
