Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6P8PLd3020520
	for <linux-lvm@redhat.com>; Sat, 25 Jul 2009 04:25:21 -0400
Received: from mail-pz0-f175.google.com (mail-pz0-f175.google.com
	[209.85.222.175])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6P8P0Ta009243
	for <linux-lvm@redhat.com>; Sat, 25 Jul 2009 04:25:00 -0400
Received: by pzk5 with SMTP id 5so999251pzk.23
	for <linux-lvm@redhat.com>; Sat, 25 Jul 2009 01:24:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <D9F5ECBD-38D9-4526-8021-40B0F26E09AE@karlsbakk.net>
References: <e61979140907240521w4d4257a7q7aed92f7bb31c1df@mail.gmail.com>
	<D9F5ECBD-38D9-4526-8021-40B0F26E09AE@karlsbakk.net>
Date: Sat, 25 Jul 2009 13:54:57 +0530
Message-ID: <e61979140907250124j13ec93begcbc36a8aaa3edb37@mail.gmail.com>
Subject: Re: [linux-lvm] lvm or raid 0?
From: vishesh kumar <linuxtovishesh@gmail.com>
Content-Type: multipart/alternative; boundary=001636e91065ce2481046f837403
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--001636e91065ce2481046f837403
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for quick reply

On Fri, Jul 24, 2009 at 6:07 PM, Roy Sigurd Karlsbakk <roy@karlsbakk.net>wr=
ote:

> On 24. juli. 2009, at 14.21, vishesh kumar wrote:
>
>  Dear all
>>
>>    Is is true that LVM use RAID 0 ?
>>
>
> LVM /may/ use RAID 0 if you tell it to
>
>    Does RAID 0 is more reliable than LVM ?
>>
>
>
> RAID 0 with md or LVM will give you approxmately the same performance gai=
n
> and the same level of reliability; it works like hell until a drive dies,
> then it all dies. Don't use it unless you know what you're doing.
>
> roy
> --
> Roy Sigurd Karlsbakk
> (+47) 97542685
> roy@karlsbakk.net
> http://blogg.karlsbakk.net/
> --
> I all pedagogikk er det essensielt at pensum presenteres intelligibelt. D=
et
> er et element=E6rt imperativ for alle pedagoger =E5 unng=E5 eksessiv anve=
ndelse av
> idiomer med fremmed opprinnelse. I de fleste tilfeller eksisterer adekvat=
e
> og relevante synonymer p=E5 norsk.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001636e91065ce2481046f837403
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for quick reply<br><br><div class=3D"gmail_quote">On Fri, Jul 24, 20=
09 at 6:07 PM, Roy Sigurd Karlsbakk <span dir=3D"ltr">&lt;<a href=3D"mailto=
:roy@karlsbakk.net">roy@karlsbakk.net</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); m=
argin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class=3D"im">On 24. juli. 2009, at 14.21, vishesh kumar wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Dear all<br>
<br>
 =A0 =A0Is is true that LVM use RAID 0 ?<br>
</blockquote>
<br></div>
LVM /may/ use RAID 0 if you tell it to<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
 =A0 Does RAID 0 is more reliable than LVM ?<br>
</blockquote>
<br>
<br></div>
RAID 0 with md or LVM will give you approxmately the same performance gain =
and the same level of reliability; it works like hell until a drive dies, t=
hen it all dies. Don&#39;t use it unless you know what you&#39;re doing.<br=
>

<br>
roy<br>
--<br>
Roy Sigurd Karlsbakk<br>
(+47) 97542685<br>
<a href=3D"mailto:roy@karlsbakk.net" target=3D"_blank">roy@karlsbakk.net</a=
><br>
<a href=3D"http://blogg.karlsbakk.net/" target=3D"_blank">http://blogg.karl=
sbakk.net/</a><br>
--<br>
I all pedagogikk er det essensielt at pensum presenteres intelligibelt. Det=
 er et element=E6rt imperativ for alle pedagoger =E5 unng=E5 eksessiv anven=
delse av idiomer med fremmed opprinnelse. I de fleste tilfeller eksisterer =
adekvate og relevante synonymer p=E5 norsk.<br>

<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--001636e91065ce2481046f837403--
