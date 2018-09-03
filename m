Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20128600C6
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 11:02:20 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7C267F6A0
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 11:02:18 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id t10-v6so62397ybb.1
	for <linux-lvm@redhat.com>; Mon, 03 Sep 2018 04:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
	<1370565024.307.1535971224020@obastrlx.obastrlx.ch>
In-Reply-To: <1370565024.307.1535971224020@obastrlx.obastrlx.ch>
From: Oleksandr Panchuk <panolex@gmail.com>
Date: Mon, 3 Sep 2018 14:02:06 +0300
Message-ID: <CAAjPMgM3_mw5KJEeb9jvRabeUHUAS9sMAjytSeViLxcoQSRi7g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008553760574f57990"
Subject: Re: [linux-lvm] Prepend LV
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
To: linux-lvm@redhat.com

--0000000000008553760574f57990
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel,

Thanks for fast reply. But I looks like lvextend appends space after LV.

And after running lvextend we will get following:

[25GB LV] + [20 GB free space]

free space added after original LV.

But we need to prepend free space before original LV:

[20 GB free space] + [25GB LV]

free space added before original LV.

Thanks,
Alex

=D0=BF=D0=BD, 3 =D0=B2=D0=B5=D1=80. 2018 =D0=BE 13:43 Daniel Etter <daniel@=
obastrlx.ch> =D0=BF=D0=B8=D1=88=D0=B5:

> Hello
>
> > Oleksandr Panchuk <panolex@gmail.com> hat am 3. September 2018 um 11:04
> geschrieben:
> >
> > So, Is there any way to prepend LV with some free space ?
>
> I don't know what a LV with free space should be good for,
> but you can achieve this by lvextend.
>
> #lvs  /dev/mapper/system-home
>  LV   VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Syn=
c
> Convert
>  home system -wi-ao---- 25.00g
>
> # df -h /home
> Filesystem               Size  Used Avail Use% Mounted on
> /dev/mapper/system-home   25G  8.0G   16G  34% /home
>
> # lvextend -L +20G /dev/mapper/system-home
>   Size of logical volume system/home changed from 25.00 GiB (6400 extents=
)
> to 45.00 GiB (11520 extents).
>   Logical volume home successfully resized
>
> # df -h /home
> Filesystem               Size  Used Avail Use% Mounted on
> /dev/mapper/system-home   25G  8.0G   16G  34% /home
>
> # lvs /dev/mapper/system-home
>   LV   VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>   home system -wi-ao---- 45.00g
>
>
>
> Daniel
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0000000000008553760574f57990
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Daniel,=
=C2=A0<div><br></div><div>Thanks for fast reply. But I looks like lvextend =
appends space after LV.</div><div><br></div><div>And after running lvextend=
 we will get following:</div><div><br></div><div>[25GB LV] + [20 GB free sp=
ace]</div><div><br></div><div>free space added after original LV.</div><div=
><br></div><div>But we need to prepend free space before original LV:</div>=
<div><br></div><div><div><div>[20 GB free space] + [25GB LV]</div></div></d=
iv><div><br></div><div>free space added before original LV.</div><div><br><=
/div><div>Thanks,</div><div>Alex</div></div></div></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">=D0=BF=D0=BD, 3 =D0=B2=D0=B5=D1=80. 2018=
 =D0=BE 13:43 Daniel Etter &lt;<a href=3D"mailto:daniel@obastrlx.ch">daniel=
@obastrlx.ch</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello<br>
<br>
&gt; Oleksandr Panchuk &lt;<a href=3D"mailto:panolex@gmail.com" target=3D"_=
blank">panolex@gmail.com</a>&gt; hat am 3. September 2018 um 11:04 geschrie=
ben:<br>
&gt; <br>
&gt; So, Is there any way to prepend LV with some free space ?<br>
<br>
I don&#39;t know what a LV with free space should be good for,<br>
but you can achieve this by lvextend.<br>
<br>
#lvs=C2=A0 /dev/mapper/system-home<br>
=C2=A0LV=C2=A0 =C2=A0VG=C2=A0 =C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0L=
Size=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<br=
>
=C2=A0home system -wi-ao---- 25.00g<br>
<br>
# df -h /home<br>
Filesystem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size=C2=A0=
 Used Avail Use% Mounted on<br>
/dev/mapper/system-home=C2=A0 =C2=A025G=C2=A0 8.0G=C2=A0 =C2=A016G=C2=A0 34=
% /home<br>
<br>
# lvextend -L +20G /dev/mapper/system-home<br>
=C2=A0 Size of logical volume system/home changed from 25.00 GiB (6400 exte=
nts) to 45.00 GiB (11520 extents).<br>
=C2=A0 Logical volume home successfully resized<br>
<br>
# df -h /home<br>
Filesystem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size=C2=A0=
 Used Avail Use% Mounted on<br>
/dev/mapper/system-home=C2=A0 =C2=A025G=C2=A0 8.0G=C2=A0 =C2=A016G=C2=A0 34=
% /home<br>
<br>
# lvs /dev/mapper/system-home<br>
=C2=A0 LV=C2=A0 =C2=A0VG=C2=A0 =C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0=
LSize=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<b=
r>
=C2=A0 home system -wi-ao---- 45.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
<br>
<br>
Daniel<br>
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
</blockquote></div>

--0000000000008553760574f57990--
