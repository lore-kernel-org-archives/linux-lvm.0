Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C732D5A1
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 13:31:15 +0000 (UTC)
Received: from smtp2.ugent.be (smtp2.ugent.be [157.193.49.126])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B50A2804EB
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 13:31:13 +0000 (UTC)
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
	by smtp2.ugent.be (Postfix) with ESMTP id 92C0BB2928
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 14:31:11 +0100 (CET)
Received: from smtp2.ugent.be ([157.193.49.126])
	by localhost (mcheck2.ugent.be [157.193.43.11]) (amavisd-new,
	port 10024) with ESMTP id DKAJjLe2mCfp for <linux-lvm@redhat.com>;
	Wed, 15 Feb 2017 14:31:11 +0100 (CET)
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176]) (Authenticated sender: Jonas.Degrave@Ugent.be)
	by smtp2.ugent.be (Postfix) with ESMTPSA id 638DEB292D
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 14:31:10 +0100 (CET)
Received: by mail-qt0-f176.google.com with SMTP id k15so137145918qtg.3
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 05:31:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a7ce046a-ec7f-f2fd-0ce4-8b76da0b2d95@gmail.com>
References: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
	<7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
	<CAPWV3hunUyuPY2UMPQS_2OSenEMt4Ygb2Kn1+q00_+e5BOyR4Q@mail.gmail.com>
	<a7ce046a-ec7f-f2fd-0ce4-8b76da0b2d95@gmail.com>
From: Jonas Degrave <Jonas.Degrave@ugent.be>
Date: Wed, 15 Feb 2017 14:30:29 +0100
Message-ID: <CAPWV3hs33y93mcExFJwXO5RBVnCo87k0UxZQ9vJKQmBOUoaQ3g@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11467a6688b0ff054891b1a2
Subject: Re: [linux-lvm] Caching policy in machine learning context
Reply-To: Jonas.Degrave@ugent.be,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a11467a6688b0ff054891b1a2
Content-Type: text/plain; charset=UTF-8

Thanks, I tried your suggestions, and tried going back to the mq policy and
play with those parameters. In the end, I tried:

lvchange --cachesettings 'migration_threshold=20000000
> sequential_threshold=10000000 read_promote_adjustment=1
> write_promote_adjustment=4' VG
>

With little success. This is probably due to the mq-policy looking only at
the hit-count, rather than the hit-rate. Or at least, that is what I make
up from line 595 in the code:
http://lxr.free-electrons.com/source/drivers/md/dm-cache-policy-mq.c?v=3.19#L595

I wrote a small script, so my users could empty the cache manually, if they
want to:

#!/bin/bash
> if [ "$(id -u)" != "0" ]; then
>    echo "This script must be run as root" 1>&2
>    exit 1
> fi
> lvremove -y VG/lv_cache
> lvcreate -L 445G -n lv_cache VG /dev/sda
> lvcreate -L 1G -n lv_cache_meta VG /dev/sda
> lvconvert -y --type cache-pool --poolmetadata VG/lv_cache_meta VG/lv_cache
> lvchange --cachepolicy smq VG
> lvconvert --type cache --cachepool VG/lv_cache VG/lv


So, the only remaining option for me, would to write my own policy. This
should be quite simple, as you basically need to act as if the cache is not
full yet.

Can someone point me in the right direction as to how to do this? I have
tried to find the last version of the code, but the best I could find was a
redhat CVS-server which times out when connecting.

cvs -d :pserver:cvs@sources.redhat.com:/cvs/dm login cvs
> CVS password:
> cvs [login aborted]: connect to sources.redhat.com(209.132.183.64):2401
> failed: Connection timed out


 Can someone direct me to the latest source of the smq-policy?

Yours sincerely,

Jonas

On 13 February 2017 at 15:33, Zdenek Kabelac <zdenek.kabelac@gmail.com>
wrote:

> Dne 13.2.2017 v 15:19 Jonas Degrave napsal(a):
>
>> I am on kernel version 4.4.0-62-generic. I cannot upgrade to kernel 4.9,
>> as it
>> did not play nice with
>> CUDA-drivers: https://devtalk.nvidia.com/def
>> ault/topic/974733/nvidia-linux-driver-367-57-and-up-do-not-
>> install-on-kernel-4-9-0-rc2-and-higher/
>> <https://devtalk.nvidia.com/default/topic/974733/nvidia-linu
>> x-driver-367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/>
>>
>> Yes, I understand the cache needs repeated usage of blocks, but my
>> question is
>> basically how many? And if I can lower that number?
>>
>> In our use case, you basically read a certain group of 100GB of data
>> completely about 100 times. Then another user logs in, and reads a
>> different
>> group of data about 100 times. But after a couple of such users, I observe
>> that only 20GB in total has been promoted to the cache. Even though the
>> cache
>> is 450GB big, and could easily fit all the data one user would need.
>>
>> So, I come to the conclusion that I need a more aggressive policy.
>>
>> I now have a reported hit rate of 19.0%, when there is so few data on the
>> volume that 73% of the data would fit in the cache. I could probably solve
>> this issue by making the caching policy more aggressive. I am looking for
>> a
>> way to do that.
>>
>
> There are 2 'knobs' - one is 'sequential_threshold' where cache tries
> to avoid promoting 'long' continuous reads into cache  - so if
> you do 100G reads then these likely meet the criteria and are avoided from
> being promoted (and I think this one is not configurable for smq.
>
> Other is 'migration_threshold' which limit bandwidth load on cache device.
>
> You can try to change its value:
>
> lvchange --cachesettings migration_threshold=10000000  vg/cachedlv
>
> (check with dmsetup status)
>
> Not sure thought how are there things configurable with smq cache policy.
>
> Regards
>
> Zdenek
>
>

--001a11467a6688b0ff054891b1a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I tried your suggestions, and tried going back to =
the mq policy and play with those parameters. In the end, I tried:<div><br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">lvchange --cachesettings &#39;migration_threshold=3D200000=
00 sequential_threshold=3D10000000 read_promote_adjustment=3D1 write_promot=
e_adjustment=3D4&#39; VG<br></blockquote><div><br></div><div>With little su=
ccess. This is probably due to the mq-policy looking only at the hit-count,=
 rather than the hit-rate. Or at least, that is what I make up from line 59=
5 in the code: <a href=3D"http://lxr.free-electrons.com/source/drivers/md/d=
m-cache-policy-mq.c?v=3D3.19#L595">http://lxr.free-electrons.com/source/dri=
vers/md/dm-cache-policy-mq.c?v=3D3.19#L595</a></div></div><div><br></div><d=
iv>I wrote a small script, so my users could empty the cache manually, if t=
hey want to:</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">#!/bin/bash<br>if [ &quot=
;$(id -u)&quot; !=3D &quot;0&quot; ]; then<br>=C2=A0 =C2=A0echo &quot;This =
script must be run as root&quot; 1&gt;&amp;2<br>=C2=A0 =C2=A0exit 1<br>fi<b=
r>lvremove -y VG/lv_cache<br>lvcreate -L 445G -n lv_cache VG /dev/sda<br>lv=
create -L 1G -n lv_cache_meta VG /dev/sda<br>lvconvert -y --type cache-pool=
 --poolmetadata VG/lv_cache_meta VG/lv_cache<br>lvchange --cachepolicy smq =
