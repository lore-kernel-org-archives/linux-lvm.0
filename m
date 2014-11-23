Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sANK6t8p028749
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 15:06:55 -0500
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sANK6sMH022276
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 15:06:54 -0500
Received: by mail-ig0-f177.google.com with SMTP id uq10so2181458igb.10
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 12:06:53 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 23 Nov 2014 15:06:53 -0500
Message-ID: <CAN3Lo5i7NGiygTLQ9+t5JkqWMXmRwkrcJZVd=bsyHH5yE+P4Pg@mail.gmail.com>
From: Nathan Cuka <nscuka@gmail.com>
Content-Type: multipart/alternative; boundary=089e011826082160dd05088c38b3
Subject: [linux-lvm] Unable to create snapshot due to failed merge of prior
	snapshot
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

--089e011826082160dd05088c38b3
Content-Type: text/plain; charset=UTF-8

Hi Everyone,

I inadvertently created a situation where I deleted an LVM snapshot that
was pending a merge (yes - bonehead move). Now I can neither finish the
merge nor create a new snapshot on the original logical volume. When I try
to create a snapshot I get the following:

> root@ubuntu:~# lvcreate -s -n snap -L 15g /dev/sysvg/syslv
>    Snapshots of an origin that has a merging snapshot is not supported
>
>
and in dmesg I see the following logs:

> Nov 21 20:32:47 ubuntu kernel: [  721.210733] device-mapper: snapshots: Snapshot is marked invalid.
> Nov 21 20:32:47 ubuntu kernel: [  721.211641] device-mapper: snapshots: Snapshot is invalid: can't merge
> Nov 21 20:32:47 ubuntu kernel: [  721.233283] Buffer I/O error on device dm-4, logical block 16
> Nov 21 20:32:47 ubuntu kernel: [  721.233289] Buffer I/O error on device dm-4, logical block 16
>
>
This is not surprising as I did an lvremove of the snapshot (oops). If I do
an lvscan I get the following output:

> root@ubuntu:~# lvscan
>   ACTIVE            '/dev/uservg/userlv' [931.50 GiB] inherit
>   inactive Original '/dev/sysvg/syslv' [152.77 GiB] inherit
>
>
And lvdisplay shows

> root@ubuntu:/# lvdisplay /dev/sysvg/syslv
>   --- Logical volume ---
>   LV Path                /dev/sysvg/syslv
>   LV Name                syslv
>   VG Name                sysvg
>   LV UUID                stuff here
>   LV Write Access        read/write
>   LV Creation host, time hades, 2014-07-09 14:56:49 +0000
>   LV snapshot status     source of
>                          pre-x [INACTIVE]
>   LV Status              available
>   # open                 0
>   LV Size                152.77 GiB
>   Current LE             39108
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           252:3
>
>
So the snapshot status is INACTIVE and is trying to merge but I have no
idea how to make LVM try to stop attempting the merge. I can mount and use
the logical volume without apparent problem, but I really would like to be
able to take a snapshot (which is why I wanted to use LVM in the first
place!)

I think that I need to us a lower level tool like dmsetup to accomplish
this but I am not sure how to use this tool and would prefer not to blow
away root if possible (not the end of the world, but would prefer not too).
With dmsetup I have the following info:

> root@ubuntu:/# dmsetup status /dev/sysvg/syslv
> 0 320372736 snapshot-merge Invalid
>
>
And

> root@ubuntu:/# dmsetup info /dev/sysvg/syslv
> Name:              sysvg-syslv
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        0
> Event number:      0
> Major, minor:      252, 3
> Number of targets: 1
> UUID: stuff here
>
>
I have looked extensively on the intertubes and either my google kung-fu is
slipping or I have reached toxic levels of caffeine (or both) and can't
find much. Does anyone have any advice about how to restore LVM snapshoting
for me?


System:

> root@hades:~$ uname -a
> Linux hades 3.13.0-39-generic #66-Ubuntu SMP Tue Oct 28 13:30:27 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
>
>
LVM info:

> root@ubuntu:/# lvm version
>   LVM version:     2.02.98(2) (2012-10-15)
>   Library version: 1.02.77 (2012-10-15)
>   Driver version:  4.27.0
>
>
TIA

- chook

