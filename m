Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BDNC1q029762
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:23:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BDN0WV009652
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:23:01 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BDN0Ar021342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:23:00 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o9BDN0XT025406
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:23:00 -0400
Date: Mon, 11 Oct 2010 09:23:00 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CB30A1B.8040609@johestephan.de>
Message-ID: <Pine.LNX.4.64.1010110918570.25121@bmsred.bmsi.com>
References: <4CB2C290.7040307@johestephan.de>
	<Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
	<4CB30A1B.8040609@johestephan.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-1973727720-1286803380=:25121"
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

---1463799287-1973727720-1286803380=:25121
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Oct 2010, J=EF=BF=BDrg Stephan wrote:

> > It seems pretty clear that all your servers have both a snapshot and a
> > live LV.  At power up, they search for their disk and randomly find
> > either the live or the snapshot first.  You need to take the snapshots =

> > out of the search path.
> >
> well, mostly the snapshot was removed some days after they were made.
> Also the snapshots had of course different names, how could it be that
> they were used? And even if this, why are all machines with the failure
> bound to the same date?

I believe your problem is with your SAN, not LVM (you did mention using iSC=
SI).
I'm talking about SAN snapshots, not LVM snapshots (although the SAN server=
=20
could very well use LVM underneath).  The SAN volumes have no names, just
LUNs.  At boot, they are searched for a matching UUID, just like directly
attached physical volumes.  When taking a SAN snapshot (clone), the UUID
of the clone is the same as the original, whether a filesystem or VG is
on the SAN LUN.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-1973727720-1286803380=:25121--
