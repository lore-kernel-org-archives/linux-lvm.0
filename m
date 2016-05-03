Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u436xJ3i008835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 02:59:19 -0400
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 799DC81112
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 06:59:18 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id x19so13992560oix.2
	for <linux-lvm@redhat.com>; Mon, 02 May 2016 23:59:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <572317B4.9030309@redhat.com>
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
Date: Tue, 3 May 2016 08:59:17 +0200
Message-ID: <CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
From: Bhasker C V <bhasker@unixindia.com>
Content-Type: multipart/alternative; boundary=001a113d0e4cd4988d0531eaa5b2
Subject: Re: [linux-lvm] Lvm think provisioning query
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

--001a113d0e4cd4988d0531eaa5b2
Content-Type: text/plain; charset=UTF-8

Does this mean the ext4 is showing wrong information. The file is reported
being 90+MB but in actuality the size is less in the FS ?
This is quite ok because it is just that file system being affected. I was
however concerned that the file in this FS might have overwritten other LV
data since the file is showing bigger than the volume size.

I will try this using BTRFS.


On Fri, Apr 29, 2016 at 10:13 AM, Zdenek Kabelac <zkabelac@redhat.com>
wrote:

> On 28.4.2016 16:36, Bhasker C V wrote:
>
>> Zdenek,
>>   Thanks. Here I am just filling it up with random data and so I am not
>> concerned about data integrity
>>   You are right, I did get page lost during write errors in the kernel
>>
>> The question however is even after reboot and doing several fsck of the
>> ext4fs
>> the file size "occupied" is more than the pool size. How is this ?
>> I agree that data may be corrupted, but there *is* some data and this
>> must be
>> saved somewhere. Why is this "somewhere" exceeding the pool size ?
>>
>
> Hi
>
> Few key principles -
>
>
> 1. You should always mount extX fs with  errors=remount-ro  (tune2fs,mount)
>
> 2. There are few data={} modes ensuring various degree of data integrity,
>    An case you really care about data integrity here - switch to 'journal'
>    mode at price of lower speed. Default ordered mode might show this.
>    (i.e. it's the very same behavior as you would have seen with failing
> hdd)
>
> 3. Do not continue using thin-pool when it's full :)
>
> 4. We do miss more configurable policies with thin-pools.
>    i.e. do plan to instantiate 'error' target for writes in the case
>    pool gets full - so ALL writes will be errored - as of now - writes
>    to provisioned blocks may cause further filesystem confusion - that's
>    why  'remount-ro' is rather mandatory - xfs is recently being enhanced
>    to provide similar logic.
>
>
>
> Regards
>
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a113d0e4cd4988d0531eaa5b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Does this mean the ext4 is showing wrong informa=
tion. The file is reported being 90+MB but in actuality the size is less in=
 the FS ?<br></div></div><div>This is quite ok because it is just that file=
 system being affected. I was however concerned that the file in this FS mi=
ght have overwritten other LV data since the file is showing bigger than th=
e volume size. <br><br></div><div>I will try this using BTRFS.<br></div><br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Ap=
r 29, 2016 at 10:13 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 28.4.2016 1=
6:36, Bhasker C V wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Zdenek,<br>
=C2=A0 Thanks. Here I am just filling it up with random data and so I am no=
t<br>
concerned about data integrity<br>
=C2=A0 You are right, I did get page lost during write errors in the kernel=
<br>
<br>
The question however is even after reboot and doing several fsck of the ext=
4fs<br>
the file size &quot;occupied&quot; is more than the pool size. How is this =
?<br>
I agree that data may be corrupted, but there *is* some data and this must =
be<br>
saved somewhere. Why is this &quot;somewhere&quot; exceeding the pool size =
?<br>
</blockquote>
<br></span>
Hi<br>
<br>
Few key principles -<br>
<br>
<br>
1. You should always mount extX fs with=C2=A0 errors=3Dremount-ro=C2=A0 (tu=
ne2fs,mount)<br>
<br>
2. There are few data=3D{} modes ensuring various degree of data integrity,=
<br>
=C2=A0 =C2=A0An case you really care about data integrity here - switch to =
&#39;journal&#39;<br>
=C2=A0 =C2=A0mode at price of lower speed. Default ordered mode might show =
this.<br>
=C2=A0 =C2=A0(i.e. it&#39;s the very same behavior as you would have seen w=
ith failing hdd)<br>
<br>
3. Do not continue using thin-pool when it&#39;s full :)<br>
<br>
4. We do miss more configurable policies with thin-pools.<br>
=C2=A0 =C2=A0i.e. do plan to instantiate &#39;error&#39; target for writes =
in the case<br>
=C2=A0 =C2=A0pool gets full - so ALL writes will be errored - as of now - w=
rites<br>
=C2=A0 =C2=A0to provisioned blocks may cause further filesystem confusion -=
 that&#39;s<br>
=C2=A0 =C2=A0why=C2=A0 &#39;remount-ro&#39; is rather mandatory - xfs is re=
cently being enhanced<br>
=C2=A0 =C2=A0to provide similar logic.<div class=3D"HOEnZb"><div class=3D"h=
5"><br>
<br>
<br>
Regards<br>
<br>
<br>
Zdenek<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br></div>

--001a113d0e4cd4988d0531eaa5b2--