--089e011826082160dd05088c38b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Everyone,<br><br></div>I inadvertently create=
d a situation where I deleted an LVM snapshot that=20
was pending a merge (yes - bonehead move). Now I can neither finish the=20
merge nor create a new snapshot on the original logical volume.  When I=20
try to create a snapshot I get the following:<br><blockquote style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
" class=3D"gmail_quote"><pre>root@ubuntu:~# lvcreate -s -n snap -L 15g /dev=
/sysvg/syslv
   Snapshots of an origin that has a merging snapshot is not supported</pre=
></blockquote><br></div>and  in dmesg I see the following logs:<br><blockqu=
ote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex" class=3D"gmail_quote"><pre>Nov 21 20:32:47 ubuntu kerne=
l: [  721.210733] device-mapper: snapshots: Snapshot is marked invalid.
Nov 21 20:32:47 ubuntu kernel: [  721.211641] device-mapper: snapshots: Sna=
pshot is invalid: can&#39;t merge
Nov 21 20:32:47 ubuntu kernel: [  721.233283] Buffer I/O error on device dm=
-4, logical block 16
Nov 21 20:32:47 ubuntu kernel: [  721.233289] Buffer I/O error on device dm=
-4, logical block 16</pre></blockquote><div><br>This is not surprising as I=
 did an <code>lvremove</code> of the snapshot (oops).  If I do an <code>lvs=
can</code> I get the following output:<br><blockquote style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=
=3D"gmail_quote"><pre>root@ubuntu:~# lvscan
  ACTIVE            &#39;/dev/uservg/userlv&#39; [931.50 GiB] inherit
  inactive Original &#39;/dev/sysvg/syslv&#39; [152.77 GiB] inherit</pre></=
blockquote><br></div><div>And <code>lvdisplay</code> shows<br><blockquote s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex" class=3D"gmail_quote"><pre>root@ubuntu:/# lvdisplay /dev/sys=
vg/syslv=20
  --- Logical volume ---
  LV Path                /dev/sysvg/syslv
  LV Name                syslv
  VG Name                sysvg
  LV UUID                stuff here
  LV Write Access        read/write
  LV Creation host, time hades, 2014-07-09 14:56:49 +0000
  LV snapshot status     source of
                         pre-x [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                152.77 GiB
  Current LE             39108
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:3</pre></blockquote><br><p>So the snapshot sta=
tus is INACTIVE and is trying to merge but I have=20
no idea how to make LVM try to stop attempting the merge.  I can mount=20
and use the logical volume without apparent problem, but I really would=20
like to be able to take a snapshot (which is why I wanted to use LVM in=20
the first place!)</p>

<p>I think that I need to us a lower level tool like dmsetup to=20
accomplish this but I am not sure how to use this tool and would prefer=20
not to blow away root if possible (not the end of the world, but would=20
prefer not too).  With dmsetup I have the following info:</p><blockquote st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex" class=3D"gmail_quote"><pre>root@ubuntu:/# dmsetup status /dev=
/sysvg/syslv=20
0 320372736 snapshot-merge Invalid</pre></blockquote><div><br>And<br><block=
quote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex" class=3D"gmail_quote"><pre>root@ubuntu:/# dmsetup inf=
o /dev/sysvg/syslv=20
Name:              sysvg-syslv
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      252, 3
Number of targets: 1
UUID: stuff here</pre></blockquote><div><br>I have looked extensively on th=
e intertubes and either my google kung-fu=20
is slipping or I have reached toxic levels of caffeine (or both) and=20
can&#39;t find much.  Does anyone have any advice about how to restore LVM =
=20
snapshoting for me? <br><br><br></div><div>System:<br><blockquote style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex" class=3D"gmail_quote"><pre>root@hades:~$ uname -a
Linux hades 3.13.0-39-generic #66-Ubuntu SMP Tue Oct 28 13:30:27 UTC 2014 x=
86_64 x86_64 x86_64 GNU/Linux</pre></blockquote><div><br>LVM info:<br><bloc=
kquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex" class=3D"gmail_quote"><pre>root@ubuntu:/# lvm versio=
n
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.27.0</pre></blockquote><div><br></div><div>TIA<br><br>=
</div><div>- chook<br><br><br> </div></div></div></div></div><div><br><br><=
br><br><br><br><br></div></div>

--089e011826082160dd05088c38b3--
