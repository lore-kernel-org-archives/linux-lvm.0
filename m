Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6O2qOtn031290
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2006 22:52:24 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6O2qHcO025771
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2006 22:52:17 -0400
Received: from corsair.lrp.advansoft.us (lrp.dsl.xmission.com [166.70.26.153])
	by dark-templar.advansoft.us (Postfix) with ESMTP id F00186830D
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2006 20:19:55 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Date: Sun, 23 Jul 2006 20:19:47 -0600
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10396757.XPR4hjGbdd";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200607232019.52718.peregrine@openbrainstem.net>
Subject: [linux-lvm] Failed PV recovery
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

--nextPart10396757.XPR4hjGbdd
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

All,

Here's the setup:  home file server has 3 drives, 4.3GB, 45GB, 120GB; all I=
DE. =20
The 4.3GB drive has a /boot/ partition and a small swap with the rest=20
allocated to an LVM partition which is the only member of the "system VG. =
=20
The other two drives are single LVM partitions and comprise the "data" VG. =
=20
That's how it was configured for over a year.

A few months ago, I started seeing some unreadable sectors on the 45GB driv=
e. =20
I purchased a 320GB SATA drive and a PCI controller (no SATA on this=20
motherboard) to replace the two drives (I'll get more SATA disks and conver=
t=20
to LVM on RAID as I can afford them).  Long story short, motherboard needed=
=20
BIOS flash and a little coaxing to recognize the PCI STAT controller, but=20
that's sorted out now.

I partition the 320GB drive with 1 LVM PV and add it the data VG.  I=20
run "pvmove /dev/hde1 /dev/sda1" (120GB -> 320GB) which takes about 75=20
minutes (120GB was almost completely full) no issues.

AT that point, I *should* have run "vgreduce data /dev/hde1" so that I=20
wouldn't have the 120GB drive in the VG anymore, but I didn't.  20/20=20
Hindsight.

Next I ran "pvmove /dev/hdg1 /dev/sda1" (45GB -> 320GB).  About 45% of the =
way=20
through, it crashes:

/dev/hdg1: Moved: 45.0%
  /dev/hdg1: read failed after 0 of 1024 at 4096: Input/output error
  /dev/hdg1: read failed after 0 of 2048 at 0: Input/output error
  Failed to read existing physical volume '/dev/hdg1'
  Physical volume /dev/hdg1 not found
  ABORTING: Can't reread PV /dev/hdg1
  ABORTING: Can't reread VG for /dev/hdg1

The system was still running, but the /dev/hdg disk no longer showed up.  I=
n=20
the past, I could power down for an hour or so (let the drive cool down) an=
d=20
then it would show up again.  It looked like the mounted LVs which are on=20
data were fine (I could read & write), so I powered off.  Rebooting, I get=
=20
kernel panics.  I can bring the box up in "emergency" mode or with a rescue=
=20
environment.

Prior to this, only one LV was unusable.  I was able to read every bit of t=
he=20
rest of them just fine (I have backups of everything important).  The one b=
ad=20
LV (due to unreadable sectors on the 45GB drive) was for /var/spool/up2date=
=20
when I was running RHEL3, which I have obviously replaced since RHEL3=20
wouldn't support SATA (I have SUSE Linux 10.1 on there now).

If I had already removed the 120GB drive from the VG, I would try dd_rescue=
=20
and copy the entire 45GB drive over to the 120GB one.  I can't get vgreduce=
=20
to run correctly and pull it out of the VG.  When I run pvscan, I get:

NOTE:  I just booted up the box to get the output, and the 45GB disk was=20
working.  It hasn't been for about a week now.  I have successfully removed=
=20
the 120GB drive from the data VG.  Man, I gotta love having a little bit of=
=20
luck!  Wow. :D

I could just blow it all away and recreate the data VG from scratch, reload=
ing=20
from backups (and pulling down things like .iso images, etc.).  I would lik=
e=20
to figure out some techniques to try to recover this from here.  As I make =
my=20
living teaching over 1,000 people/year (newbies and experts alike) to use=20
Linux, I'd like to be able to use this experience to teach others how to=20
recover if they find themselves up the "Creek Who Should Not Be Named".

1.  How can I take an unused PV out of a VG with another PV that's broken?

2.  Once I have a copy of the entire bad drive's contents, how do I alter t=
he=20
VG (hand edit?) so that it is using the copy instead of the original.

3.  What am I not asking/seeing?

4.  Are there better ways I could have handled this (other than the obvious=
=20
like RAID to start with, etc.)?
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

--nextPart10396757.XPR4hjGbdd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBExC5IvkZHMmRgzLURAoL3AJ0fv2VamEB9LoBasCDD+paoJ7NnwACaAkwE
wdQ/g6ECbpLonlqS/7tFdE8=
=MJrL
-----END PGP SIGNATURE-----

--nextPart10396757.XPR4hjGbdd--
