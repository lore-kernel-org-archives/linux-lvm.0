Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBD7FPqY010695
	for <linux-lvm@redhat.com>; Fri, 13 Dec 2013 02:15:25 -0500
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBD7FN5G021012
	for <linux-lvm@redhat.com>; Fri, 13 Dec 2013 02:15:23 -0500
Received: by mail-ve0-f169.google.com with SMTP id c14so1101922vea.14
	for <linux-lvm@redhat.com>; Thu, 12 Dec 2013 23:15:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131211141911.GF4894@agk-dp.fab.redhat.com>
References: <CA+Q0qhddVT+JH9__r7cnONZmr7EE9mFnV8ax-e=ObyNc8hAong@mail.gmail.com>
	<20131211141911.GF4894@agk-dp.fab.redhat.com>
Date: Fri, 13 Dec 2013 15:15:22 +0800
Message-ID: <CA+Q0qhcU8Wbu8oGaCm13m9-LR3nz3am+5zAQ+B8PsCk7eBPG=w@mail.gmail.com>
From: George Brian <biangw@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b676fd0bb08b204ed65395a
Subject: Re: [linux-lvm] How to place LVM2 metadata to other disks which
 don't belong to any volume group?
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
To: George Brian <biangw@gmail.com>, linux-lvm@redhat.com

--047d7b676fd0bb08b204ed65395a
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

Hi=A3=AC

thank for your reply.

I read about "lvm.conf" and "man pvcreate" and practice like your
instruction.
but it's hard to meet my expection.

I do as follows:
1, setting lvm.conf to dirs
2, pvcreate --pvmetadatacopies 0
3, vgcreate on pv
Aborting vg_write: No metadata areas to write to!

I indeed want to  store metadata in common disk such as /dev/sdb,
eventually to store all vg's metadata to one singe disk which specially
used to store metadata without data.

thanks




2013/12/11 Alasdair G Kergon <agk@redhat.com>

> On Wed, Dec 11, 2013 at 03:06:13PM +0800, George Brian wrote:
> > Instead of storing metadata on PV metadata areas, now I want to store i=
t
> to
> > other disks which don't belong to any volume group, just common disk.
>
> This can indeed be done but because it is not a configuration that receiv=
es
> much testing you should check the things you want to do work for you in
> your particular circumstances.
>
> LVM needs to use one 512-byte sector on the device to label it as a PV
> and store its UUID.  By default the 2nd sector is used as this is normall=
y
> free.  Read about --labelsector in 'man pvcreate' and use
> --pvmetadatacopies 0.
>
> Then read about the 'dirs' setting in the 'metadata' section in 'man
> lvm.conf':
>
>         dirs  =A1=AA List of directories holding live copies of LVM2 meta=
data
>         as text files.  These directories must not be  on  logical  vol=
=A9\
>         umes.   It  is possible to use LVM2 with a couple of directories
>         here, preferably on different  (non-logical-volume)  filesystems
>         and  with  no  other  on-disk  metadata,  pvmetadatacopies  =3D 0=
.
>         Alternatively these directories can be in addition  to  the  on-
>         disk metadata areas.  This feature was created during the devel=
=A9\
>         opment of the LVM2 metadata  before  the  new  on-disk  metadata
>         areas  were  designed and no longer gets tested.  It is not sup=
=A9\
>         ported under low-memory conditions, and it is important never to
>         edit these metadata files unless you fully understand how things
>         work: to make changes you should always use the tools as normal,
>         or else vgcfgbackup, edit backup, vgcfgrestore.
>
> Alasdair
>
>

--047d7b676fd0bb08b204ed65395a
Content-Type: text/html; charset=GB2312
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=A3=AC<div><br></div><div>thank for your reply.</div><di=
v><br></div><div style>I read about &quot;lvm.conf&quot; and &quot;man pvcr=
eate&quot; and practice like your instruction.</div><div style>but it&#39;s=
 hard to meet my expection.</div>
<div style><br></div><div style>I do as follows:</div><div style>1, setting=
 lvm.conf to dirs</div><div style>2, pvcreate --pvmetadatacopies 0</div><di=
v style>3, vgcreate on pv&nbsp;</div><div style>Aborting vg_write: No metad=
ata areas to write to!<br>
</div><div style><br></div><div style>I indeed want to &nbsp;store metadata=
 in common disk such as /dev/sdb,&nbsp;</div><div style>eventually to store=
 all vg&#39;s metadata to one singe disk which specially used to store meta=
data without data.<br>
</div><div style><br></div><div style>thanks</div><div style><br></div><div=
 style><br></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">2013/12/11 Alasdair G Kergon <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:agk@redhat.com" target=3D"_blank">agk@redhat.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Wed, Dec 11, 2013 at 03:06:13PM +0800, Ge=
orge Brian wrote:<br>
&gt; Instead of storing metadata on PV metadata areas, now I want to store =
it to<br>
&gt; other disks which don&#39;t belong to any volume group, just common di=
sk.<br>
<br>
This can indeed be done but because it is not a configuration that receives=
<br>
much testing you should check the things you want to do work for you in<br>
your particular circumstances.<br>
<br>
LVM needs to use one 512-byte sector on the device to label it as a PV<br>
and store its UUID. &nbsp;By default the 2nd sector is used as this is norm=
ally<br>
free. &nbsp;Read about --labelsector in &#39;man pvcreate&#39; and use --pv=
metadatacopies 0.<br>
<br>
Then read about the &#39;dirs&#39; setting in the &#39;metadata&#39; sectio=
n in &#39;man lvm.conf&#39;:<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; dirs &nbsp;&mdash; List of directories holding =
live copies of LVM2 metadata<br>
&nbsp; &nbsp; &nbsp; &nbsp; as text files. &nbsp;These directories must not=
 be &nbsp;on &nbsp;logical &nbsp;vol=A9\<br>
&nbsp; &nbsp; &nbsp; &nbsp; umes. &nbsp; It &nbsp;is possible to use LVM2 w=
ith a couple of directories<br>
&nbsp; &nbsp; &nbsp; &nbsp; here, preferably on different &nbsp;(non-logica=
l-volume) &nbsp;filesystems<br>
&nbsp; &nbsp; &nbsp; &nbsp; and &nbsp;with &nbsp;no &nbsp;other &nbsp;on-di=
sk &nbsp;metadata, &nbsp;pvmetadatacopies &nbsp;=3D 0.<br>
&nbsp; &nbsp; &nbsp; &nbsp; Alternatively these directories can be in addit=
ion &nbsp;to &nbsp;the &nbsp;on-<br>
&nbsp; &nbsp; &nbsp; &nbsp; disk metadata areas. &nbsp;This feature was cre=
ated during the devel=A9\<br>
&nbsp; &nbsp; &nbsp; &nbsp; opment of the LVM2 metadata &nbsp;before &nbsp;=
the &nbsp;new &nbsp;on-disk &nbsp;metadata<br>
&nbsp; &nbsp; &nbsp; &nbsp; areas &nbsp;were &nbsp;designed and no longer g=
ets tested. &nbsp;It is not sup=A9\<br>
&nbsp; &nbsp; &nbsp; &nbsp; ported under low-memory conditions, and it is i=
mportant never to<br>
&nbsp; &nbsp; &nbsp; &nbsp; edit these metadata files unless you fully unde=
rstand how things<br>
&nbsp; &nbsp; &nbsp; &nbsp; work: to make changes you should always use the=
 tools as normal,<br>
&nbsp; &nbsp; &nbsp; &nbsp; or else vgcfgbackup, edit backup, vgcfgrestore.=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Alasdair<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b676fd0bb08b204ed65395a--
