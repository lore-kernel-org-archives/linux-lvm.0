Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GMxApH024602
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 18:59:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GMW4Rn030088
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 18:32:04 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m9GMVr5V024058
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 18:31:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.13.8/8.13.8) with ESMTP id m9GMVrSA014538
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 18:31:53 -0400
Date: Thu, 16 Oct 2008 18:31:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVs corrupted after pvresize
In-Reply-To: <48F7AD78.1000002@knebb.de>
Message-ID: <Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
References: <48F7AD78.1000002@knebb.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-1988648372-1224196313=:14457"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-1988648372-1224196313=:14457
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Oct 2008, Christian V=EF=BF=BDlker wrote:

> I'm currently in big troubles :-(
> What happened?
>=20
> I have a single VG running on three RAID arrays.
>=20
> I resized one of these RAID arrays for additional 250GB. After this was

Resizing a RAID-5 array is often not what you think, and doing so often
scrambles the data, depending on what RAID implementation you are using.  T=
hat
is why I stick with RAID-1.  Resizing is simple.  In any case, LVM
was not your problem.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-1988648372-1224196313=:14457--
