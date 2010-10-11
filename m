Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9BDCZjt001292
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:12:35 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BDCOsE009929
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:12:24 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BDCNAr021115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:12:23 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BDCNRT025344
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:12:23 -0400
Date: Mon, 11 Oct 2010 09:12:23 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.1010110846230.25121@bmsred.bmsi.com>
References: <4CB2C290.7040307@johestephan.de>
	<Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-705095475-1286802743=:25121"
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

---1463799287-705095475-1286802743=:25121
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Oct 2010, Stuart D. Gathman wrote:

> On Mon, 11 Oct 2010, J=EF=BF=BDrg Stephan wrote:
>=20
> > We powered them up, and about 50% of the more than 30 servers on the
> > iscsi were timestamped 23. feb 2010.
> >=20
> > For now it seems that most of the freezed systems were snapshoted last =
year.
>=20
> It seems pretty clear that all your servers have both a snapshot and a
> live LV.  At power up, they search for their disk and randomly find
> either the live or the snapshot first.  You need to take the snapshots=20
> out of the search path.

Alternatively, you might change the UUID of the contained VG or filesystem
when taking a snapshot. =20

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-705095475-1286802743=:25121--
