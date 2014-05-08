Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s489Txik002952
	for <linux-lvm@redhat.com>; Thu, 8 May 2014 05:30:00 -0400
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s489TtQB004581
	for <linux-lvm@redhat.com>; Thu, 8 May 2014 05:29:56 -0400
Received: by mail-ob0-f175.google.com with SMTP id wo20so2689140obc.34
	for <linux-lvm@redhat.com>; Thu, 08 May 2014 02:29:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140507152757.GA30839@redhat.com>
References: <CAPrERe1-+T+PpQ1gTBUSKzCjKn498TbH45Jnsrf5hrLLHgUiqA@mail.gmail.com>
	<20140507152757.GA30839@redhat.com>
Date: Thu, 8 May 2014 11:29:54 +0200
Message-ID: <CAPrERe2wMEa=FTAPn85kaWdVB1tS80YS2eeXpMYJ5eJhE0xwiQ@mail.gmail.com>
From: Marc Caubet <mcaubet@pic.es>
Content-Type: multipart/alternative; boundary=001a11c339e6b2f04f04f8e01f9e
Subject: Re: [linux-lvm] Alignment: XFS + LVM2
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com

--001a11c339e6b2f04f04f8e01f9e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mike,

thanks a lot for your answer.

> Hi all,
> >
> > I am trying to setup a storage pool with correct disk alignment and I
> hope
> > somebody can help me to understand some unclear parts to me when
> > configuring XFS over LVM2.
> >
> > Actually we have few storage pools with the following settings each:
> >
> > - LSI Controller with 3xRAID6
> > - Each RAID6 is configured with 10 data disks + 2 for double-parity.
> > - Each disk has a capacity of 4TB, 512e and physical sector size of 4K.
> > - 3x(10+2) configuration was considered in order to gain best performan=
ce
> > and data safety (less disks per RAID less probability of data corruptio=
n)
>
> What is the chunk size used for these RAID6 devices?
> Say it is 256K, you have 10 data devices, so the full stripe would be
> 2560K.
>

Actually chunk size is 256KB (in a near future we will try 1MB as we are
managing large files but actually we want to keep the current configuration
of 256KB)

Which version of lvm2 and kernel are you using?  Newer versions support
> a striped LV stripesize that is not a power-of-2.
>

Current LVM2 version is  lvm2-2.02.100-8.el6.x86_64

> >From the O.S. side we see:
> >
> > [root@stgpool01 ~]# fdisk -l /dev/sda /dev/sdb /dev/sdc
> >
> > Disk /dev/sda: 40000.0 GB, 39999997214720 bytes
> > 255 heads, 63 sectors/track, 4863055 cylinders
> > Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
> > Sector size (logical/physical): 512 bytes / 4096 bytes
> > I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> > Disk identifier: 0x00000000
> >
> > Disk /dev/sdb: 40000.0 GB, 39999997214720 bytes
> > 255 heads, 63 sectors/track, 4863055 cylinders
> > Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
> > Sector size (logical/physical): 512 bytes / 4096 bytes
> > I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> > Disk identifier: 0x00000000
> >
> > Disk /dev/sdc: 40000.0 GB, 39999997214720 bytes
> > 255 heads, 63 sectors/track, 4863055 cylinders
> > Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
> > Sector size (logical/physical): 512 bytes / 4096 bytes
> > I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> > Disk identifier: 0x00000000
> >
> > The idea is to aggregate the above devices and show only 1 storage spac=
e.
> > We did as follows:
> >
> > vgcreate dcvg_a /dev/sda /dev/sdb /dev/sdc
> > lvcreate -i 3 -I 4096 -n dcpool -l 100%FREE -v dcvg_a
>
> I'd imagine you'd want the stripesize of this striped LV to match the
> underlying RAID6 stripesize no?  So 2560K, e.g. -i 3 -I 2560
>
> That makes for a very large full stripe through...
>

Hence for a RAID6 with 256KB of stripe size "I" should be 2560. Does it
mean that the "I" parameter is stripesize*number_of_data_disks? I mean, if
I have 16 data disks in a RAID6 and 1MB of stripe size, which should be the
"I" value?

On the other hand, yes, 2560 is a large full stripe but we are mostly
managing large files (hundred MBs and few GB), so I guess this is ok. Is
possible to check the minimum recommended file size for a configuration
like this? I would like to know it because we also have few storage pools
(less than 3% of the total) we a small file profile and I would like to fit
the disk configuration to its workload type.

