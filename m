Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJ9Eagk015341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 04:14:36 -0500
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42]) by mx1.redhat.com (Postfix) with ESMTPS id CFE9F219D
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 09:14:29 +0000 (UTC)
Received: by lffu14 with SMTP id u14so43798092lff.1
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 01:14:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <564D8EC9.1070406@gmail.com>
References: <CANvPVN3ZzNiPsa_H-Lr38Ere1kYKzU2EPK_dFu0wG--cgtsZrA@mail.gmail.com>
	<564D8EC9.1070406@gmail.com>
Date: Thu, 19 Nov 2015 11:14:28 +0200
Message-ID: <CANvPVN3fr5xUog3rGuEr_8QfEc9iJY0k1iTfwV6jN7oC=Z7ULA@mail.gmail.com>
From: Ciprian Hacman <ciprian.hacman@sematext.com>
Content-Type: multipart/alternative; boundary=001a1140125a9662310524e12f0e
Subject: Re: [linux-lvm] Cache block size warning
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

--001a1140125a9662310524e12f0e
Content-Type: text/plain; charset=UTF-8

Thank you for the quick answer. Sounds easy to implement if needed.

Ciprian
--
Performance Monitoring * Log Analytics * Search Analytics
Solr & Elasticsearch Support * http://sematext.com/

On Thu, Nov 19, 2015 at 10:56 AM, Zdenek Kabelac <zdenek.kabelac@gmail.com>
wrote:

> Dne 19.11.2015 v 08:27 Ciprian Hacman napsal(a):
>
>> Hi,
>>
>> We are configuring lvm with SSD caching on some of our boxes in AWS. When
>> the
>> cache is initialised, we see this in logs:
>>
>>     device-mapper*: cache: You have created a cache device with a lot of
>>     individual cache blocks (4915200)*
>>
>>     *               All these mappings can consume a lot of kernel
>> memory, and
>>     take some time to read/write.*
>>
>>     *               Please consider increasing the cache block size to
>> reduce
>>     the overall cache block count.*
>>
>>
>> Is this something to worry? If so, how can we improve it?
>>
>>
> If you have lots of kernel memory - it's probably ok.
> Otherwise you may try to use bigger chunk size.
>
> e.g.  --chunksize 512K   or even more:
>
> lvcreate --type cache-pool -L300G vg/cpool
>
> lvcreate -H --chunksize 512K -L1.5T   --name data  vg/cpool
>
> It's possible future version of lvm2 will try to create this by default.
>
> Zdenek
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a1140125a9662310524e12f0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the quick answer. Sounds easy to implement i=
f needed.<div><br></div><div>Ciprian</div><div class=3D"gmail_extra"><div><=
div class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">--</di=
v><div dir=3D"ltr">Performance Monitoring * Log Analytics * Search Analytic=
s<br>Solr &amp; Elasticsearch Support *=C2=A0<a href=3D"http://sematext.com=
/" rel=3D"noreferrer" style=3D"color:rgb(17,85,204)" target=3D"_blank">http=
://sematext.com/</a><br></div></div></div></div></div>
<br><div class=3D"gmail_quote">On Thu, Nov 19, 2015 at 10:56 AM, Zdenek Kab=
elac <span dir=3D"ltr">&lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" targ=
et=3D"_blank">zdenek.kabelac@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Dne 19.11.2015 v 08:27 Ciprian Hacman napsal(a):<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
Hi,<br>
<br>
We are configuring lvm with SSD caching on some of our boxes in AWS. When t=
he<br>
cache is initialised, we see this in logs:<br>
<br></span>
=C2=A0 =C2=A0 device-mapper*: cache: You have created a cache device with a=
 lot of<br>
=C2=A0 =C2=A0 individual cache blocks (4915200)*<br>
<br>
=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0All t=
hese mappings can consume a lot of kernel memory, and<br>
=C2=A0 =C2=A0 take some time to read/write.*<br>
<br>
=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pleas=
e consider increasing the cache block size to reduce<br>
=C2=A0 =C2=A0 the overall cache block count.*<span class=3D""><br>
<br>
<br>
Is this something to worry? If so, how can we improve it?<br>
<br>
</span></blockquote>
<br>
If you have lots of kernel memory - it&#39;s probably ok.<br>
Otherwise you may try to use bigger chunk size.<br>
<br>
e.g.=C2=A0 --chunksize 512K=C2=A0 =C2=A0or even more:<br>
<br>
lvcreate --type cache-pool -L300G vg/cpool<br>
<br>
lvcreate -H --chunksize 512K -L1.5T=C2=A0 =C2=A0--name data=C2=A0 vg/cpool<=
br>
<br>
It&#39;s possible future version of lvm2 will try to create this by default=
.<br>
<br>
Zdenek<br>
<br>
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
</blockquote></div><br></div></div>

--001a1140125a9662310524e12f0e--
