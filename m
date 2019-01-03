Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6B275FCD3
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2019 09:32:54 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F14B7C0C427A
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2019 09:32:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c16so22741910lfj.8
	for <linux-lvm@redhat.com>; Thu, 03 Jan 2019 01:32:46 -0800 (PST)
MIME-Version: 1.0
References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Thu, 3 Jan 2019 10:32:33 +0100
Message-ID: <CACrcyfKe7X2XAGUqDsksbNqgRtf4F7oCvUcdQ1A3S67L48Z1ng@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e76524057e8a71f2"
Subject: Re: [linux-lvm] how to copy a snapshot,
 or restore snapshot without deleting it
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

--000000000000e76524057e8a71f2
Content-Type: text/plain; charset="UTF-8"

Hi,

Drop me an email; there are other ways to perform this without "destroying"
the old snapshot.

Regards Tomas

Den tors 3 jan. 2019 kl 10:29 skrev Davis, Matthew <
Matthew.Davis.2@team.telstra.com>:

> Hi,
>
> I want to restore a snapshot without deleting the snapshot.
>
> My use case is that I'm experimenting with a lot of different drivers,
> kernel modules, and file modifications all over my machine.
> I want to
> 1. take a snapshot of the working system
> 2. make changes
> 3. restore the snapshot (` sudo lvconvert --merge
> /dev/ubuntu-vg/$SNAPSHOT` then reboot)
> 4. make new changes
> 5. restore to the snapshot again
>
> The problem is that step 3 deletes the snapshot, so step 5 fails.
>
> My current workaround is:
> 1. take a snapshot of the working system
> 2. make changes
> 3. restore the snapshot (` sudo lvconvert --merge
> /dev/ubuntu-vg/$SNAPSHOT` then reboot)
> 4. Wait 1.5 hours, without making any changes to the machine
> 5. Take a new snapshot, with the same name as the original
> 6. make new changes
> 7. restore to the snapshot
>
> This is not great because:
> * I sometimes forget to do step 5
> * I can't take a snapshot of the volume while it is still merging. This
> takes 1.5 hours. I want to be able to restore my snapshots multiple times
> per day
>
>
> Is there a flag I can add to `lvconvert` to make it not delete the
> snapshot?
> Alternatively, is there a way I can make a copy of the snapshot before I
> restore it?
>
> It looks like someone else asked this question 10 years ago.
> https://www.redhat.com/archives/linux-lvm/2008-November/msg00000.html
> Has this problem been solved since then?
>
> Thanks,
> Matt Davis
>
> Technical Specialist
> Telstra | Product Strategy & Innovation - Telstra Labs | Programmable
> Infrastructure
> E  Matthew.Davis.2@team.telstra.com
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000000000000e76524057e8a71f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Drop me an email; there =
are other ways to perform this without &quot;destroying&quot; the old snaps=
hot.</div><div><br></div><div>Regards Tomas<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">Den tors 3 jan. 2019 kl 10:29 skrev Davis=
, Matthew &lt;<a href=3D"mailto:Matthew.Davis.2@team.telstra.com">Matthew.D=
avis.2@team.telstra.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi,<br>
<br>
I want to restore a snapshot without deleting the snapshot.<br>
<br>
My use case is that I&#39;m experimenting with a lot of different drivers, =
kernel modules, and file modifications all over my machine.<br>
I want to <br>
1. take a snapshot of the working system<br>
2. make changes<br>
3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT`=
 then reboot)<br>
4. make new changes<br>
5. restore to the snapshot again<br>
<br>
The problem is that step 3 deletes the snapshot, so step 5 fails.<br>
<br>
My current workaround is:<br>
1. take a snapshot of the working system<br>
2. make changes<br>
3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT`=
 then reboot)<br>
4. Wait 1.5 hours, without making any changes to the machine<br>
5. Take a new snapshot, with the same name as the original<br>
6. make new changes<br>
7. restore to the snapshot<br>
<br>
This is not great because:<br>
* I sometimes forget to do step 5<br>
* I can&#39;t take a snapshot of the volume while it is still merging. This=
 takes 1.5 hours. I want to be able to restore my snapshots multiple times =
per day<br>
<br>
<br>
Is there a flag I can add to `lvconvert` to make it not delete the snapshot=
?<br>
Alternatively, is there a way I can make a copy of the snapshot before I re=
store it?<br>
<br>
It looks like someone else asked this question 10 years ago. <br>
<a href=3D"https://www.redhat.com/archives/linux-lvm/2008-November/msg00000=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archives=
/linux-lvm/2008-November/msg00000.html</a><br>
Has this problem been solved since then?<br>
<br>
Thanks,<br>
Matt Davis<br>
<br>
Technical Specialist<br>
Telstra | Product Strategy &amp; Innovation - Telstra Labs | Programmable I=
nfrastructure<br>
E =C2=A0<a href=3D"mailto:Matthew.Davis.2@team.telstra.com" target=3D"_blan=
k">Matthew.Davis.2@team.telstra.com</a> <br>
<br>
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
</blockquote></div>

--000000000000e76524057e8a71f2--
