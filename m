Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GBPK4i013211
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:25:20 -0400
Received: from proxmox.maurer-it.com (www.maurer-it.com [213.129.239.114])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GBP5An016615
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 07:25:06 -0400
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 4C7553978165
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 12:25:03 +0100 (CET)
Received: from clara.maurer-it.com (clara.maurer-it.com [192.168.2.101])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 33AB83978163
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 12:25:03 +0100 (CET)
Subject: RE: [linux-lvm] fsync() and LVM
MIME-Version: 1.0
Content-class: urn:content-classes:message
Date: Mon, 16 Mar 2009 12:25:01 +0100
Message-ID: <7B7881568CF40E4388B615CD06F87B98098BE8@clara.maurer-it.com>
In-Reply-To: <49BE3577.6080503@Media-Brokers.com>
References: <49BA9BF9.3070507@esiway.net>	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net><49BE31CC.7050905@Media-Brokers.com><68c491a60903160405x763c22ep8012002fef4f0a73@mail.gmail.com>
	<49BE3577.6080503@Media-Brokers.com>
From: "Dietmar Maurer" <dietmar@proxmox.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

> On 3/16/2009, Martin Schr=EF=BF=BDder (martin@oneiros.de) wrote:
> > And how often has the computer crashed needing an fsck in those
> years?
> > It's most likely no problem if the fs is always unmounted cleanly.
>=20
> There have been probably 4 unclean shutdowns (due to extended power
> outages) in these 4 years, 2 of which required an extended fsck...
>=20
> Running reiserfs too...
>=20
> Zero problems to date (knock on wood)...

The question is if fsync is implemented correctly or not?

- Dietmar
