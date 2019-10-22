Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43CDF10027A1
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 16:15:10 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B923A307F5ED
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 16:15:08 +0000 (UTC)
Date: Tue, 22 Oct 2019 12:15:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
Message-ID: <alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-1463811830-2053687769-1571760906=:1156"
Subject: Re: [linux-lvm] exposing snapshot block device
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
Cc: =?ISO-8859-15?Q?Dalebj=F6rk=2C_Tomas?= <tomas.dalebjork@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811830-2053687769-1571760906=:1156
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Oct 2019, Zdenek Kabelac wrote:

> Dne 22. 10. 19 v 17:29 Dalebj=EF=BF=BDrk, Tomas napsal(a):
>> But, it would be better if the cow device could be recreated in a faster=
=20
>> way, mentioning that all blocks are present on an external device, so th=
at=20
>> the LV volume can be restored much quicker using "lvconvert --merge"=20
>> command.

> I do not want to break your imagination here, but that is exactly the thi=
ng=20
> you can do with thin provisioning and thin_delta tool.

lvconvert --merge does a "rollback" to the point at which the snapshot
was taken.  The master LV already has current data.  What Tomas wants to
be able to do a "rollforward" from the point at which the snapshot was
taken.  He also wants to be able to put the cow volume on an
extern/remote medium, and add a snapshot using an already existing cow.

This way, restoring means copying the full volume from backup, creating
a snapshot using existing external cow, then lvconvert --merge=20
instantly logically applies the cow changes while updating the master
LV.

Pros:

"Old" snapshots are exactly as efficient as thin when there is exactly
one.  They only get inefficient with multiple snapshots.  On the other
hand, thin volumes are as inefficient as an old LV with one snapshot.
An old LV is as efficient, and as anti-fragile, as a partition.  Thin
volumes are much more flexible, but depend on much more fragile database
like meta-data.

For this reason, I always prefer "old" LVs when the functionality of
thin LVs are not actually needed.  I can even manually recover from
trashed meta data by editing it, as it is human readable text.

Updates to the external cow can be pipelined (but then properly
handling reads becomes non trivial - there are mature remote block
device implementations for linux that will do the job).

Cons:

For the external cow to be useful, updates to it must be *strictly*
serialized.  This is doable, but not as obvious or trivial as it might
seem at first glance.  (Remote block device software will take care
of this as well.)

The "rollforward" must be applied to the backup image of the snapshot.
If the admin gets it paired with the wrong backup, massive corruption
ensues.  This could be automated.  E.g. the full image backup and
external cow would have unique matching names.  Or the full image backup
could compute an md5 in parallel, which would be store with the cow.
But none of those tools currently exist.

--=20
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463811830-2053687769-1571760906=:1156--
