Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A82D5D6A9
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 17:02:27 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C8513082A98
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 17:02:26 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id y127so13732278lfc.0
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 10:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
In-Reply-To: <alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Tue, 22 Oct 2019 19:02:14 +0200
Message-ID: <CACrcyf+tO5XAA_qSL09HY2_MVEorAntW2ARo-Hus388SOfDNag@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ab96cb059582c3a1"
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
To: "Stuart D. Gathman" <stuart@gathman.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000ab96cb059582c3a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for feedbak.

Think of lvmsync as a tool, which reads the block changes from the cow
device.
<offset><chunk_size><data>...
Lets assume that I am able to recreate this cow format instantly back to
the server,
and present this as a file with the name "cowfile" on the file system for
simplicity.

Is it possible than in some way, to use this cowfile in someway to inform
LVM about the location of the snapshot area, so that lvconvert --merge can
be used to restore the data quicker, using this cowfile.

The cowfile will include all blocks for the logical volume.

Regards Tomas

Den tis 22 okt. 2019 kl 18:15 skrev Stuart D. Gathman <stuart@gathman.org>:

> On Tue, 22 Oct 2019, Zdenek Kabelac wrote:
>
> > Dne 22. 10. 19 v 17:29 Dalebj=C3=B6rk, Tomas napsal(a):
> >> But, it would be better if the cow device could be recreated in a
> faster
> >> way, mentioning that all blocks are present on an external device, so
> that
> >> the LV volume can be restored much quicker using "lvconvert --merge"
> >> command.
>
> > I do not want to break your imagination here, but that is exactly the
> thing
> > you can do with thin provisioning and thin_delta tool.
>
> lvconvert --merge does a "rollback" to the point at which the snapshot
> was taken.  The master LV already has current data.  What Tomas wants to
> be able to do a "rollforward" from the point at which the snapshot was
> taken.  He also wants to be able to put the cow volume on an
> extern/remote medium, and add a snapshot using an already existing cow.
>
> This way, restoring means copying the full volume from backup, creating
> a snapshot using existing external cow, then lvconvert --merge
> instantly logically applies the cow changes while updating the master
> LV.
>
> Pros:
>
> "Old" snapshots are exactly as efficient as thin when there is exactly
> one.  They only get inefficient with multiple snapshots.  On the other
> hand, thin volumes are as inefficient as an old LV with one snapshot.
> An old LV is as efficient, and as anti-fragile, as a partition.  Thin
> volumes are much more flexible, but depend on much more fragile database
> like meta-data.
>
> For this reason, I always prefer "old" LVs when the functionality of
> thin LVs are not actually needed.  I can even manually recover from
> trashed meta data by editing it, as it is human readable text.
>
> Updates to the external cow can be pipelined (but then properly
> handling reads becomes non trivial - there are mature remote block
> device implementations for linux that will do the job).
>
> Cons:
>
> For the external cow to be useful, updates to it must be *strictly*
> serialized.  This is doable, but not as obvious or trivial as it might
> seem at first glance.  (Remote block device software will take care
> of this as well.)
>
> The "rollforward" must be applied to the backup image of the snapshot.
> If the admin gets it paired with the wrong backup, massive corruption
> ensues.  This could be automated.  E.g. the full image backup and
> external cow would have unique matching names.  Or the full image backup
> could compute an md5 in parallel, which would be store with the cow.
> But none of those tools currently exist.
>
> --
>               Stuart D. Gathman <stuart@gathman.org>
> "Confutatis maledictis, flamis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.

--000000000000ab96cb059582c3a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for feedbak.</div><div><br></div><div>Think of=
 lvmsync as a tool, which reads the block changes from the cow device.</div=
><div><span style=3D"font-family:monospace">&lt;offset&gt;&lt;chunk_size&gt=
;&lt;data&gt;...</span></div><div>Lets assume that I am able to recreate th=
is cow format instantly back to the server,</div><div>and present this as a=
 file with the name &quot;cowfile&quot; on the file system for simplicity.<=
