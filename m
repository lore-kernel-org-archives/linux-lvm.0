Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5DG9WvP022439
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 12:09:32 -0400
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5DG9UBx021538
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 12:09:30 -0400
Received: by lahd3 with SMTP id d3so673849lah.33
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 09:09:29 -0700 (PDT)
MIME-Version: 1.0
Sender: sikieresmescribes@gmail.com
Date: Wed, 13 Jun 2012 18:09:29 +0200
Message-ID: <CAL-GF3yZzybqySBcYETyVZ+s5RpURFQkq+WUGcbBGqHh7yL0CA@mail.gmail.com>
From: Da <dcodix@gmail.com>
Content-Type: multipart/alternative; boundary=f46d0408da07d4dd3204c25cce38
Subject: Re: [linux-lvm] lvremove snapshot hangs LVM system
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

--f46d0408da07d4dd3204c25cce38
Content-Type: text/plain; charset=ISO-8859-1

I went a bit further and I think I discovered what is blocking lvm.

When I use "lvremove" I see that the involved "dm" are not deleted, but
SUSPENDED:



[root@node2 ~]# lvremove -f /dev/vgtest01/snap20
  Logical volume "snap20" successfully removed
[root@node2 ~]# dmsetup -vvv status vgtest01-snap20
dm version   OF   [16384]
dm status vgtest01-snap20  OF   [16384]
Name:              vgtest01-snap20
State:             SUSPENDED
vgtest01-snap20: read ahead is 256
Read Ahead:        256
Tables present:    LIVE & INACTIVE
Open count:        0
Event number:      0
Major, minor:      253, 4
Number of targets: 1
UUID: LVM-fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNWytFJGEg5qYFByZ79PjPNoKPnf8KyiiZ

0 409600 snapshot 16/40960 16
[root@node2 ~]# dmsetup -vvv status vgtest01-snap20-cow
dm version   OF   [16384]
dm status vgtest01-snap20-cow  OF   [16384]
Name:              vgtest01-snap20-cow
State:             SUSPENDED
vgtest01-snap20-cow: read ahead is 256
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 3
Number of targets: 1
UUID:
LVM-fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNWytFJGEg5qYFByZ79PjPNoKPnf8KyiiZ-cow

0 40960 linear

In that situation if I execute any "lvm" command, those suspended "dm" are
blocking any I/O activity, and the lvm command hangs for ever.

If, after or before, trying the command I  resume them:
[root@node2 ~]# dmsetup resume vgtest01-snap20
[root@node2 ~]# dmsetup resume vgtest01-snap20-cow

It will be unblocked. The lvdisplay will work perfectly.
But, for some reason something is not consistent in "lvm". I am not able to
create new snapshots:

[root@node2 ~]# lvcreate -s -L 20M -n snap30 /dev/vgtest01/lvtest-snap01
  /dev/vgtest01/snap30: not found: device not cleared
  Aborting. Failed to wipe snapshot exception store.


So, once here. Do someone know if this situation implies something
critical? is there any way to solve it without restarting clvm ?

I will keep in it.

Thanks!

--f46d0408da07d4dd3204c25cce38
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I went a bit further and I think I discovered what is blocking lvm.<br><br>=
When I use &quot;lvremove&quot; I see that the involved &quot;dm&quot; are =
not deleted, but SUSPENDED:<br><br><br><br>[root@node2 ~]# lvremove -f /dev=
/vgtest01/snap20<br>
=A0 Logical volume &quot;snap20&quot; successfully removed<br>[root@node2 ~=
]# dmsetup -vvv status vgtest01-snap20<br>dm version=A0=A0 OF=A0=A0 [16384]=
<br>dm status vgtest01-snap20=A0 OF=A0=A0 [16384]<br>Name:=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 vgtest01-snap20<br>
State:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SUSPENDED<br>vgtest01-snap20: re=
ad ahead is 256<br>Read Ahead:=A0=A0=A0=A0=A0=A0=A0 256<br>Tables present:=
=A0=A0=A0 LIVE &amp; INACTIVE<br>Open count:=A0=A0=A0=A0=A0=A0=A0 0<br>Even=
t number:=A0=A0=A0=A0=A0 0<br>Major, minor:=A0=A0=A0=A0=A0 253, 4<br>Number=
 of targets: 1<br>
UUID: LVM-fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNWytFJGEg5qYFByZ79PjPNoKPnf8KyiiZ<=
br><br>0 409600 snapshot 16/40960 16<br>[root@node2 ~]# dmsetup -vvv status=
 vgtest01-snap20-cow<br>dm version=A0=A0 OF=A0=A0 [16384]<br>dm status vgte=
st01-snap20-cow=A0 OF=A0=A0 [16384]<br>
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgtest01-snap20-cow<br>State:=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SUSPENDED<br>vgtest01-snap20-cow: read=
 ahead is 256<br>Read Ahead:=A0=A0=A0=A0=A0=A0=A0 256<br>Tables present:=A0=
=A0=A0 LIVE<br>Open count:=A0=A0=A0=A0=A0=A0=A0 1<br>Event number:=A0=A0=A0=
=A0=A0 0<br>Major, minor:=A0=A0=A0=A0=A0 253, 3<br>
Number of targets: 1<br>UUID: LVM-fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNWytFJGEg5=
qYFByZ79PjPNoKPnf8KyiiZ-cow<br><br>0 40960 linear <br><br>In that situation=
 if I execute any &quot;lvm&quot; command, those suspended &quot;dm&quot; a=
re blocking any I/O activity, and the lvm command hangs for ever.<br>
<br>If, after or before, trying the command I=A0 resume them:<br>[root@node=
2 ~]# dmsetup resume vgtest01-snap20<br>[root@node2 ~]# dmsetup resume vgte=
st01-snap20-cow<br><br>It will be unblocked. The lvdisplay will work perfec=
tly.<br>
But, for some reason something is not consistent in &quot;lvm&quot;. I am n=
ot able to create new snapshots:<br><br>[root@node2 ~]# lvcreate -s -L 20M =
-n snap30 /dev/vgtest01/lvtest-snap01<br>=A0 /dev/vgtest01/snap30: not foun=
d: device not cleared<br>
=A0 Aborting. Failed to wipe snapshot exception store.<br><br><br>So, once =
here. Do someone know if this situation implies something critical? is ther=
e any way to solve it without restarting clvm ?<br><br>I will keep in it.<b=
r>
<br>Thanks!<br>=A0<br>

--f46d0408da07d4dd3204c25cce38--
