Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3INZ4og031741
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2009 19:35:04 -0400
Received: from mail-qy0-f104.google.com (mail-qy0-f104.google.com
	[209.85.221.104])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3INYlTx000974
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2009 19:34:47 -0400
Received: by qyk2 with SMTP id 2so3074540qyk.23
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2009 16:34:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49EA534C.7090003@whgl.uni-frankfurt.de>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Sat, 18 Apr 2009 18:34:32 -0500
Message-ID: <f4f537b50904181634x63985280sb9e97599b8e9805e@mail.gmail.com>
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
Content-Type: multipart/alternative; boundary=0015175ccf142024d20467dcbe72
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

--0015175ccf142024d20467dcbe72
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Google brought up this bug
https://bugzilla.redhat.com/show_bug.cgi?id=232843  .  The read-ahead values
for LV are set to a much lower value than for a md, but can be adjusted
in user-space (my understanding).

Regards,
Eugene Vilensky
evilensky@gmail.com


On Sat, Apr 18, 2009 at 5:25 PM, Sven Eschenberg <sven@whgl.uni-frankfurt.de
> wrote:

> Dear list,
>
> I tried to create a PE+VG+LV ontop of a mdraid. For no obvious reason the
> lvm volume show extremely poor performance - The transferrates are as little
> as 30% of the rates on the md device itself.
> In contrast creating a partition table ontop of the array gives nearly no
> performance impact.
>
> Does anybody have the slightest idea, wht might be going wrong here?
>
> Regards
>
> -Sven
>
> P.S.: I tried aligning the first PE in the VG with the mdraid chunk size,
> no difference whatsoever.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0015175ccf142024d20467dcbe72
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Google brought up this bug=A0<a href=3D"https://bugzilla.redhat.com/show_bu=
g.cgi?id=3D232843">https://bugzilla.redhat.com/show_bug.cgi?id=3D232843</a>=
 =A0. =A0The read-ahead values for LV are set to a much lower value than fo=
r a md, but can be adjusted in=A0user-space=A0(my understanding).<div>

<br></div><div><br><div>Regards,<br>Eugene Vilensky<br><a href=3D"mailto:ev=
ilensky@gmail.com">evilensky@gmail.com</a><br>
<br><br><div class=3D"gmail_quote">On Sat, Apr 18, 2009 at 5:25 PM, Sven Es=
chenberg <span dir=3D"ltr">&lt;<a href=3D"mailto:sven@whgl.uni-frankfurt.de=
">sven@whgl.uni-frankfurt.de</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex;">

Dear list,<br>
<br>
I tried to create a PE+VG+LV ontop of a mdraid. For no obvious reason the l=
vm volume show extremely poor performance - The transferrates are as little=
 as 30% of the rates on the md device itself.<br>
In contrast creating a partition table ontop of the array gives nearly no p=
erformance impact.<br>
<br>
Does anybody have the slightest idea, wht might be going wrong here?<br>
<br>
Regards<br>
<br>
-Sven<br>
<br>
P.S.: I tried aligning the first PE in the VG with the mdraid chunk size, n=
o difference whatsoever.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div></div>

--0015175ccf142024d20467dcbe72--
