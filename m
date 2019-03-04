Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B35AD1001DCE
	for <linux-lvm@redhat.com>; Mon,  4 Mar 2019 23:22:52 +0000 (UTC)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
	[209.85.221.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C831881DEC
	for <linux-lvm@redhat.com>; Mon,  4 Mar 2019 23:22:51 +0000 (UTC)
Received: by mail-vk1-f199.google.com with SMTP id f142so4285273vkd.18
	for <linux-lvm@redhat.com>; Mon, 04 Mar 2019 15:22:51 -0800 (PST)
MIME-Version: 1.0
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<CAMRbyyuVek7CnYhD3S6JcYLTfxP73CScpErCX3D2eapbfJgd4g@mail.gmail.com>
	<840f278d-fc42-a2ea-03b2-cea5f32b4837@gmail.com>
In-Reply-To: <840f278d-fc42-a2ea-03b2-cea5f32b4837@gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 5 Mar 2019 01:22:39 +0200
Message-ID: <CAMRbyyuK+w5bM4QLewDpMWzjVwa=nyrUS6rmgri0OATdWW4Avw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000003faf805834d0916"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
To: Cesare Leonardi <celeonar@gmail.com>
Cc: Ingo Franzki <ifranzki@linux.ibm.com>, David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

--00000000000003faf805834d0916
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 12:45 AM Cesare Leonardi <celeonar@gmail.com> wrote:

> On 02/03/19 21:25, Nir Soffer wrote:
> > # mkfs.xfs /dev/test/lv1
> > meta-data=/dev/test/lv1          isize=512    agcount=4, agsize=25600
> blks
> >           =                       sectsz=512   attr=2, projid32bit=1
> >           =                       crc=1        finobt=1, sparse=0,
> > rmapbt=0, reflink=0
> > data     =                       bsize=4096   blocks=102400, imaxpct=25
> >           =                       sunit=0      swidth=0 blks
> > naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
> > log      =internal log           bsize=4096   blocks=855, version=2
> >           =                       sectsz=512   sunit=0 blks, lazy-count=1
> > realtime =none                   extsz=4096   blocks=0, rtextents=0
>
> Has the problem here the same root as for ext4? I guess sectsz should be
>  >=4096 to avoid troubles, isn't it?
>
> Just to draw some conlusion, could we say that currently, if we are
> going to move data around with LVM, it's better to check that the
> filesystem is using a block size >= than "blockdev --getbsz
> DESTINATIONDEVICE"? At least with ext4 and xfs.
>
> Something that couldn't be true with really small devices (< 500 MB).
>
> Is there already an open bug regarding the problem discussed in this
> thread?
>

There is this bug about lvextend:
https://bugzilla.redhat.com/1669751

And this old bug from 2011, discussing mixing PVs with different block size.
Comment 2 is very clear about this issue:
https://bugzilla.redhat.com/732980#c2

Nir

--00000000000003faf805834d0916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0=
,0,0)"><span style=3D"color:rgb(34,34,34)">On Tue, Mar 5, 2019 at 12:45 AM =
Cesare Leonardi &lt;<a href=3D"mailto:celeonar@gmail.com" target=3D"_blank"=
>celeonar@gmail.com</a>&gt; wrote:</span><br></div></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 02/03/19 21:2=
5, Nir Soffer wrote:<br>
&gt; # mkfs.xfs /dev/test/lv1<br>
&gt; meta-data=3D/dev/test/lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isize=3D51=
2=C2=A0 =C2=A0 agcount=3D4, agsize=3D25600 blks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sectsz=3D512=C2=A0 =
=C2=A0attr=3D2, projid32bit=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crc=3D1=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 finobt=3D1, sparse=3D0, <br>
&gt; rmapbt=3D0, reflink=3D0<br>
&gt; data=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsize=3D4096=C2=A0 =C2=A0blocks=3D=
102400, imaxpct=3D25<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sunit=3D0=C2=A0 =C2=
=A0 =C2=A0 swidth=3D0 blks<br>
&gt; naming=C2=A0 =C2=A0=3Dversion 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bsize=3D4096=C2=A0 =C2=A0ascii-ci=3D0 ftype=3D1<br>
&gt; log=C2=A0 =C2=A0 =C2=A0 =3Dinternal log=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bsize=3D4096=C2=A0 =C2=A0blocks=3D855, version=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sectsz=3D512=C2=A0 =
=C2=A0sunit=3D0 blks, lazy-count=3D1<br>
&gt; realtime =3Dnone=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0extsz=3D4096=C2=A0 =C2=A0blocks=3D0, rtextents=3D0<br>
<br>
Has the problem here the same root as for ext4? I guess sectsz should be <b=
r>
=C2=A0&gt;=3D4096 to avoid troubles, isn&#39;t it?<br>
<br>
Just to draw some conlusion, could we say that currently, if we are <br>
going to move data around with LVM, it&#39;s better to check that the <br>
filesystem is using a block size &gt;=3D than &quot;blockdev --getbsz <br>
DESTINATIONDEVICE&quot;? At least with ext4 and xfs.<br>
<br>
Something that couldn&#39;t be true with really small devices (&lt; 500 MB)=
.<br>
<br>
Is there already an open bug regarding the problem discussed in this thread=
?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small;color:rgb(0,0,0)">There is this bug about lvextend:</div><=
div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><a h=
ref=3D"https://bugzilla.redhat.com/1669751" target=3D"_blank">https://bugzi=
lla.redhat.com/1669751</a></div><div class=3D"gmail_default" style=3D"font-=
size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)">And this old bug from 2011, discussin=
g mixing PVs with different block size.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small;color:rgb(0,0,0)">Comment 2 is very clear about thi=
s issue:<br></div><div class=3D"gmail_default"><font color=3D"#000000"><a h=
ref=3D"https://bugzilla.redhat.com/732980#c2">https://bugzilla.redhat.com/7=
32980#c2</a><br></font></div><div class=3D"gmail_default"><br></div><div cl=
ass=3D"gmail_default"><font color=3D"#000000">Nir</font></div></div></div><=
/div></div></div></div>

--00000000000003faf805834d0916--
