Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8QM7nr20300
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 18:07:49 -0400
Received: from rwcrmhc13.comcast.net (rwcrmhc13.comcast.net [204.127.198.39])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8QM7j8X025005
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 18:07:45 -0400
Received: from oeverloper.lastditch.org (oeverloper.lastditch.org
	[192.168.27.73])
	by mn.org (8.12.8/8.12.5) with ESMTP id i8QM7cmB030785
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 17:07:38 -0500
Date: Sun, 26 Sep 2004 17:07:37 -0500
From: Derek Terveer <tervde@hawkmoon.mn.org>
Message-ID: <20040926220737.GA23540@hawkmoon.mn.org>
References: <20040926183429.26D9F73981@hormel.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20040926183429.26D9F73981@hormel.redhat.com>
Subject: [linux-lvm] LVM2: repairing a VG
Reply-To: derek.terveer@hawkmoon.mn.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Greetings,

I was running suse 9.0 with LVM1 and had a VG called USER with 4 PVs
in it.  I had attempted to add a raid 0 volume, /dev/md0, to the USER
vg but got an error - something like "address out of range."  The VG
was still available, but I couldn't add the device.  After that error,
I couldn't do much of anything with the VG w/o getting the same error.
I then upgraded the system to suse 9.1, which is running LVM2.  A vgscan
now shows the following:

glacis:~ # vgscan
  Reading all physical volumes.  This may take a while...
  3 PV(s) found for VG USER: expected 5
  Volume group "USER" not found
  Found volume group "DB" using metadata type lvm2
glacis:~ # pvscan
  3 PV(s) found for VG USER: expected 5
  Logical volume (lvol4) contains an incomplete mapping table.
  PV /dev/hdc3   VG USER   lvm1 [9.28 GB / 0    free]
  PV /dev/hda4   VG USER   lvm1 [14.16 GB / 0    free]
  PV /dev/sdc1   VG USER   lvm1 [16.81 GB / 0    free]
  PV /dev/hdc1   VG DB     lvm2 [9.28 GB / 288.00 MB free]
  PV /dev/hda3   VG DB     lvm2 [12.97 GB / 0    free]
  PV /dev/md0              lvm2 [16.93 GB]
  Total: 6 [79.43 GB] / in use: 5 [62.50 GB] / in no VG: 1 [16.93 GB]

(A few minutes ago it was 4 PVs found, expecting five.)
All the drives are still available, and there was nothing on /dev/md0.
Is there any way that I can get LVM to just see the original four drives
for VG USER?  That is:
	/dev/hda4
	/dev/hdc3
	/dev/sdc1
	/dev/sdd1

I don't know why sdd1 suddenly disappeared.  If I do an fdisk on it, it
shows up as an lvm device.

derek
--=20
Ne pas laisser vieillir les hommes doit =EF=BF=BDtre le grand art du gouver=
nement.
	- Napoleon I

dt at hawkmoon dot mn dot org
http://c-24-118-230-198.mn.client2.attbi.com