> Hence, stripe of the 3 RAID6 in a LV.
> >
> > And here is my first question: How can I check if the storage and the L=
V
> > are correctly aligned?
> >
> > On the other hand, I have formatted XFS as follows:
> >
> > mkfs.xfs -d su=3D256k,sw=3D10 -l size=3D128m,lazy-count=3D1 /dev/dcvg_a=
/dcpool
> >
> > So my second question is, are the above 'su' and 'sw' parameters correc=
t
> on
> > the current LV configuration? If not, which values should I have and wh=
y?
> > AFAIK su is the stripe size configured in the controller side, but in
> this
> > case we have a LV. Also, sw is the number of data disks in a RAID, but
> > again, we have a LV with 3 stripes, and I am not sure if the number of
> data
> > disks should be 30 instead.
>
> Newer versions of mkfs.xfs _should_ pick up the hints exposed (as
> minimum_io_size and optimal_io_size) by the striped LV.
>
> But if not you definitely don't want to be trying to pierce through the
> striped LV config to establish settings of the underlying RAID6.  Each
> layer in the stack should respect the layer beneath it.  So, if the
> striped LV is configured how you'd like, you should only concern
> yourself with the limits that have been established for the topmost
> striped LV that you're layering XFS on.
>

Current XFS package has the version xfsprogs-3.1.1-14.el6.x86_64 and comes
with Scientific Linux 6. Then, how should I manage the XFS 'su' and 'sw'
parameters from the LVM2 configuration in order to ensure disk alignment in
order to have best performance?

