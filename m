Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DAwp3V023209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 05:58:51 -0500
Received: from smtp2.ugent.be (smtp2.ugent.be [157.193.49.126])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E98B04E4C7
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 10:58:49 +0000 (UTC)
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
	by smtp2.ugent.be (Postfix) with ESMTP id 314DDB2AC3
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 11:58:47 +0100 (CET)
Received: from smtp2.ugent.be ([157.193.49.126])
	by localhost (mcheck2.ugent.be [157.193.43.11]) (amavisd-new,
	port 10024) with ESMTP id 7tv1MLOzxQgX for <linux-lvm@redhat.com>;
	Mon, 13 Feb 2017 11:58:45 +0100 (CET)
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178]) (Authenticated sender: Jonas.Degrave@Ugent.be)
	by smtp2.ugent.be (Postfix) with ESMTPSA id 73F52B2ACD
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 11:58:45 +0100 (CET)
Received: by mail-qk0-f178.google.com with SMTP id u25so89744619qki.2
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 02:58:45 -0800 (PST)
MIME-Version: 1.0
From: Jonas Degrave <Jonas.Degrave@ugent.be>
Date: Mon, 13 Feb 2017 11:58:04 +0100
Message-ID: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1146f2c2c5e5ef05486754fa
Subject: [linux-lvm] Caching policy in machine learning context
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
To: linux-lvm@redhat.com

--001a1146f2c2c5e5ef05486754fa
Content-Type: text/plain; charset=UTF-8

Hi,

We are a group of scientists, who work on reasonably sized datasets
(10-100GB). Because we had troubles managing our SSD's (everyone likes to
have their data on the SSD), I set up a caching system where the 500GB SSD
caches the 4TB HD. This way, everybody would have their data virtually on
the SSD, and only the first pass through the dataset would be slow.
Afterwards, it would be cached anyway, and the reads would be faster.

I used lvm-cache for this. Yet, it seems that the (only) smq-policy is very
reluctant in promoting data to the cache, whereas what we would need, is
that data is promoted basically upon the first read. Because if someone is
using the machine on certain data, they will most likely go over the
dataset a couple of hundred times in the following hours.

Right now, after a week of testing lvm-cache with the smq-policy, it looks
like this:

jdgrave@kat:~$ sudo ./lvmstats
> start              0
> end                7516192768
> segment_type       cache
> md_block_size      8
> md_utilization     14353/1179648
> cache_block_size   128
> cache_utilization  7208960/7208960
> read_hits          19954892
> read_misses        84623959
> read_hit_ratio     19.08%
> write_hits         672621
> write_misses       7336700
> write_hit_ratio    8.40%
> demotions          151757
> promotions         151757
> dirty              0
> features           1


 jdgrave@kat:~$ sudo ./lvmcache-statistics.sh
> -------------------------------------------------------------------------
> LVM [2.02.133(2)] cache report of found device /dev/VG/lv
> -------------------------------------------------------------------------
> - Cache Usage: 100.0% - Metadata Usage: 1.2%
> - Read Hit Rate: 19.0% - Write Hit Rate: 8.3%
> - Demotions/Promotions/Dirty: 151757/151757/0
> - Feature arguments in use: writeback
> - Core arguments in use : migration_threshold 2048 smq 0
>   - Cache Policy: stochastic multiqueue (smq)
> - Cache Metadata Mode: rw
> - MetaData Operation Health: ok


The number of promotions has been very low, even though the read hit rate
is low as well. This is with a cache of 450GB, and currently only 614GB of
data on the cached device. A read hit rate of lower than 20%, when just
randomly caching would have achieved 73% is not what I would have hoped to
get.

Is there a way to make the caching way more aggressive? Some settings I can
tweak?

Yours sincerely,

Jonas

--001a1146f2c2c5e5ef05486754fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We are a group of scientists, who w=
ork on reasonably sized datasets (10-100GB). Because we had troubles managi=
ng our SSD&#39;s (everyone likes to have their data on the SSD), I set up a=
 caching system where the 500GB SSD caches the 4TB HD. This way, everybody =
would have their data virtually on the SSD, and only the first pass through=
 the dataset would be slow. Afterwards, it would be cached anyway, and the =
reads would be faster.</div><div><br></div><div>I used lvm-cache for this. =
Yet, it seems that the (only) smq-policy is very reluctant in promoting dat=
a to the cache, whereas what we would need, is that data is promoted basica=
lly upon the first read. Because if someone is using the machine on certain=
 data, they will most likely go over the dataset a couple of hundred times =
in the following hours.</div><div><br></div><div>Right now, after a week of=
 testing lvm-cache with the smq-policy, it looks like this:</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex">jdgrave@kat:~$ sudo ./lvmstats=C2=A0<br>start =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>end =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07516192768<br>segment_type =C2=A0 =C2=A0 =C2=
=A0 cache<br>md_block_size =C2=A0 =C2=A0 =C2=A08<br>md_utilization =C2=A0 =
=C2=A0 14353/1179648<br>cache_block_size =C2=A0 128<br>cache_utilization =
=C2=A07208960/7208960<br>read_hits =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0199548=
92<br>read_misses =C2=A0 =C2=A0 =C2=A0 =C2=A084623959<br>read_hit_ratio =C2=
=A0 =C2=A0 19.08%<br>write_hits =C2=A0 =C2=A0 =C2=A0 =C2=A0 672621<br>write=
_misses =C2=A0 =C2=A0 =C2=A0 7336700<br>write_hit_ratio =C2=A0 =C2=A08.40%<=
br>demotions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0151757<br>promotions =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 151757<br>dirty =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00<br>features =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</blockquote><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">=C2=A0jdgrave@kat:~$ sudo ./lvmcache-statisti=
cs.sh=C2=A0<br>------------------------------------------------------------=
-------------<br>LVM [2.02.133(2)] cache report of found device /dev/VG/lv<=
br>------------------------------------------------------------------------=
-<br>- Cache Usage: 100.0% - Metadata Usage: 1.2%<br>- Read Hit Rate: 19.0%=
 - Write Hit Rate: 8.3%<br>- Demotions/Promotions/Dirty: 151757/151757/0<br=
>- Feature arguments in use: writeback=C2=A0<br>- Core arguments in use : m=
igration_threshold 2048 smq 0=C2=A0<br>=C2=A0 - Cache Policy: stochastic mu=
ltiqueue (smq)<br>- Cache Metadata Mode: rw<br>- MetaData Operation Health:=
 ok</blockquote><div><br></div><div>The number of promotions has been very =
low, even though the read hit rate is low as well. This is with a cache of =
450GB, and currently only 614GB of data on the cached device. A read hit ra=
te of lower than 20%, when just randomly caching would have achieved 73% is=
 not what I would have hoped to get.</div><div><br></div><div>Is there a wa=
y to make the caching way more aggressive? Some settings I can tweak?</div>=
<div><br clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"=
><div><div dir=3D"ltr">Yours sincerely,<br><br>Jonas<br></div></div></div><=
/div></div>
</div></div>

--001a1146f2c2c5e5ef05486754fa--
