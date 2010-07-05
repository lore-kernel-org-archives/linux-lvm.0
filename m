Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o651Uq3T008590
	for <linux-lvm@redhat.com>; Sun, 4 Jul 2010 21:30:52 -0400
Received: from mail-px0-f174.google.com (mail-px0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o651UeLr002297
	for <linux-lvm@redhat.com>; Sun, 4 Jul 2010 21:30:40 -0400
Received: by pxi14 with SMTP id 14so1740543pxi.33
	for <linux-lvm@redhat.com>; Sun, 04 Jul 2010 18:30:40 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 4 Jul 2010 18:30:40 -0700
Message-ID: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd3317e6a5ddc048a99e2c5
Subject: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

--000e0cd3317e6a5ddc048a99e2c5
Content-Type: text/plain; charset=ISO-8859-1

In short:

- originally created LV with several physical drives (5)
- formatted LV for ext4
- one physical drive got many sectors trashed. Those included the partition
and metadata.
- did the following to recover the LV (VolGroupX-LogVolX):
---pvcreate --uuid <original uuid>  /dev/sdX  (successfully created)
---vgcfgrestore VolGroupX (restsored volume group VolGroupX)
---vgscan  (found volume group "VolGroupX" using metadata type lvm2)
--- vgchange -ay VolGroupX ( note response:
" device-mapper: reload ioctl failed: Invalid argument.
 1 logical volume(s) in volume group "VolGroupX" now active")

At this pont, /dev/mapper/VolGroupX-LogVolX exists, but I can't run any
utilities on it, since it can't find any superblock. For example:
________________
[root@Elmer ken] # e2fsck  /dev/mapper/VolGroupX-LogVolX
e2fsck 1.41.9 (22-Aug-2009)
e2fsck: Invalid argument while trying to open /dev/mapper/VolGroupX-LogVolX

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>

[root@Elmer ken] #
_________________________
I really want to recover at least the data on the 4 other drives, and any
data left from this drive as well.

Any help will be greatly appreciated.

TIA

ken

--000e0cd3317e6a5ddc048a99e2c5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In short:<br><br>- originally created LV with several physical drives (5)<b=
r>- formatted LV for ext4<br>- one physical drive got many sectors trashed.=
 Those included the partition and metadata.<br>- did the following to recov=
er the LV (VolGroupX-LogVolX):<br>
---pvcreate --uuid &lt;original uuid&gt;=A0 /dev/sdX=A0 (successfully creat=
ed)<br>---vgcfgrestore VolGroupX (restsored volume group VolGroupX)<br>---v=
gscan=A0 (found volume group &quot;VolGroupX&quot; using metadata type lvm2=
)<br>
--- vgchange -ay VolGroupX ( note response:<br>&quot; device-mapper: reload=
 ioctl failed: Invalid argument.<br>=A01 logical volume(s) in volume group =
&quot;VolGroupX&quot; now active&quot;)<br><br>At this pont, /dev/mapper/Vo=
lGroupX-LogVolX exists, but I can&#39;t run any utilities on it, since it c=
an&#39;t find any superblock. For example:<br>
________________<br>[root@Elmer ken] # e2fsck=A0 /dev/mapper/VolGroupX-LogV=
olX<br>e2fsck 1.41.9 (22-Aug-2009)<br>e2fsck: Invalid argument while trying=
 to open /dev/mapper/VolGroupX-LogVolX<br><br>The superblock could not be r=
ead or does not describe a correct ext2<br>
filesystem.=A0 If the device is valid and it really contains an ext2<br>fil=
esystem (and not swap or ufs or something else), then the superblock<br>is =
corrupt, and you might try running e2fsck with an alternate superblock:<br>
=A0=A0=A0 e2fsck -b 8193 &lt;device&gt;<br><br>[root@Elmer ken] #<br>______=
___________________<br>I really want to recover at least the data on the 4 =
other drives, and any data left from this drive as well.<br><br>Any help wi=
ll be greatly appreciated.<br>
<br>TIA<br><br>ken<br><br><pre class=3D"code"><br></pre>

--000e0cd3317e6a5ddc048a99e2c5--