Once again, thanks a lot for you help,
--=20
Marc Caubet Serrabou
PIC (Port d'Informaci=C3=B3 Cient=C3=ADfica)
Campus UAB, Edificio D
E-08193 Bellaterra, Barcelona
Tel: +34 93 581 33 22
Fax: +34 93 581 41 10
http://www.pic.es
Avis - Aviso - Legal Notice: http://www.ifae.es/legal.html

--001a11c339e6b2f04f04f8e01f9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mike,<br><br>thanks a lot for your answer. <br><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<div class=3D"">
&gt; Hi all,<br>
&gt;<br>
&gt; I am trying to setup a storage pool with correct disk alignment and I =
hope<br>
&gt; somebody can help me to understand some unclear parts to me when<br>
&gt; configuring XFS over LVM2.<br>
&gt;<br>
&gt; Actually we have few storage pools with the following settings each:<b=
r>
&gt;<br>
&gt; - LSI Controller with 3xRAID6<br>
&gt; - Each RAID6 is configured with 10 data disks + 2 for double-parity.<b=
r>
&gt; - Each disk has a capacity of 4TB, 512e and physical sector size of 4K=
.<br>
&gt; - 3x(10+2) configuration was considered in order to gain best performa=
nce<br>
&gt; and data safety (less disks per RAID less probability of data corrupti=
on)<br>
<br>
</div>What is the chunk size used for these RAID6 devices?<br>
Say it is 256K, you have 10 data devices, so the full stripe would be<br>
2560K.<br></blockquote><div><br></div><div>Actually chunk size is 256KB (in=
 a near future we will try 1MB as we are managing large files but actually =
we want to keep the current configuration of 256KB)<br></div><div><br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Which version of lvm2 and kernel are you using? =C2=A0Newer versions suppor=
t<br>
a striped LV stripesize that is not a power-of-2.<br></blockquote><div><br>=
Current LVM2 version is=C2=A0 lvm2-2.02.100-8.el6.x86_64<br><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D"">
&gt; &gt;From the O.S. side we see:<br>
&gt;<br>
&gt; [root@stgpool01 ~]# fdisk -l /dev/sda /dev/sdb /dev/sdc<br>
&gt;<br>
&gt; Disk /dev/sda: 40000.0 GB, 39999997214720 bytes<br>
&gt; 255 heads, 63 sectors/track, 4863055 cylinders<br>
&gt; Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
&gt; Sector size (logical/physical): 512 bytes / 4096 bytes<br>
&gt; I/O size (minimum/optimal): 4096 bytes / 4096 bytes<br>
&gt; Disk identifier: 0x00000000<br>
&gt;<br>
&gt; Disk /dev/sdb: 40000.0 GB, 39999997214720 bytes<br>
&gt; 255 heads, 63 sectors/track, 4863055 cylinders<br>
&gt; Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
&gt; Sector size (logical/physical): 512 bytes / 4096 bytes<br>
&gt; I/O size (minimum/optimal): 4096 bytes / 4096 bytes<br>
&gt; Disk identifier: 0x00000000<br>
&gt;<br>
&gt; Disk /dev/sdc: 40000.0 GB, 39999997214720 bytes<br>
&gt; 255 heads, 63 sectors/track, 4863055 cylinders<br>
&gt; Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
&gt; Sector size (logical/physical): 512 bytes / 4096 bytes<br>
&gt; I/O size (minimum/optimal): 4096 bytes / 4096 bytes<br>
&gt; Disk identifier: 0x00000000<br>
&gt;<br>
&gt; The idea is to aggregate the above devices and show only 1 storage spa=
ce.<br>
&gt; We did as follows:<br>
&gt;<br>
&gt; vgcreate dcvg_a /dev/sda /dev/sdb /dev/sdc<br>
&gt; lvcreate -i 3 -I 4096 -n dcpool -l 100%FREE -v dcvg_a<br>
<br>
</div>I&#39;d imagine you&#39;d want the stripesize of this striped LV to m=
atch the<br>
underlying RAID6 stripesize no? =C2=A0So 2560K, e.g. -i 3 -I 2560<br>
<br>
That makes for a very large full stripe through...<br></blockquote><div><br=
></div><div> Hence for a RAID6 with 256KB of stripe size &quot;I&quot; shou=
ld be 2560. Does it mean that the &quot;I&quot; parameter is stripesize*num=
ber_of_data_disks? I mean, if I have 16 data disks in a RAID6 and 1MB of st=
ripe size, which should be the &quot;I&quot; value?<br>
<br>On the other hand, yes, 2560 is a large full stripe but we are mostly m=
anaging large files (hundred MBs and few GB), so I guess this is ok. Is pos=
sible to check the minimum recommended file size for a configuration like t=
his? I would like to know it because we also have few storage pools (less t=
han 3% of the total) we a small file profile and I would like to fit the di=
sk configuration to its workload type.<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""=
>
&gt; Hence, stripe of the 3 RAID6 in a LV.<br>
&gt;<br>
&gt; And here is my first question: How can I check if the storage and the =
LV<br>
&gt; are correctly aligned?<br>
&gt;<br>
&gt; On the other hand, I have formatted XFS as follows:<br>
&gt;<br>
&gt; mkfs.xfs -d su=3D256k,sw=3D10 -l size=3D128m,lazy-count=3D1 /dev/dcvg_=
a/dcpool<br>
&gt;<br>
&gt; So my second question is, are the above &#39;su&#39; and &#39;sw&#39; =
parameters correct on<br>
&gt; the current LV configuration? If not, which values should I have and w=
hy?<br>
&gt; AFAIK su is the stripe size configured in the controller side, but in =
this<br>
&gt; case we have a LV. Also, sw is the number of data disks in a RAID, but=
<br>
&gt; again, we have a LV with 3 stripes, and I am not sure if the number of=
 data<br>
&gt; disks should be 30 instead.<br>
<br>
</div>Newer versions of mkfs.xfs _should_ pick up the hints exposed (as<br>
minimum_io_size and optimal_io_size) by the striped LV.<br>
<br>
But if not you definitely don&#39;t want to be trying to pierce through the=
<br>
striped LV config to establish settings of the underlying RAID6. =C2=A0Each=
<br>
layer in the stack should respect the layer beneath it. =C2=A0So, if the<br=
>
striped LV is configured how you&#39;d like, you should only concern<br>
yourself with the limits that have been established for the topmost<br>
striped LV that you&#39;re layering XFS on.<br>
</blockquote></div><br>Current XFS package has the version xfsprogs-3.1.1-1=
4.el6.x86_64 and comes with Scientific Linux 6. Then, how should I manage t=
he XFS &#39;su&#39; and &#39;sw&#39; parameters from the LVM2 configuration=
 in order to ensure disk alignment in order to have best performance? <br>
<br></div><div class=3D"gmail_extra">Once again, thanks a lot for you help,=
<br></div><div class=3D"gmail_extra">-- <br>Marc Caubet Serrabou<br>PIC (Po=
rt d&#39;Informaci=C3=B3 Cient=C3=ADfica)<br>Campus UAB, Edificio D<br>E-08=
193 Bellaterra, Barcelona<br>
Tel: +34 93 581 33 22<br>Fax: +34 93 581 41 10<br><a href=3D"http://www.pic=
.es" target=3D"_blank">http://www.pic.es</a><br>Avis - Aviso - Legal Notice=
: <a href=3D"http://www.ifae.es/legal.html" target=3D"_blank">http://www.if=
ae.es/legal.html</a>
</div></div>

--001a11c339e6b2f04f04f8e01f9e--
