Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DEKWaS006951
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 09:20:32 -0500
Received: from smtp2.ugent.be (smtp2.ugent.be [157.193.49.126])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C08F8046D
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 14:20:30 +0000 (UTC)
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
	by smtp2.ugent.be (Postfix) with ESMTP id A0771B2954
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 15:20:27 +0100 (CET)
Received: from smtp2.ugent.be ([157.193.49.126])
	by localhost (mcheck2.ugent.be [157.193.43.11]) (amavisd-new,
	port 10024) with ESMTP id 2tDKny-QXDGp for <linux-lvm@redhat.com>;
	Mon, 13 Feb 2017 15:20:26 +0100 (CET)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170]) (Authenticated sender: Jonas.Degrave@Ugent.be)
	by smtp2.ugent.be (Postfix) with ESMTPSA id 5F7E8B2876
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 15:20:26 +0100 (CET)
Received: by mail-qt0-f170.google.com with SMTP id x49so84120524qtc.2
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 06:20:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
References: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
	<7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
From: Jonas Degrave <Jonas.Degrave@ugent.be>
Date: Mon, 13 Feb 2017 15:19:45 +0100
Message-ID: <CAPWV3hunUyuPY2UMPQS_2OSenEMt4Ygb2Kn1+q00_+e5BOyR4Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113f42e60905f405486a26c5
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

--001a113f42e60905f405486a26c5
Content-Type: text/plain; charset=UTF-8

I am on kernel version 4.4.0-62-generic. I cannot upgrade to kernel 4.9, as
it did not play nice with CUDA-drivers: https://devtalk.
nvidia.com/default/topic/974733/nvidia-linux-driver-
367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/

Yes, I understand the cache needs repeated usage of blocks, but my question
is basically how many? And if I can lower that number?

In our use case, you basically read a certain group of 100GB of data
completely about 100 times. Then another user logs in, and reads a
different group of data about 100 times. But after a couple of such users,
I observe that only 20GB in total has been promoted to the cache. Even
though the cache is 450GB big, and could easily fit all the data one user
would need.

So, I come to the conclusion that I need a more aggressive policy.

I now have a reported hit rate of 19.0%, when there is so few data on the
volume that 73% of the data would fit in the cache. I could probably solve
this issue by making the caching policy more aggressive. I am looking for a
way to do that.

Sincerely,

Jonas

On 13 February 2017 at 13:55, Zdenek Kabelac <zdenek.kabelac@gmail.com>
wrote:

> Dne 13.2.2017 v 11:58 Jonas Degrave napsal(a):
>
> Hi,
>>
>> We are a group of scientists, who work on reasonably sized datasets
>> (10-100GB). Because we had troubles managing our SSD's (everyone likes to
>> have
>> their data on the SSD), I set up a caching system where the 500GB SSD
>> caches
>> the 4TB HD. This way, everybody would have their data virtually on the
>> SSD,
>> and only the first pass through the dataset would be slow. Afterwards, it
>> would be cached anyway, and the reads would be faster.
>>
>> I used lvm-cache for this. Yet, it seems that the (only) smq-policy is
>> very
>> reluctant in promoting data to the cache, whereas what we would need, is
>> that
>> data is promoted basically upon the first read. Because if someone is
>> using
>> the machine on certain data, they will most likely go over the dataset a
>> couple of hundred times in the following hours.
>>
>> Right now, after a week of testing lvm-cache with the smq-policy, it looks
>> like this:
>>
>>     jdgrave@kat:~$ sudo ./lvmstats
>>     start              0
>>     end                7516192768
>>     segment_type       cache
>>     md_block_size      8
>>     md_utilization     14353/1179648
>>     cache_block_size   128
>>     cache_utilization  7208960/7208960
>>     read_hits          19954892
>>     read_misses        84623959
>>     read_hit_ratio     19.08%
>>     write_hits         672621
>>     write_misses       7336700
>>     write_hit_ratio    8.40%
>>     demotions          151757
>>     promotions         151757
>>     dirty              0
>>     features           1
>>
>>
>>      jdgrave@kat:~$ sudo ./lvmcache-statistics.sh
>>     ------------------------------------------------------------
>> -------------
>>     LVM [2.02.133(2)] cache report of found device /dev/VG/lv
>>     ------------------------------------------------------------
>> -------------
>>     - Cache Usage: 100.0% - Metadata Usage: 1.2%
>>     - Read Hit Rate: 19.0% - Write Hit Rate: 8.3%
>>     - Demotions/Promotions/Dirty: 151757/151757/0
>>     - Feature arguments in use: writeback
>>     - Core arguments in use : migration_threshold 2048 smq 0
>>       - Cache Policy: stochastic multiqueue (smq)
>>     - Cache Metadata Mode: rw
>>     - MetaData Operation Health: ok
>>
>>
>> The number of promotions has been very low, even though the read hit rate
>> is
>> low as well. This is with a cache of 450GB, and currently only 614GB of
>> data
>> on the cached device. A read hit rate of lower than 20%, when just
>> randomly
>> caching would have achieved 73% is not what I would have hoped to get.
>>
>> Is there a way to make the caching way more aggressive? Some settings I
>> can tweak?
>>
>>
> Hi
>
> You've not reported kernel version use.
> Please provide results kernel 4.9.
>
> Also note - cache will NOT cache blocks which are well enough covered by
> 'page-cache' and it's also 'slow' moving case - so it needs couple repeated
> usage of blocks (without page-cache)  to be promoted to cache.
>
> Regards
>
> Zdenek
>
>
>

