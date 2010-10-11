Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BCf0Vj015914
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 08:41:00 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BCem5J029313
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 08:40:48 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BCeciZ020242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 08:40:38 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BCebpO025102
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 08:40:37 -0400
Date: Mon, 11 Oct 2010 08:40:37 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CB2C290.7040307@johestephan.de>
Message-ID: <Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
References: <4CB2C290.7040307@johestephan.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-1646198208-1286800837=:25038"
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

---1463799287-1646198208-1286800837=:25038
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Oct 2010, J=EF=BF=BDrg Stephan wrote:

> We powered them up, and about 50% of the more than 30 servers on the
> iscsi were timestamped 23. feb 2010.
>=20
> For now it seems that most of the freezed systems were snapshoted last ye=
ar.

It seems pretty clear that all your servers have both a snapshot and a
live LV.  At power up, they search for their disk and randomly find
either the live or the snapshot first.  You need to take the snapshots=20
out of the search path.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-1646198208-1286800837=:25038--