br></div><div><br></div><div>Is it possible than in some way, to use this c=
owfile in someway to inform LVM about the location of the snapshot area, so=
 that <span style=3D"font-family:monospace">lvconvert --merge</span> can be=
 used to restore the data quicker, using this cowfile.</div><div><br></div>=
<div>The cowfile will include all blocks for the logical volume.</div><div>=
<br></div><div>Regards Tomas<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Den tis 22 okt. 2019 kl 18:15 skrev S=
tuart D. Gathman &lt;<a href=3D"mailto:stuart@gathman.org">stuart@gathman.o=
rg</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, 22 Oct 2019, Zdenek Kabelac wrote:<br>
<br>
&gt; Dne 22. 10. 19 v 17:29 Dalebj=C3=B6rk, Tomas napsal(a):<br>
&gt;&gt; But, it would be better if the cow device could be recreated in a =
faster <br>
&gt;&gt; way, mentioning that all blocks are present on an external device,=
 so that <br>
&gt;&gt; the LV volume can be restored much quicker using &quot;lvconvert -=
-merge&quot; <br>
&gt;&gt; command.<br>
<br>
&gt; I do not want to break your imagination here, but that is exactly the =
thing <br>
&gt; you can do with thin provisioning and thin_delta tool.<br>
<br>
lvconvert --merge does a &quot;rollback&quot; to the point at which the sna=
pshot<br>
was taken.=C2=A0 The master LV already has current data.=C2=A0 What Tomas w=
ants to<br>
be able to do a &quot;rollforward&quot; from the point at which the snapsho=
t was<br>
taken.=C2=A0 He also wants to be able to put the cow volume on an<br>
extern/remote medium, and add a snapshot using an already existing cow.<br>
<br>
This way, restoring means copying the full volume from backup, creating<br>
a snapshot using existing external cow, then lvconvert --merge <br>
instantly logically applies the cow changes while updating the master<br>
LV.<br>
<br>
Pros:<br>
<br>
&quot;Old&quot; snapshots are exactly as efficient as thin when there is ex=
actly<br>
one.=C2=A0 They only get inefficient with multiple snapshots.=C2=A0 On the =
other<br>
hand, thin volumes are as inefficient as an old LV with one snapshot.<br>
An old LV is as efficient, and as anti-fragile, as a partition.=C2=A0 Thin<=
br>
volumes are much more flexible, but depend on much more fragile database<br=
>
like meta-data.<br>
<br>
For this reason, I always prefer &quot;old&quot; LVs when the functionality=
 of<br>
thin LVs are not actually needed.=C2=A0 I can even manually recover from<br=
>
trashed meta data by editing it, as it is human readable text.<br>
<br>
Updates to the external cow can be pipelined (but then properly<br>
handling reads becomes non trivial - there are mature remote block<br>
device implementations for linux that will do the job).<br>
<br>
Cons:<br>
<br>
For the external cow to be useful, updates to it must be *strictly*<br>
serialized.=C2=A0 This is doable, but not as obvious or trivial as it might=
<br>
seem at first glance.=C2=A0 (Remote block device software will take care<br=
>
of this as well.)<br>
<br>
The &quot;rollforward&quot; must be applied to the backup image of the snap=
shot.<br>
If the admin gets it paired with the wrong backup, massive corruption<br>
ensues.=C2=A0 This could be automated.=C2=A0 E.g. the full image backup and=
<br>
external cow would have unique matching names.=C2=A0 Or the full image back=
up<br>
could compute an md5 in parallel, which would be store with the cow.<br>
But none of those tools currently exist.<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stuart D. Gathman &lt;<a h=
ref=3D"mailto:stuart@gathman.org" target=3D"_blank">stuart@gathman.org</a>&=
gt;<br>
&quot;Confutatis maledictis, flamis acribus addictis&quot; - background son=
g for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.</blockquote></div>

--000000000000ab96cb059582c3a1--
