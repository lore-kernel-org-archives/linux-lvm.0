Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0KAbFgm019594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 05:37:15 -0500
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mx1.redhat.com (Postfix) with ESMTPS id 46E1C1C5F52
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 10:37:14 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id oh2so2614648lbb.3
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 02:37:14 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 20 Jan 2016 15:37:12 +0500
Message-ID: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c33a66aa50af0529c19168
Subject: [linux-lvm] LVM and chain of snapshots
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
To: linux-lvm@redhat.com, Alexander Patrakov <patrakov@gmail.com>, =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JHQsNC20YPQutC+0LI=?= <g.bazhukov@ideco.ru>

--001a11c33a66aa50af0529c19168
Content-Type: text/plain; charset=UTF-8

I am aware that this subject was raised in mailing lists, but I haven't
found an obvious solution there.

Why not to add an option to lvcreate when creating snapshots, to switch
origin and snapshot ?

I mean that while (in this mode) creating snapshot named xxx of volume name
yyy, the following should be done:

1. xxx-real dmsetup volume is created with identical table as in yyy
2. yyy-cow dmsetup volume is created to store snapshot data
3. yyy is switched to table "snapshot xxx-real yyy-cow"
4. xxx created as "snapshot-origin xxx-real"

So, if FS was mounted from yyy, after creating such snapshot, all writes on
that FS should go to yyy-cow actually.

Note, performance of the writes to yyy will not be affected (comparing to
creating generic snapshot as usual).

At this stage, picture is the following:

[original=linear=xxx] -> [snapshot=yyy referring xxx (mounted FS)]

Next, user may decide to create new snapshot named zzz of volume yyy in
this new mode. After that picture will look like:

[original=linear=xxx] -> [snapshot=zzz referring xxx] -> [snapshot=yyy
referring zzz (mounted FS)]

Note, that having  plenty snapshots in that mode will not affect write
performance of yyy. Yes, performance of read operations may slightly suffer
since require to lookup chain of snapshots, but this is much less
performance impact comparing to writes to original when plenty snapshots
created (in generic mode).

Next, this structure allows merging (i.e. zzz into xxx for example)
snapshots in chain easily.

P.S. we may call this operation "split origin" instead of "create snapshot"

-- 
Segmentation fault

--001a11c33a66aa50af0529c19168
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am aware that this subject was raised in mailing lists, =
but I haven&#39;t found an obvious solution there.<div><br></div><div>Why n=
ot to add an option to lvcreate when creating snapshots, to switch origin a=
nd snapshot ?</div><div><br></div><div>I mean that while (in this mode) cre=
ating snapshot named xxx of volume name yyy, the following should be done:<=
/div><div><br></div><div>1. xxx-real dmsetup volume is created with identic=
al table as in yyy</div><div>2. yyy-cow dmsetup volume is created to store =
snapshot data</div><div>3. yyy is switched to table &quot;snapshot xxx-real=
 yyy-cow&quot;<br></div><div>4. xxx created as &quot;snapshot-origin xxx-re=
al&quot;</div><div><br></div><div>So, if FS was mounted from yyy, after cre=
ating such snapshot, all writes on that FS should go to yyy-cow actually.<b=
r><br><div><div>Note, performance of the writes to yyy will not be affected=
 (comparing to creating generic snapshot as usual).</div><div><br></div><di=
v>At this stage, picture is the following:</div><div><br></div><div>[origin=
al=3Dlinear=3Dxxx] -&gt; [snapshot=3Dyyy referring xxx (mounted FS)]<br></d=
iv><div><br>Next, user may decide to create new snapshot named zzz of volum=
e yyy in this new mode. After that picture will look like:</div><div><br></=
div><div>[original=3Dlinear=3Dxxx] -&gt; [snapshot=3Dzzz referring xxx] -&g=
t; [snapshot=3Dyyy referring zzz (mounted FS)]<br></div><div><br></div><div=
>Note, that having =C2=A0plenty snapshots in that mode will not affect writ=
e performance of yyy. Yes, performance of read operations may slightly suff=
er=C2=A0</div><div>since require to lookup chain of snapshots, but this is =
much less performance impact comparing to writes to original when plenty sn=
apshots created (in generic mode).</div><div><br></div><div>Next, this stru=
cture allows merging (i.e. zzz into xxx for example) snapshots in chain eas=
ily.</div><div><br></div><div>P.S. we may call this operation &quot;split o=
rigin&quot; instead of &quot;create snapshot&quot;</div><div><br></div><div=
>-- <br>Segmentation fault</div></div></div></div>

--001a11c33a66aa50af0529c19168--
