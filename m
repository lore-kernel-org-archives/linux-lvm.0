Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDH3o101177
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:03:50 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.177])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBDH3hVq031053
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:03:44 -0500
Message-ID: <439EFF3A.8060301@gmx.net>
Date: Tue, 13 Dec 2005 18:04:58 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple lvm2-snapshots on the same
	origin	->	device-mapper error
References: <439EB4BB.2070009@web.de>	<20051213122545.GF25866@agk.surrey.redhat.com>
	<439ED1E3.8020607@web.de>
In-Reply-To: <439ED1E3.8020607@web.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Patrick Reinhardt schrieb:
> Hi!
> Thank you for the hints.
>=20
> Alasdair G Kergon schrieb:
>=20
>=20
>>We don't have a solution for that particular problem yet, but we do
>=20
> have code
>=20
>>changes that should avoid the risk of the system locking up when it
>=20
> happens.
>=20
>=20
> In fact I need about 40 snapshots of a single filesystem for xen. Do you
> have any idea how to circumvent the problem? Maybe by creating 3
> identical origin filesystems and distribute the snapshots?
Looks to me like you really want a kind of cluster filesystem ...

Ciao
Klaus
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
