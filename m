Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9R6wXSm031521
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 02:58:33 -0400
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9R6wUMw022234
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 02:58:32 -0400
Received: by mail-lb0-f177.google.com with SMTP id b6so1255707lbj.8
	for <linux-lvm@redhat.com>; Sun, 26 Oct 2014 23:58:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <544C2897.6020708@redhat.com>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
	<544C2897.6020708@redhat.com>
Date: Mon, 27 Oct 2014 09:58:30 +0300
Message-ID: <CADxRZqxDOZ4Usyp3bnWN9pvzyGD_C0tME1KGPZ1n+7mg8yoa8A@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=001a1132f26ae993400506620e4a
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
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

--001a1132f26ae993400506620e4a
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 26, 2014 at 1:47 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 25.10.2014 v 22:53 Vasiliy Tolstov napsal(a):
>>
>> 2014-10-26 0:18 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>>
>>> There is 'internal' metadata archive then -
>>>
>>> dd if=/dev/your_pv_volume  of=/tmp/1st.megabyte   bs=1M count=1
>>>
>>> It's will capture first megabyte of your PV where are embedded
>>> metadata of your Volume group.
>>>
>>> If you are not skilled enough - tar.gz and send this file to me.
>>
>>
>>
>> I'm do dd and send it. While i'm break thin pool i'm try to restore
volume 2657.
>> But i don't stop lvm thin pool =(.
>>
>
>
> From the metadata  something bad was going one:
>
> Fri Oct 24 17:03:04 2014
>
> transaction_id = 120  - create = "3695"
>
> And suddenly on Fri Oct 24 18:07:23 2014
> pool is back on older transaction_id
>
> transaction_id = 114
>
>
> Is that the time of your vgcfgrestore?
>
> I'm attaching those metadata which you likely should put back to get in
sync
> with your kernel metadata (assuming you have not modified those in any
way)

Zdenek,

can you please describe (possibly in details) what have you done with
tar.gz sent to you, so everyone would know what to do next time?

Thanks a lot!

--001a1132f26ae993400506620e4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>On Sun, Oct 26, 2014 at 1:47 AM, Zdenek Kabelac =
&lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; Dne 25.10.2014 v 22:53 Vasiliy Tolstov napsal(a):<br>&gt=
;&gt;<br>&gt;&gt; 2014-10-26 0:18 GMT+04:00 Zdenek Kabelac &lt;<a href=3D"m=
ailto:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt;:<br>&gt;&gt;&gt;<br>=
&gt;&gt;&gt; There is &#39;internal&#39; metadata archive then -<br>&gt;&gt=
;&gt;<br>&gt;&gt;&gt; dd if=3D/dev/your_pv_volume =C2=A0of=3D/tmp/1st.megab=
yte =C2=A0 bs=3D1M count=3D1<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; It&#39;s will =
capture first megabyte of your PV where are embedded<br>&gt;&gt;&gt; metada=
ta of your Volume group.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; If you are not ski=
lled enough - tar.gz and send this file to me.<br>&gt;&gt;<br>&gt;&gt;<br>&=
gt;&gt;<br>&gt;&gt; I&#39;m do dd and send it. While i&#39;m break thin poo=
l i&#39;m try to restore volume 2657.<br>&gt;&gt; But i don&#39;t stop lvm =
thin pool =3D(.<br>&gt;&gt;<br>&gt;<br>&gt;<br>&gt; From the metadata =C2=
=A0something bad was going one:<br>&gt;<br>&gt; Fri Oct 24 17:03:04 2014<br=
>&gt;<br>&gt; transaction_id =3D 120 =C2=A0- create =3D &quot;3695&quot;<br=
>&gt;<br>&gt; And suddenly on Fri Oct 24 18:07:23 2014<br>&gt; pool is back=
 on older transaction_id<br>&gt;<br>&gt; transaction_id =3D 114<br>&gt;<br>=
&gt;<br>&gt; Is that the time of your vgcfgrestore?<br>&gt;<br>&gt; I&#39;m=
 attaching those metadata which you likely should put back to get in sync<b=
r>&gt; with your kernel metadata (assuming you have not modified those in a=
ny way)<br><br>Zdenek,<br><br></div>can you please describe (possibly in de=
tails) what have you done with tar.gz sent to you, so everyone would know w=
hat to do next time?<br><br></div>Thanks a lot!<br><div><div><br><br></div>=
</div></div>

--001a1132f26ae993400506620e4a--
