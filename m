Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BLdWtC009870
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:39:32 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BLdKFU023995
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:39:20 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BLdKvc002597
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:39:20 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BLdJpe005721
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:39:19 -0400
Date: Mon, 11 Oct 2010 17:39:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CB31DDC.5040206@johestephan.de>
Message-ID: <Pine.LNX.4.64.1010111737090.32080@bmsred.bmsi.com>
References: <4CB2C290.7040307@johestephan.de>
	<Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
	<4CB30A1B.8040609@johestephan.de>
	<Pine.LNX.4.64.1010110918570.25121@bmsred.bmsi.com>
	<4CB31DDC.5040206@johestephan.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-985708824-1286833159=:32080"
Subject: Re: [linux-lvm] Lvm Strange Problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-985708824-1286833159=:32080
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Oct 2010, J=EF=BF=BDrg Stephan wrote:

> > I believe your problem is with your SAN, not LVM (you did mention using
> > iSCSI).  I'm talking about SAN snapshots, not LVM snapshots (although t=
he
> > SAN server could very well use LVM underneath).  The SAN volumes have no
> > names, just LUNs.  At boot, they are searched for a matching UUID, just
> > like directly attached physical volumes.  When taking a SAN snapshot
> > (clone), the UUID of the clone is the same as the original, whether a
> > filesystem or VG is on the SAN LUN.
>=20
> Okay, but we dont use SAN snapshots, we use an lvcreate --snapshot on
> the client. So the storage just dont know about them.
>=20
> What happens is, we lv snapshot a volume, mount it copy the data to the
> new volume we create after snapshooting the source, remove the old
> snapshot and turning of the new machine. It rans about half an year,
> gets stoped, and after it turning on again the lvm data on the iscsi
> volume is last cahnged on the 23 februar 2010, even if the snapshot was
> made much earlier.

If the contents of (50% of) your SAN disks have reverted, then your issue
is with SAN (iSCSI is a SAN protocol), not with LVM. =20

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-985708824-1286833159=:32080--
