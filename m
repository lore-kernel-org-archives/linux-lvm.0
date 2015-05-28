Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4S8JpBT005547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 May 2015 04:19:51 -0400
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mx1.redhat.com (Postfix) with ESMTPS id 342E6BACDB
	for <linux-lvm@redhat.com>; Thu, 28 May 2015 08:19:49 +0000 (UTC)
Received: by labpy14 with SMTP id py14so13923957lab.0
	for <linux-lvm@redhat.com>; Thu, 28 May 2015 01:19:47 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 28 May 2015 11:19:47 +0300
Message-ID: <CADCHJQMn8J8LYf=9QdmXQUnC-77f0Bvia1ywx+-Ma3MSi7ef1w@mail.gmail.com>
From: Oleg Samarin <osamarin68@gmail.com>
Content-Type: multipart/alternative; boundary=089e01228aacd23a1805172005e4
Subject: [linux-lvm] lvm on top of mdraid switches from /dev/md126p2 to
	/dev/sdb2
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

--089e01228aacd23a1805172005e4
Content-Type: text/plain; charset=UTF-8

Hi!

I have an imsm raid-1 device /dev/md126 assembled of /dev/sda and /dev/sdb.
I have a lvm group on top of /dev/md126p2 with some logical volumes. All
this work fine with Fedora 21.

I'm trying to fresh install Fedora 22 in some of lvm logical volume. I boot
with Fedora USB live media and run "Install to hard disk". But anaconda
does not see any existing lvm volumes so I can not choose them as a
destination.

I've created a bug https://bugzilla.redhat.com/show_bug.cgi?id=1178181 on
this issue.

After some discovering I found that the reason of this issue is that
anaconda brakes lvm:

before launching anaconda pvdisplay reports there are two physical volumes
/dev/md126p2 and /dev/sdc2 (/dev/sdc is an SSD that does not belong any
raid and contains a separate lvm volume group)

after launching anaconda pvdisplay reports another two physical volumes
/dev/sdb2 and /dev/sdc2, that is wrong, because /dev/sdb is a part of
/dev/md126 raid.

journalctl shows:

May 28 02:44:08 localhost systemd[1]: Stopping LVM2 PV scan on device
259:1...
May 28 02:44:08 localhost systemd[1]: Stopped LVM2 PV scan on device 259:1.
May 28 02:44:08 localhost audit[1]: <audit-1131> pid=1 uid=0
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
msg='unit=lvm2-pvscan@259:1 comm="systemd" exe="/usr/lib/systemd/systemd"
hostname=? addr=? terminal=? res=success'
May 28 02:44:09 localhost kernel:  sde:
May 28 02:44:09 localhost kernel:  sda: sda1 sda2
May 28 02:44:09 localhost systemd[1]: Starting LVM2 PV scan on device 8:2...
May 28 02:44:09 localhost kernel:  sdb: sdb1 sdb2

Seems lvm stopped using '/dev/md126p2'. Futhure lvm rescans force it to use
/dev/sdb2 instead.

The attached storage.log contains a trace of udev events of this. All other
logs are available
in https://bugzilla.redhat.com/show_bug.cgi?id=1178181

What is wrong? How to force lvm to use /dev/md126p2 instead of /dev/sdb2
after starting anaconda?

--089e01228aacd23a1805172005e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hi!<br><br></div>I have=
 an imsm=20
raid-1 device /dev/md126 assembled of /dev/sda and /dev/sdb. I have a=20
lvm group on top of /dev/md126p2 with some logical volumes. All this=20
work fine with Fedora 21.<br><br></div>I&#39;m trying to fresh install=20
Fedora 22 in some of lvm logical volume. I boot with Fedora USB live=20
media and run &quot;Install to hard disk&quot;. But anaconda does not see a=
ny=20
existing lvm volumes so I can not choose them as a destination.<br><br></di=
v>I&#39;ve created a bug <a href=3D"https://bugzilla.redhat.com/show_bug.cg=
i?id=3D1178181" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1178181</a> on this issue.<br><br></div>After some discovering I found=
 that the reason of this issue is that anaconda brakes lvm: <br><br>before
 launching anaconda pvdisplay reports there are two physical volumes=20
/dev/md126p2 and /dev/sdc2 (/dev/sdc is an SSD that does not belong any=20
raid and contains a separate lvm volume group)<br></div><br>after=20
launching anaconda pvdisplay reports another two physical volumes=20
/dev/sdb2 and /dev/sdc2, that is wrong, because /dev/sdb is a part of=20
/dev/md126 raid.<br><br></div>journalctl shows:<br><br>May 28 02:44:08 loca=
lhost systemd[1]: Stopping LVM2 PV scan on device 259:1...<br>May 28 02:44:=
08 localhost systemd[1]: Stopped LVM2 PV scan on device 259:1.<br>May 28 02=
:44:08 localhost audit[1]: &lt;audit-1131&gt; pid=3D1 uid=3D0 auid=3D429496=
7295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=3D&#39;unit=3D=
lvm2-pvscan@259:1 comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/s=
ystemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;<br>May 2=
8 02:44:09 localhost kernel:=C2=A0 sde:<br>May 28 02:44:09 localhost kernel=
:=C2=A0 sda: sda1 sda2<br>May 28 02:44:09 localhost systemd[1]: Starting LV=
M2 PV scan on device 8:2...<br>May 28 02:44:09 localhost kernel:=C2=A0 sdb:=
 sdb1 sdb2<br><br></div><div>Seems lvm stopped using &#39;/dev/md126p2&#39;=
. Futhure lvm rescans force it to use /dev/sdb2 instead.<br><br></div><div>=
The attached storage.log contains a trace of udev events of this. All other=
 logs are available <br></div><div>in <a href=3D"https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D1178181" target=3D"_blank">https://bugzilla.redhat.com/=
show_bug.cgi?id=3D1178181</a><br><br><div>What is wrong? How to force lvm t=
o use /dev/md126p2 instead of /dev/sdb2 after starting anaconda?</div></div=
></div>

--089e01228aacd23a1805172005e4--