VG<br>lvconvert --type cache --cachepool VG/lv_cache VG/lv</blockquote><div=
><br></div><div>So, the only remaining option for me, would to write my own=
 policy. This should be quite simple, as you basically need to act as if th=
e cache is not full yet.</div><div><br></div><div>Can someone point me in t=
he right direction as to how to do this? I have tried to find the last vers=
ion of the code, but the best I could find was a redhat CVS-server which ti=
mes out when connecting.</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">cvs -d :pserv=
er:cvs@sources.redhat.com:/cvs/dm login cvs<br>CVS password:=C2=A0<br>cvs [=
login aborted]: connect to <a href=3D"http://sources.redhat.com">sources.re=
dhat.com</a>(209.132.183.64):2401 failed: Connection timed out</blockquote>=
<div>=C2=A0</div><div>=C2=A0Can someone direct me to the latest source of t=
he smq-policy?</div><div><br></div><div class=3D"gmail_extra"><div><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
<div><div dir=3D"ltr">Yours sincerely,<br><br>Jonas<br></div></div></div></=
div></div>
<br><div class=3D"gmail_quote">On 13 February 2017 at 15:33, Zdenek Kabelac=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=
=3D"_blank">zdenek.kabelac@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Dne 13.2.2017 v 15:19 Jonas Degrave napsal(a):<span class=
=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I am on kernel version 4.4.0-62-generic. I cannot upgrade to kernel 4.9, as=
 it<br>
did not play nice with<br>
CUDA-drivers: <a href=3D"https://devtalk.nvidia.com/default/topic/974733/nv=
idia-linux-driver-367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-high=
er/" rel=3D"noreferrer" target=3D"_blank">https://devtalk.nvidia.com/def<wb=
r>ault/topic/974733/nvidia-linux<wbr>-driver-367-57-and-up-do-not-<wbr>inst=
all-on-kernel-4-9-0-rc2-<wbr>and-higher/</a><br>
&lt;<a href=3D"https://devtalk.nvidia.com/default/topic/974733/nvidia-linux=
-driver-367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/" rel=
=3D"noreferrer" target=3D"_blank">https://devtalk.nvidia.com/de<wbr>fault/t=
opic/974733/nvidia-linu<wbr>x-driver-367-57-and-up-do-not-<wbr>install-on-k=
ernel-4-9-0-rc2-<wbr>and-higher/</a>&gt;<br>
<br>
Yes, I understand the cache needs repeated usage of blocks, but my question=
 is<br>
basically how many? And if I can lower that number?<br>
<br>
In our use case, you basically read a certain group of 100GB of data<br>
completely about 100 times. Then another user logs in, and reads a differen=
t<br>
group of data about 100 times. But after a couple of such users, I observe<=
br>
that only 20GB in total has been promoted to the cache. Even though the cac=
he<br>
is 450GB big, and could easily fit all the data one user would need.<br>
<br>
So, I come to the conclusion that I need a more aggressive policy.<br>
<br>
I now have a reported hit rate of 19.0%, when there is so few data on the<b=
r>
volume that 73% of the data would fit in the cache. I could probably solve<=
br>
this issue by making the caching policy more aggressive. I am looking for a=
<br>
way to do that.<br>
</blockquote>
<br></span>
There are 2 &#39;knobs&#39; - one is &#39;sequential_threshold&#39; where c=
ache tries<br>
to avoid promoting &#39;long&#39; continuous reads into cache=C2=A0 - so if=
<br>
you do 100G reads then these likely meet the criteria and are avoided from<=
br>
being promoted (and I think this one is not configurable for smq.<br>
<br>
Other is &#39;migration_threshold&#39; which limit bandwidth load on cache =
device.<br>
<br>
You can try to change its value:<br>
<br>
lvchange --cachesettings migration_threshold=3D10000000=C2=A0 vg/cachedlv<b=
r>
<br>
(check with dmsetup status)<br>
<br>
Not sure thought how are there things configurable with smq cache policy.<b=
r>
<br>
Regards<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Zdenek<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11467a6688b0ff054891b1a2--
