Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4JFwh2b019191
	for <linux-lvm@redhat.com>; Mon, 19 May 2014 11:58:43 -0400
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4JFwf5r008055
	for <linux-lvm@redhat.com>; Mon, 19 May 2014 11:58:41 -0400
Received: by mail-yk0-f170.google.com with SMTP id 10so4624775ykt.15
	for <linux-lvm@redhat.com>; Mon, 19 May 2014 08:58:41 -0700 (PDT)
MIME-Version: 1.0
From: David Wittman <dwittman@gmail.com>
Date: Mon, 19 May 2014 10:58:21 -0500
Message-ID: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e01160d0e4e21a804f9c2d621
Subject: [linux-lvm] Setting readahead for Logical Volumes via udev
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

--089e01160d0e4e21a804f9c2d621
Content-Type: text/plain; charset=UTF-8

Hey all,

I'm having an issue tuning the readahead value for my Logical Volumes via
udev. In short, I'm trying to create a rule that sets the readahead
attribute for each of my Logical Volumes at boot time or upon the creation
of a new volume. udev seems like the perfect place to do this, but for some
reason or another LVM seems to be overriding these settings.

Here's the udev rule I'm using, followed by an example:

```
# cat /etc/udev/rules.d/83-readahead.rules
# Set the readahead on non-spinning disks to 8kb (16 512b sectors)
ACTION=="add", KERNEL=="dm-*", ATTR{queue/rotational}=="0",
ATTR{bdi/read_ahead_kb}="8"

# lvcreate -L 100G data_fioa -n readahead_test
  Logical volume "readahead_test" created

# blockdev --report
RO    RA   SSZ   BSZ   StartSec            Size   Device
rw   256   512  4096          0    107374182400   /dev/dm-0
```

You'll notice above that the readahead is still 256 512-byte sectors. The
same happens upon a reboot of the system. Despite this, I do see
information in logs from udev that it is writing this value:

> udevd-work[4778]: ATTR
'/sys/devices/virtual/block/dm-1/bdi/read_ahead_kb' writing '8'
/etc/udev/rules.d/83-readahead.rules:3

(Note: this is an earlier log entry; I have since disabled debug logging,
so ignore any inconsistencies here)

With all that said, I am quite certain that the udev rules are correct,
because after running `udevadm trigger`, the readahead values are then set
properly:

```
# udevadm trigger
# blockdev --report
RO    RA   SSZ   BSZ   StartSec            Size   Device
rw    16   512  4096          0    107374182400   /dev/dm-0
```

I've tried tweaking a few of the udev specific values in lvm.conf, to no
avail. Any help or suggestions are appreciated. Here are my system details:

Distro: CentOS 6.4
LVM2 version: lvm2-2.02.98-9.el6_4.3.x86_64
udev version: udev-147-2.46.el6_4.2.x86_64

Thanks,

Dave

--089e01160d0e4e21a804f9c2d621
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<div><br></div><div>I&#39;m having an issue tuning=
 the readahead value for my Logical Volumes via udev. In short, I&#39;m try=
ing to create a rule that sets the readahead attribute for each of my Logic=
al Volumes at boot time or upon the creation of a new volume. udev seems li=
ke the perfect place to do this, but for some reason or another LVM seems t=
o be overriding these settings.</div>

<div><br></div><div>Here&#39;s the udev rule I&#39;m using, followed by an =
example:</div><div><br></div><div>```</div><div><div># cat /etc/udev/rules.=
d/83-readahead.rules</div><div># Set the readahead on non-spinning disks to=
 8kb (16 512b sectors)</div>

<div>ACTION=3D=3D&quot;add&quot;, KERNEL=3D=3D&quot;dm-*&quot;, ATTR{queue/=
rotational}=3D=3D&quot;0&quot;, ATTR{bdi/read_ahead_kb}=3D&quot;8&quot;</di=
v></div><div><br></div><div><div># lvcreate -L 100G data_fioa -n readahead_=
test</div>

<div>=C2=A0 Logical volume &quot;readahead_test&quot; created</div></div><d=
iv><div><br></div><div># blockdev --report</div><div>RO =C2=A0 =C2=A0RA =C2=
=A0 SSZ =C2=A0 BSZ =C2=A0 StartSec =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Size =C2=A0 Device</div><div>rw =C2=A0 256 =C2=A0 512 =C2=A04096 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0107374182400 =C2=A0 /dev/dm-0</di=
v>

</div><div>```</div><div><br></div><div>You&#39;ll notice above that the re=
adahead is still 256 512-byte sectors. The same happens upon a reboot of th=
e system. Despite this, I do see information in logs from udev that it is w=
riting this value:</div>

<div><br></div><div>&gt;=C2=A0udevd-work[4778]: ATTR &#39;/sys/devices/virt=
ual/block/dm-1/bdi/read_ahead_kb&#39; writing &#39;8&#39; /etc/udev/rules.d=
/83-readahead.rules:3</div><div><br></div><div>(Note: this is an earlier lo=
g entry; I have since disabled debug logging, so ignore any inconsistencies=
 here)</div>

<div><br></div><div>With all that said, I am quite certain that the udev ru=
les are correct, because after running `udevadm trigger`, the readahead val=
ues are then set properly:</div><div><br></div><div>```</div><div><div>

# udevadm trigger</div><div># blockdev --report</div><div>RO =C2=A0 =C2=A0R=
A =C2=A0 SSZ =C2=A0 BSZ =C2=A0 StartSec =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Size =C2=A0 Device</div><div>rw =C2=A0 =C2=A016 =C2=A0 512 =C2=A04096=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0107374182400 =C2=A0 /dev/=
dm-0</div></div><div>```</div><div><br></div>

<div>I&#39;ve tried tweaking a few of the udev specific values in lvm.conf,=
 to no avail. Any help or suggestions are appreciated. Here are my system d=
etails:</div><div><br></div><div>Distro: CentOS 6.4</div><div>LVM2 version:=
=C2=A0lvm2-2.02.98-9.el6_4.3.x86_64</div>

<div>udev version:=C2=A0udev-147-2.46.el6_4.2.x86_64</div><div><br></div><d=
iv>Thanks,</div><div><br></div><div>Dave</div></div>

--089e01160d0e4e21a804f9c2d621--
