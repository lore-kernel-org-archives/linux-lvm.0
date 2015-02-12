Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1CDvEtj002311
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2015 08:57:14 -0500
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CDvCEQ001919
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2015 08:57:13 -0500
Received: by mail-ob0-f180.google.com with SMTP id vb8so9955921obc.11
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2015 05:57:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKPhfZOb+NS5MD6AvAD8ySa4F6JM5_P-3+utMDva8THyfFVZGA@mail.gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
	<54DB66C7.5080809@gmail.com>
	<CAKPhfZOb+NS5MD6AvAD8ySa4F6JM5_P-3+utMDva8THyfFVZGA@mail.gmail.com>
Date: Thu, 12 Feb 2015 11:57:12 -0200
Message-ID: <CAPcfVV9zMKV2+UF-Y6WFr-TcSPeWpBeta+y-cTSaHCaFPL9E6Q@mail.gmail.com>
From: Marcos Dutra <macdutra@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b4725ee2b4364050ee47fba
Subject: Re: [linux-lvm] Volume group inconsistent
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

--047d7b4725ee2b4364050ee47fba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks again Eric!

You're wright, I have 64 pv each one 500GB hdd. I have problems with my pv
starting by pv0 until pv23, I had seen after dd lvm doesn't recognize the
devices of these pvs, status "unknown device", others devices I don't have
the same problem. I cut this output from dd of hdisk plt-85 =3D pv64

Device with problem

-----

pv0 {
id =3D "N7lOu9-Ahjn-lf19-WVFW-xglN-yfL6-KOOw6O"
device =3D "unknown device"

status =3D ["ALLOCATABLE"]
flags =3D ["MISSING"]
dev_size =3D 1048576000
pe_start =3D 2048
pe_count =3D 127999
}

-----

Device without problem

-----

pv24 {
id =3D "D8aEQf-2CVS-oyVE-t40G-kOd7-eUe5-SkCe8V"
device =3D "/dev/mapper/mpathr"

status =3D ["ALLOCATABLE"]
flags =3D []
dev_size =3D 1048576000
pe_start =3D 2048
pe_count =3D 127999
}

-----


But the output from another hdisk plt-01 =3D pv0 I have different view.

-----

pv0 {
id =3D "N7lOu9-Ahjn-lf19-WVFW-xglN-yfL6-KOOw6O"
device =3D "/dev/mapper/plt-01"

status =3D ["ALLOCATABLE"]
flags =3D ["MISSING"]
dev_size =3D 1048576000
pe_start =3D 2048
pe_count =3D 127999
}

-----

I'm getting crazy lol...

Thank you

Marcos Dutra


2015-02-11 21:49 GMT-02:00 service hofman <service.hofman@googlemail.com>:

