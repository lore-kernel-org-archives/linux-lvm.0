Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BIZh5x032060
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 13:35:43 -0500
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BIZfSg029165
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 13:35:42 -0500
Received: by mail-ob0-f180.google.com with SMTP id vb8so4998686obc.11
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 10:35:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54DB66C7.5080809@gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
	<54DB66C7.5080809@gmail.com>
Date: Wed, 11 Feb 2015 16:35:41 -0200
Message-ID: <CAPcfVV9fgo2sv+Eca3TtMeoc7LKiO=BsOf3FZFUDsLjqKYFPCA@mail.gmail.com>
From: Marcos Dutra <macdutra@gmail.com>
Content-Type: multipart/alternative; boundary=001a113cdcce46108f050ed445d9
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

--001a113cdcce46108f050ed445d9
Content-Type: text/plain; charset=UTF-8

Zdenek,

My multipath devices have an alias to plt-XX instead of the default name
mpathXX.

I can create new volumes with lvcreate, but after 3 or 4 new volumes my VG
pass to inconsistent status because 24 disks stay in missing status, I
don't know why. Do you think that the lvm cannot write properly?

My disks are provided by IBM storage DS8000 but I don't have access the
configuration. Those devices was working properly until last friday since
august 2014.

When I restore my backup with vgcfgrestore, my VG return active without
problem, then I believe I don't have problens with write properly. Do you
have any idea or a test to do? I cannot shut off this VG now because it's
active and used by virtual servers, I have a big problem now.

I created a new VG to create new volumes but I'd like fix this one.

Thanks



2015-02-11 12:27 GMT-02:00 Zdenek Kabelac <zdenek.kabelac@gmail.com>:

> Dne 9.2.2015 v 17:37 Marcos Dutra napsal(a):
>
>> Hi Zdenek,
>>
>> I attached 2 files, one with missing status and another my backup today. I
>> restored my vg from backup but I still have problem, if I create some new
>> lv
>> volumes, vg status come back with missing status, I don't know why. Since
>> saturday night I don't create any volumes in this vg and I don't have any
>> missing status until now, but I would like come back to create new lv in
>> this
>> volume.
>> My server is centos-6.6 with lastest updates.
>>
>>
>
> What are those  /dev/mapper/plt-XX  devices ?
>
> It seems like the lvm2 command cannot write to this place properly?
>
> Checksum error looks like serious problem.
>
> From attached output - all your PVs were properly markes as not missing,
> however the lvm2 cannot read back proper crc code.
>
> So what are those 0.5GB devices - are they properly writable ?
> (especially in the disk header)
>
> Note - there are special type of block devices like DASD devices
> that must be first properly configured by IBM storage manager to provide
> regular devices.
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

--001a113cdcce46108f050ed445d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Zdenek,</div><div><br></div>My multipath devices have=
 an alias to plt-XX instead of the default name mpathXX.=C2=A0<div><br></di=
v><div>I can create new volumes with lvcreate, but after 3 or 4 new volumes=
 my VG pass to inconsistent status because 24 disks stay in missing status,=
 I don&#39;t know why. Do you think that the lvm cannot write properly?</di=
v><div><br></div><div>My disks are provided by IBM storage DS8000 but I don=
&#39;t have access the configuration. Those devices was working properly un=
til last friday since august 2014.</div><div><br></div><div>When I restore =
my backup with vgcfgrestore, my VG return active without problem, then I be=
lieve I don&#39;t have problens with write properly. Do you have any idea o=
r a test to do? I cannot shut off this VG now because it&#39;s active and u=
sed by virtual servers, I have a big problem now.</div><div><br></div><div>=
I created a new VG to create new volumes but I&#39;d like fix this one.</di=
v><div><br></div><div>Thanks</div><div><br></div><div>=C2=A0</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-02-11 12:27 GMT=
-02:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zdenek.kabela=
c@gmail.com" target=3D"_blank">zdenek.kabelac@gmail.com</a>&gt;</span>:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 9.2.2015 v 17:37 Marcos Dutra napsal(a):=
<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Zdenek,<br>
<br>
I attached 2 files, one with missing status and another my backup today. I<=
br>
restored my vg from backup but I still have problem, if I create some new l=
v<br>
volumes, vg status come back with missing status, I don&#39;t know why. Sin=
ce<br>
saturday night I don&#39;t create any volumes in this vg and I don&#39;t ha=
ve any<br>
missing status until now, but I would like come back to create new lv in th=
is<br>
volume.<br>
My server is centos-6.6 with lastest updates.<br>
<br>
</blockquote>
<br>
<br></span>
What are those=C2=A0 /dev/mapper/plt-XX=C2=A0 devices ?<br>
<br>
It seems like the lvm2 command cannot write to this place properly?<br>
<br>
Checksum error looks like serious problem.<br>
<br>
From attached output - all your PVs were properly markes as not missing,<br=
>
however the lvm2 cannot read back proper crc code.<br>
<br>
So what are those 0.5GB devices - are they properly writable ?<br>
(especially in the disk header)<br>
<br>
Note - there are special type of block devices like DASD devices<br>
that must be first properly configured by IBM storage manager to provide re=
gular devices.<br>
<br>
Regards<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
Zdenek<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</div></div></blockquote></div><br></div>

--001a113cdcce46108f050ed445d9--