--001a113f42e60905f405486a26c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am on kernel version 4.4.0-62-generic. I cannot upg=
rade to kernel 4.9, as it did not play nice with CUDA-drivers:=C2=A0<a href=
=3D"https://devtalk.nvidia.com/default/topic/974733/nvidia-linux-driver-367=
-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/" target=3D"_blank=
">https://devtalk.<wbr>nvidia.com/default/topic/<wbr>974733/nvidia-linux-dr=
iver-<wbr>367-57-and-up-do-not-install-<wbr>on-kernel-4-9-0-rc2-and-<wbr>hi=
gher/</a></div><div><br></div><div>Yes, I understand the cache needs repeat=
ed usage of blocks, but my question is basically how many? And if I can low=
er that number?</div><div><br></div><div>In our use case, you basically rea=
d a certain group of 100GB of data completely about 100 times. Then another=
 user logs in, and reads a different group of data about 100 times. But aft=
er a couple of such users, I observe that only 20GB=C2=A0in total=C2=A0has =
been promoted to the cache. Even though the cache is 450GB big, and could e=
asily fit all the data one user would need.</div><div><br></div><div>So, I =
come to the conclusion that I need a more aggressive policy.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I now have a reporte=
d hit rate of=C2=A019.0%, when there is so few data on the volume that 73% =
of the data would fit in the cache. I could probably solve this issue by ma=
king the caching policy more aggressive. I am looking for a way to do that.=
<br></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"m=
_8192931461409818105gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"=
>Sincerely,<br><br>Jonas<br></div></div></div></div></div>
<br><div class=3D"gmail_quote">On 13 February 2017 at 13:55, Zdenek Kabelac=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=
=3D"_blank">zdenek.kabelac@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1=
ex">Dne 13.2.2017 v 11:58 Jonas Degrave napsal(a):<div><div class=3D"m_8192=
931461409818105gmail-h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi,<br>
<br>
We are a group of scientists, who work on reasonably sized datasets<br>
(10-100GB). Because we had troubles managing our SSD&#39;s (everyone likes =
to have<br>
their data on the SSD), I set up a caching system where the 500GB SSD cache=
s<br>
the 4TB HD. This way, everybody would have their data virtually on the SSD,=
<br>
and only the first pass through the dataset would be slow. Afterwards, it<b=
r>
would be cached anyway, and the reads would be faster.<br>
<br>
I used lvm-cache for this. Yet, it seems that the (only) smq-policy is very=
<br>
reluctant in promoting data to the cache, whereas what we would need, is th=
at<br>
data is promoted basically upon the first read. Because if someone is using=
<br>
the machine on certain data, they will most likely go over the dataset a<br=
>
couple of hundred times in the following hours.<br>
<br>
Right now, after a week of testing lvm-cache with the smq-policy, it looks<=
br>
like this:<br>
<br>
=C2=A0 =C2=A0 jdgrave@kat:~$ sudo ./lvmstats<br>
=C2=A0 =C2=A0 start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
=C2=A0 =C2=A0 end=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 75=
16192768<br>
=C2=A0 =C2=A0 segment_type=C2=A0 =C2=A0 =C2=A0 =C2=A0cache<br>
=C2=A0 =C2=A0 md_block_size=C2=A0 =C2=A0 =C2=A0 8<br>
=C2=A0 =C2=A0 md_utilization=C2=A0 =C2=A0 =C2=A014353/1179648<br>
=C2=A0 =C2=A0 cache_block_size=C2=A0 =C2=A0128<br>
=C2=A0 =C2=A0 cache_utilization=C2=A0 7208960/7208960<br>
=C2=A0 =C2=A0 read_hits=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19954892<br>
=C2=A0 =C2=A0 read_misses=C2=A0 =C2=A0 =C2=A0 =C2=A0 84623959<br>
=C2=A0 =C2=A0 read_hit_ratio=C2=A0 =C2=A0 =C2=A019.08%<br>
=C2=A0 =C2=A0 write_hits=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0672621<br>
=C2=A0 =C2=A0 write_misses=C2=A0 =C2=A0 =C2=A0 =C2=A07336700<br>
=C2=A0 =C2=A0 write_hit_ratio=C2=A0 =C2=A0 8.40%<br>
=C2=A0 =C2=A0 demotions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 151757<br>
=C2=A0 =C2=A0 promotions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0151757<br>
=C2=A0 =C2=A0 dirty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
=C2=A0 =C2=A0 features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0jdgrave@kat:~$ sudo ./lvmcache-statistics.sh<br>
=C2=A0 =C2=A0 ------------------------------<wbr>--------------------------=
----<wbr>-------------<br>
=C2=A0 =C2=A0 LVM [2.02.133(2)] cache report of found device /dev/VG/lv<br>
=C2=A0 =C2=A0 ------------------------------<wbr>--------------------------=
----<wbr>-------------<br>
=C2=A0 =C2=A0 - Cache Usage: 100.0% - Metadata Usage: 1.2%<br>
=C2=A0 =C2=A0 - Read Hit Rate: 19.0% - Write Hit Rate: 8.3%<br>
=C2=A0 =C2=A0 - Demotions/Promotions/Dirty: 151757/151757/0<br>
=C2=A0 =C2=A0 - Feature arguments in use: writeback<br>
=C2=A0 =C2=A0 - Core arguments in use : migration_threshold 2048 smq 0<br>
=C2=A0 =C2=A0 =C2=A0 - Cache Policy: stochastic multiqueue (smq)<br>
=C2=A0 =C2=A0 - Cache Metadata Mode: rw<br>
=C2=A0 =C2=A0 - MetaData Operation Health: ok<br>
<br>
<br>
The number of promotions has been very low, even though the read hit rate i=
s<br>
low as well. This is with a cache of 450GB, and currently only 614GB of dat=
a<br>
on the cached device. A read hit rate of lower than 20%, when just randomly=
<br>
caching would have achieved 73% is not what I would have hoped to get.<br>
<br>
Is there a way to make the caching way more aggressive? Some settings I can=
 tweak?<br>
<br>
</blockquote>
<br></div></div>
Hi<br>
<br>
You&#39;ve not reported kernel version use.<br>
Please provide results kernel 4.9.<br>
<br>
Also note - cache will NOT cache blocks which are well enough covered by &#=
39;page-cache&#39; and it&#39;s also &#39;slow&#39; moving case - so it nee=
ds couple repeated usage of blocks (without page-cache)=C2=A0 to be promote=
d to cache.<br>
<br>
Regards<span class=3D"m_8192931461409818105gmail-HOEnZb"><font color=3D"#88=
8888"><br>
<br>
Zdenek<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a113f42e60905f405486a26c5--