> ----
>                 pv64 {
>                         id =3D "TFSqaf-Wd6b-9w2r-8ZLp-rVN9-5851-0qNX0z"
>                         device =3D "/dev/mapper/plt-85"   # Hint only
>
>                         status =3D ["ALLOCATABLE"]
>                         flags =3D []
>                         dev_size =3D 1048576000   # 500 Gigabytes
>                         pe_start =3D 2048
>                         pe_count =3D 127999       # 499.996 Gigabytes
>                 }
>         }
>
> ----
>
> pvXX this is One for Team or for [hdd] /dev/sdX
> this look like you have 64hdd for 500Gb one.
>
> and first look MBR 0-2Mb
>
> dd if=3D/dev/sdX of=3D/boot/sdX.mbr bs=3D512 count=3D4000
>
> in side  sdX.mbr is lvm.vg
> if is this same [ platinum_after_missing.vg ]
>
> you found all record /etc/lvm/*
>
> rest is easy.
>
> device is inode, but not lv.
> [ -b "/dev/mapper/plt-01" ] && echo "True " || echo "False"
>
> -----
>
>         logical_volumes {
>
>                 volume-a2d55040-a597-419b-95b6-403f5b287773 {
>                         id =3D "GA9jj9-hooD-Au8T-23Bw-LNox-LkWF-G1TUG6"
>                         status =3D ["READ", "WRITE", "VISIBLE"]
>                         flags =3D []
>                         creation_host =3D "brasilia"
>                         creation_time =3D 1409946331      # 2014-09-05
> 16:45:31 -0300
>                         segment_count =3D 1
>
>
>
>                         segment1 {
>                                 start_extent =3D 0
>                                 extent_count =3D 1024     # 4 Gigabytes
>
>                                 type =3D "striped"
>                                 stripe_count =3D 1        # linear
>
>                                 stripes =3D [
>
>                                         "pv10", 30730
>                                 ]
>                         }
>                 }
>
> -----
> segment1 =3D=3D lv like /dev/sdX1
>
> pv10=3D=3D[hdd X],  offset[sdX1] =3D=3D [  -->[xxx] ]
> but every one is start =3D=3D 0[+offset]
> 30730*4096=3D[offset]
>
>
> by recovery us dd if=3D/dev/sdX1 bs=3D4096 count=3D(1024*1000) seek=3D($o=
ffset)
>
>
> this not LVM only IBM LLVM
> LINUX use LVM. kernel.org
> IBM use AIX kernel
>
>
>
> ComputerAlarmTechnologySystem=C2=A9
>
> http://plus.google.com/105013137826111836446
> +44 77 04 24 74 00
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7b4725ee2b4364050ee47fba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks again Eric!<div><br></div><div>You&#39;re wright, I=
 have 64 pv each one 500GB hdd. I have problems with my pv starting by pv0 =
until pv23, I had seen after dd lvm doesn&#39;t recognize the devices of th=
ese pvs, status &quot;unknown device&quot;, others devices I don&#39;t have=
 the same problem. I cut this output from dd of hdisk plt-85 =3D pv64</div>=
<div><br></div><div>Device with problem</div><div><br></div><div>-----</div=
><div><div><br></div><div>pv0 {</div><div>id =3D &quot;N7lOu9-Ahjn-lf19-WVF=
W-xglN-yfL6-KOOw6O&quot;</div><div>device =3D &quot;unknown device&quot;</d=
iv><div><br></div><div>status =3D [&quot;ALLOCATABLE&quot;]</div><div>flags=
 =3D [&quot;MISSING&quot;]</div><div>dev_size =3D 1048576000</div><div>pe_s=
tart =3D 2048</div><div>pe_count =3D 127999</div><div>}</div></div><div><br=
></div><div>-----</div><div><br></div><div>Device without problem</div><div=
><br></div><div>-----</div><div><br></div><div><div>pv24 {</div><div>id =3D=
 &quot;D8aEQf-2CVS-oyVE-t40G-kOd7-eUe5-SkCe8V&quot;</div><div>device =3D &q=
uot;/dev/mapper/mpathr&quot;</div><div><br></div><div>status =3D [&quot;ALL=
OCATABLE&quot;]</div><div>flags =3D []</div><div>dev_size =3D 1048576000</d=
iv><div>pe_start =3D 2048</div><div>pe_count =3D 127999</div><div>}</div></=
div><div><br></div><div>-----</div><div><br></div><div><br></div><div>But t=
he output from another hdisk plt-01 =3D pv0 I have different view.</div><di=
v><br></div><div>-----</div><div><br></div><div><div>pv0 {</div><div>id =3D=
 &quot;N7lOu9-Ahjn-lf19-WVFW-xglN-yfL6-KOOw6O&quot;</div><div>device =3D &q=
uot;/dev/mapper/plt-01&quot;</div><div><br></div><div>status =3D [&quot;ALL=
OCATABLE&quot;]</div><div>flags =3D [&quot;MISSING&quot;]</div><div>dev_siz=
e =3D 1048576000</div><div>pe_start =3D 2048</div><div>pe_count =3D 127999<=
/div><div>}</div></div><div><br></div><div>-----</div><div><br></div><div>I=
&#39;m getting crazy lol...</div><div><br></div><div>Thank you</div><div><b=
r></div><div>Marcos Dutra</div><div><br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">2015-02-11 21:49 GMT-02:00 service hofma=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:service.hofman@googlemail.com" ta=
rget=3D"_blank">service.hofman@googlemail.com</a>&gt;</span>:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pv64 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 id =3D &quot;TFSqaf-Wd6b-9w2r-8ZLp-rVN9-5851-0qNX0z&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 device =3D &quot;/dev/mapper/plt-85&quot;=C2=A0 =C2=A0# Hint onl=
y<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D [&quot;ALLOCATABLE&quot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 flags =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_size =3D 1048576000=C2=A0 =C2=A0# 500 Gigabytes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pe_start =3D 2048<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pe_count =3D 127999=C2=A0 =C2=A0 =C2=A0 =C2=A0# 499.996 Gigabyte=
s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
----<br>
<br>
pvXX this is One for Team or for [hdd] /dev/sdX<br>
this look like you have 64hdd for 500Gb one.<br>
<br>
and first look MBR 0-2Mb<br>
<br>
dd if=3D/dev/sdX of=3D/boot/sdX.mbr bs=3D512 count=3D4000<br>
<br>
in side=C2=A0 sdX.mbr is <a href=3D"http://lvm.vg" target=3D"_blank">lvm.vg=
</a><br>
if is this same [ <a href=3D"http://platinum_after_missing.vg" target=3D"_b=
lank">platinum_after_missing.vg</a> ]<br>
<br>
you found all record /etc/lvm/*<br>
<br>
rest is easy.<br>
<br>
device is inode, but not lv.<br>
[ -b &quot;/dev/mapper/plt-01&quot; ] &amp;&amp; echo &quot;True &quot; || =
echo &quot;False&quot;<br>
<br>
-----<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 logical_volumes {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 volume-a2d55040-a59=
7-419b-95b6-403f5b287773 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 id =3D &quot;GA9jj9-hooD-Au8T-23Bw-LNox-LkWF-G1TUG6&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;VISIBLE&q=
uot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 flags =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 creation_host =3D &quot;brasilia&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 creation_time =3D 1409946331=C2=A0 =C2=A0 =C2=A0 # 2014-09-05 16=
:45:31 -0300<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 segment_count =3D 1<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 segment1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_extent =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extent_count =3D 1024=C2=A0 =C2=A0 =
=C2=A0# 4 Gigabytes<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &quot;striped&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stripe_count =3D 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # linear<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stripes =3D [<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pv=
10&quot;, 30730<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-----<br>
segment1 =3D=3D lv like /dev/sdX1<br>
<br>
pv10=3D=3D[hdd X],=C2=A0 offset[sdX1] =3D=3D [=C2=A0 --&gt;[xxx] ]<br>
but every one is start =3D=3D 0[+offset]<br>
30730*4096=3D[offset]<br>
<br>
<br>
by recovery us dd if=3D/dev/sdX1 bs=3D4096 count=3D(1024*1000) seek=3D($off=
set)<br>
<br>
<br>
this not LVM only IBM LLVM<br>
LINUX use LVM. <a href=3D"http://kernel.org" target=3D"_blank">kernel.org</=
a><br>
IBM use AIX kernel<br>
<span class=3D"im HOEnZb"><br>
<br>
<br>
ComputerAlarmTechnologySystem=C2=A9<br>
<br>
<a href=3D"http://plus.google.com/105013137826111836446" target=3D"_blank">=
http://plus.google.com/105013137826111836446</a><br>
<a href=3D"tel:%2B44%2077%2004%2024%2074%2000" value=3D"+447704247400">+44 =
77 04 24 74 00</a><br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">____________________________=
___________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></div></blockquote></=
div><br></div>

--047d7b4725ee2b4364050ee47fba--
