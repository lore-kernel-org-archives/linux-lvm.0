Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0KItcvo022015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 13:55:38 -0500
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mx1.redhat.com (Postfix) with ESMTPS id 2F961C0AD1CD
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 18:55:36 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 123so145161419wmz.0
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 10:55:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
	<CAD+pdNf6KfT_Kb7uG8S7gv-L+COgUMGXvQneQ6MxKHdOfcdr9Q@mail.gmail.com>
In-Reply-To: <CAD+pdNf6KfT_Kb7uG8S7gv-L+COgUMGXvQneQ6MxKHdOfcdr9Q@mail.gmail.com>
From: Bryan Larsen <bryan@larsen.st>
Date: Wed, 20 Jan 2016 18:55:25 +0000
Message-ID: <CAJbEnTzqUtng4LK-AXGAsmy5KoohrH1f9MC0kPUAjngdpW9dVw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a114af70601b89d0529c8887d
Subject: Re: [linux-lvm] -l 100%FREE doesn't work with RAID1
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

--001a114af70601b89d0529c8887d
Content-Type: text/plain; charset=UTF-8

On Wed, 20 Jan 2016 at 13:29 Fran Garcia <franchu.garcia@gmail.com> wrote:

> On 20 January 2016 at 13:19, Bryan Larsen <bryan@larsen.st> wrote:
> > I'm setting up some provisioning scripts, so I don't know the actual
> sizes
> > of the hard drives
> >
> > $ sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg
> >   Insufficient free space: 781320 extents needed, but only 390658
> available
> > $ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd_vg
> >   Insufficient free space: 390662 extents needed, but only 390658
> available
>
> the quick and dirty solution... :
>
> EXTENTS=$(sudo vgs -o vg_all --noheadings hdd_vg | awk '{print $12/2}')
> lvcreate --type raid1 -m 1 -l $EXTENTS -n backups hdd_vg
>
> :-)
>

Two problems with that.

1: I had to replace $12 with $9 to get things to work with my version.   So
probably best to use -o vg_free_count instead of -o vg_all

2: but more importantly, it has the same problem as -l 50%FREE:

  Insufficient free space: 390662 extents needed, but only 390658 available

This works for me:

EXTENTS=$((`sudo vgs -o vg_free_count --noheading hdd_vg`/2 - 2))
sudo lvcreate --type raid1 -m 1 -l $EXTENTS -n backups hdd_vg

Bryan

--001a114af70601b89d0529c8887d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 20 Jan=
 2016 at 13:29 Fran Garcia &lt;<a href=3D"mailto:franchu.garcia@gmail.com">=
franchu.garcia@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On 20 January 2016 at 13:19, Bryan Larsen &lt;<a href=3D"mailto:bryan@=
larsen.st" target=3D"_blank">bryan@larsen.st</a>&gt; wrote:<br>
&gt; I&#39;m setting up some provisioning scripts, so I don&#39;t know the =
actual sizes<br>
&gt; of the hard drives<br>
&gt;<br>
&gt; $ sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg<br>
&gt;=C2=A0 =C2=A0Insufficient free space: 781320 extents needed, but only 3=
90658 available<br>
&gt; $ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd_vg<br>
&gt;=C2=A0 =C2=A0Insufficient free space: 390662 extents needed, but only 3=
90658 available<br>
<br>
the quick and dirty solution... :<br>
<br>
EXTENTS=3D$(sudo vgs -o vg_all --noheadings hdd_vg | awk &#39;{print $12/2}=
&#39;)<br>
lvcreate --type raid1 -m 1 -l $EXTENTS -n backups hdd_vg<br>
<br>
:-)<br></blockquote><div><br></div><div>Two problems with that.</div><div><=
br></div><div>1: I had to replace $12 with $9 to get things to work with my=
 version. =C2=A0 So probably best to use -o vg_free_count instead of -o vg_=
all</div><div><br></div><div>2: but more importantly, it has the same probl=
em as -l 50%FREE:</div><div><br></div><div>=C2=A0 Insufficient free space: =
390662 extents needed, but only 390658 available</div><div><br></div><div>T=
his works for me:</div><div><br></div><div><div>EXTENTS=3D$((`sudo vgs -o v=
g_free_count --noheading hdd_vg`/2 - 2))</div><div>sudo lvcreate --type rai=
d1 -m 1 -l $EXTENTS -n backups hdd_vg</div></div><div><br></div><div>Bryan<=
/div></div></div>

--001a114af70601b89d0529c8887d--
