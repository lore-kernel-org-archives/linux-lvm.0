Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E103DB19CE
	for <linux-lvm@redhat.com>; Thu, 11 Oct 2018 14:31:41 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBAF7CF25
	for <linux-lvm@redhat.com>; Thu, 11 Oct 2018 14:31:38 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e22-v6so10059251qto.6
	for <linux-lvm@redhat.com>; Thu, 11 Oct 2018 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
	<20181011142550.GA15437@redhat.com>
In-Reply-To: <20181011142550.GA15437@redhat.com>
From: Emmanuel Gelati <emi2fast@gmail.com>
Date: Thu, 11 Oct 2018 16:31:26 +0200
Message-ID: <CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001b21580577f4d455"
Subject: Re: [linux-lvm] what is the IOPS behavior when partitions of single
 disk(raid5 backend) are used in an LVM?
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
Cc: norbuurgen@gmail.com

--0000000000001b21580577f4d455
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you use sdb only for data, you don't have need to use partition on the
disk.

Il giorno gio 11 ott 2018 alle ore 16:26 David Teigland <teigland@redhat.co=
m>
ha scritto:

> On Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:
> > I have LVM(backed by hardware RAID5) with logical volume and a volume
> group
> > named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2 sdb3 created
> from
> > same sdb disk.
>
> > sdb                                8:16   0  19.7T  0 disk
> > =E2=94=9C=E2=94=80sdb1                             8:17   0   7.7T  0 p=
art
> > =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0  =
 9.4T  0 lvm  /var/db/st01
> > =E2=94=9C=E2=94=80sdb2                             8:18   0   1.7T  0 p=
art
> > =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0  =
 9.4T  0 lvm  /var/db/st01
> > =E2=94=94=E2=94=80sdb3                             8:19   0  10.3T  0 p=
art
> >   =E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)     252:0    0  =
10.3T  0 lvm
>
> > I am assuming this is due to disk seek problem as the same disk
> partitions
> > are used for same LVM or may be its due to saturation of the disks
>
> You shouldn't add different partitions as different PVs.  If it's too lat=
e
> to fix, it might help to create new LV that uses only one of the
> partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then copy your
> current LV to the new one.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=20
  .~.
  /V\
 //  \\
/(   )\
^`~'^

--0000000000001b21580577f4d455
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you use sdb only for data, you don&#39;t have need to u=
se partition on the disk.<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">Il giorno gio 11 ott 2018 alle ore 16:26 David Teigland &lt;<a hre=
f=3D"mailto:teigland@redhat.com">teigland@redhat.com</a>&gt; ha scritto:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Thu, Oct 11, 2018 at 08:53:07AM +0=
545, Sherpa Sherpa wrote:<br>
&gt; I have LVM(backed by hardware RAID5) with logical volume and a volume =
group<br>
&gt; named &quot;dbstore-lv&quot; and &quot;dbstore-vg&quot; which have sdb=
1 sdb2 sdb3 created from<br>
&gt; same sdb disk.<br>
<br>
&gt; sdb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:16=C2=A0 =C2=A00=C2=A0 19.7=
T=C2=A0 0 disk<br>
&gt; =E2=94=9C=E2=94=80sdb1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:17=C2=A0 =C2=A00=
=C2=A0 =C2=A07.7T=C2=A0 0 part<br>
&gt; =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 252:1=C2=A0 =C2=A0 0=C2=A0 =C2=A09.4T=C2=A0 0 lvm=
=C2=A0 /var/db/st01<br>
&gt; =E2=94=9C=E2=94=80sdb2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:18=C2=A0 =C2=A00=
=C2=A0 =C2=A01.7T=C2=A0 0 part<br>
&gt; =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 252:1=C2=A0 =C2=A0 0=C2=A0 =C2=A09.4T=C2=A0 0 lvm=
=C2=A0 /var/db/st01<br>
&gt; =E2=94=94=E2=94=80sdb3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:19=C2=A0 =C2=A00=
=C2=A0 10.3T=C2=A0 0 part<br>
&gt;=C2=A0 =C2=A0=E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)=C2=A0=
 =C2=A0 =C2=A0252:0=C2=A0 =C2=A0 0=C2=A0 10.3T=C2=A0 0 lvm<br>
<br>
&gt; I am assuming this is due to disk seek problem as the same disk partit=
ions<br>
&gt; are used for same LVM or may be its due to saturation of the disks<br>
<br>
You shouldn&#39;t add different partitions as different PVs.=C2=A0 If it&#3=
9;s too late<br>
to fix, it might help to create new LV that uses only one of the<br>
partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then copy your<br=
>
current LV to the new one.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature">=C2=A0 .~.<br>=C2=A0 /V\<br>=C2=
=A0// =C2=A0\\<br>/( =C2=A0 )\<br>^`~&#39;^</div>

--0000000000001b21580577f4d455--
