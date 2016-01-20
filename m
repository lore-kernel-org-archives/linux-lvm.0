Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0KCs8XL023897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 07:54:08 -0500
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E255F5DD9
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 12:54:07 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id m198so5215711lfm.0
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 04:54:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <569F78FA.4050104@redhat.com>
References: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
	<569F78FA.4050104@redhat.com>
Date: Wed, 20 Jan 2016 17:54:05 +0500
Message-ID: <CAEmTpZGM6SPnBavLPD48rgMPGZ_Q8oPxo4v9kgge7Ae5AS6X+A@mail.gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Content-Type: multipart/alternative; boundary=001a11420fba35a8df0529c37b15
Subject: Re: [linux-lvm] LVM and chain of snapshots
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
Cc: Alexander Patrakov <patrakov@gmail.com>, =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JHQsNC20YPQutC+0LI=?= <g.bazhukov@ideco.ru>

--001a11420fba35a8df0529c37b15
Content-Type: text/plain; charset=UTF-8

2016-01-20 17:09 GMT+05:00 Zdenek Kabelac <zkabelac@redhat.com>:

> ed sta



Thanks for the response, but I do not understand how thin-provisioning is
related to question i'm asking.

As far as I understand, if 20 snapshots are created even in
thin-provisioning mode, write to origin will be converted
to 21 writes. Does not it ? My scenario mean that no write multiplication
occurs while making "normal" operations in
userspace (i.e. not writing to snapshots, while origin is under heavy
write-load). Also, my scenario adds functionality
of "snapshot of snapshot" easily. The case I'm trying to discuss is
something like chain of qcow2 files used to make
live snapshots in KVM.

Use case: having such snapshot every day. And after snapshot count exceed
30, meld first snapshot into it's origin.
This operation should be possible without any unmounting. After merging,
that snapshot should contain empty diff
and so may be eliminated from chain via replacing dmsetup tables.

If someone wants to rollback - he just remove some tail of the chain +
rename last item, or, create generic snapshot
from any colume in chain, or just use some point in chain. everything will
work as expected.

In other words, my proposal is not connected to low-level things in LVM.
Yes, all snapshots I describe can be
thin-provisioned. Just minimal logic, CLI and XML should extended.


-- 
Segmentation fault

--001a11420fba35a8df0529c37b15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2016-01-20 17:09 GMT+05:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"=
mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</=
span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">ed sta</blockquote></div><br><br><=
/div><div class=3D"gmail_extra">Thanks for the response, but I do not under=
stand how thin-provisioning is related to question i&#39;m asking.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">As far as I un=
derstand, if 20 snapshots are created even in thin-provisioning mode, write=
 to origin will be converted</div><div class=3D"gmail_extra">to 21 writes. =
Does not it ? My scenario mean that no write multiplication occurs while ma=
king &quot;normal&quot; operations in</div><div class=3D"gmail_extra">users=
pace (i.e. not writing to snapshots, while origin is under heavy write-load=
). Also, my scenario adds functionality</div><div class=3D"gmail_extra">of =
&quot;snapshot of snapshot&quot; easily. The case I&#39;m trying to discuss=
 is something like chain of qcow2 files used to make</div><div class=3D"gma=
il_extra">live snapshots in KVM.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Use case: having such snapshot every day. And af=
ter snapshot count exceed 30, meld first snapshot into it&#39;s origin.</di=
v><div class=3D"gmail_extra">This operation should be possible without any =
unmounting. After merging, that snapshot should contain empty diff</div><di=
v class=3D"gmail_extra">and so may be eliminated from chain via replacing d=
msetup tables.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">If someone wants to rollback - he just remove some tail of the cha=
in + rename last item, or, create generic snapshot</div><div class=3D"gmail=
_extra">from any colume in chain, or just use some point in chain. everythi=
ng will work as expected.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">In other words, my proposal is not connected to low-lev=
el things in LVM. Yes, all snapshots I describe can be</div><div class=3D"g=
mail_extra">thin-provisioned. Just minimal logic, CLI and XML should extend=
ed.</div><div class=3D"gmail_extra"><br><div><br></div>-- <br><div class=3D=
"gmail_signature">Segmentation fault</div>
</div></div>

--001a11420fba35a8df0529c37b15--
