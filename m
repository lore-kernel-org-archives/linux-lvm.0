Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9RLAXi8016717
	for <linux-lvm@redhat.com>; Sat, 27 Oct 2012 17:10:33 -0400
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9RLAVu9009456
	for <linux-lvm@redhat.com>; Sat, 27 Oct 2012 17:10:32 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so1564772bkc.33
	for <linux-lvm@redhat.com>; Sat, 27 Oct 2012 14:10:30 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 27 Oct 2012 17:10:30 -0400
Message-ID: <CAMcVf+o=RAvK9=E_khXBzVLWrY3vD9FeWwKuQC=BRoACc7nHwA@mail.gmail.com>
From: Ramesh Nadupalli <nadupalliramesh@gmail.com>
Content-Type: multipart/alternative; boundary=00151740259ac658dc04cd10ddfd
Subject: [linux-lvm] Error: Doesn't contain a valid partition table
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

--00151740259ac658dc04cd10ddfd
Content-Type: text/plain; charset=ISO-8859-1

Dear All,

I am trying to build a new linux VM using RHEL6.2. I have created the
partitions using lvm. Everything works fine, but when I execute "fdisk -l"
I am getting the below errors. Is this expected? If so, how to fix the
errors?

Disk /dev/mapper/vg00-root doesn't contain a valid partition table
Disk /dev/mapper/vg00-opt doesn't contain a valid partition table
Disk /dev/mapper/vg00-tmp doesn't contain a valid partition table
Disk /dev/mapper/vg00-var doesn't contain a valid partition table
Disk /dev/mapper/vg00-usr doesn't contain a valid partition table
Disk /dev/mapper/vg00-home doesn't contain a valid partition table

Complete output of fdisk -l is given below:

Disk /dev/sda: 26.8 GB, 26843545600 bytes
64 heads, 32 sectors/track, 25600 cylinders
Units = cylinders of 2048 * 512 = 1048576 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x7bed667d

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        1026     1050608   83  Linux
/dev/sda2            1027        3076     2099200   82  Linux swap / Solaris
/dev/sda3            3077       25600    23064576   8e  Linux LVM

Disk /dev/sdb: 53.7 GB, 53687091200 bytes
64 heads, 32 sectors/track, 51200 cylinders
Units = cylinders of 2048 * 512 = 1048576 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xd5310289

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       51200    52428784   8e  Linux LVM

Disk /dev/mapper/vg00-root: 1073 MB, 1073741824 bytes
255 heads, 63 sectors/track, 130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-root doesn't contain a valid partition table

Disk /dev/mapper/vg00-opt: 1073 MB, 1073741824 bytes
255 heads, 63 sectors/track, 130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-opt doesn't contain a valid partition table

Disk /dev/mapper/vg00-tmp: 2147 MB, 2147483648 bytes
255 heads, 63 sectors/track, 261 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-tmp doesn't contain a valid partition table

Disk /dev/mapper/vg00-var: 3221 MB, 3221225472 bytes
255 heads, 63 sectors/track, 391 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-var doesn't contain a valid partition table

Disk /dev/mapper/vg00-usr: 4294 MB, 4294967296 bytes
255 heads, 63 sectors/track, 522 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-usr doesn't contain a valid partition table

Disk /dev/mapper/vg00-home: 1073 MB, 1073741824 bytes
255 heads, 63 sectors/track, 130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/vg00-home doesn't contain a valid partition table

--00151740259ac658dc04cd10ddfd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear All,=A0<div><br></div><div>I am trying to build a new linux VM using R=
HEL6.2. I have created the partitions using lvm.=A0Everything=A0works fine,=
 but when I execute &quot;fdisk -l&quot; I am getting the below errors. Is =
this expected? If so, how to fix the errors? =A0</div>
<div><br></div><div><div>Disk /dev/mapper/vg00-root doesn&#39;t contain a v=
alid partition table</div><div>Disk /dev/mapper/vg00-opt doesn&#39;t contai=
n a valid partition table</div><div>Disk /dev/mapper/vg00-tmp doesn&#39;t c=
ontain a valid partition table</div>
<div>Disk /dev/mapper/vg00-var doesn&#39;t contain a valid partition table<=
/div><div>Disk /dev/mapper/vg00-usr doesn&#39;t contain a valid partition t=
able</div><div>Disk /dev/mapper/vg00-home doesn&#39;t contain a valid parti=
tion table</div>
<div><br></div><div>Complete output of fdisk -l is given below:</div><div><=
br></div><div><div>Disk /dev/sda: 26.8 GB, 26843545600 bytes</div><div>64 h=
eads, 32 sectors/track, 25600 cylinders</div><div>Units =3D cylinders of 20=
48 * 512 =3D 1048576 bytes</div>
<div>Sector size (logical/physical): 512 bytes / 512 bytes</div><div>I/O si=
ze (minimum/optimal): 512 bytes / 512 bytes</div><div>Disk identifier: 0x7b=
ed667d</div><div><br></div><div>=A0 =A0Device Boot =A0 =A0 =A0Start =A0 =A0=
 =A0 =A0 End =A0 =A0 =A0Blocks =A0 Id =A0System</div>
<div>/dev/sda1 =A0 * =A0 =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 =A01026 =A0 =A0 1050=
608 =A0 83 =A0Linux</div><div>/dev/sda2 =A0 =A0 =A0 =A0 =A0 =A01027 =A0 =A0=
 =A0 =A03076 =A0 =A0 2099200 =A0 82 =A0Linux swap / Solaris</div><div>/dev/=
sda3 =A0 =A0 =A0 =A0 =A0 =A03077 =A0 =A0 =A0 25600 =A0 =A023064576 =A0 8e =
=A0Linux LVM</div>
<div><br></div><div>Disk /dev/sdb: 53.7 GB, 53687091200 bytes</div><div>64 =
heads, 32 sectors/track, 51200 cylinders</div><div>Units =3D cylinders of 2=
048 * 512 =3D 1048576 bytes</div><div>Sector size (logical/physical): 512 b=
ytes / 512 bytes</div>
<div>I/O size (minimum/optimal): 512 bytes / 512 bytes</div><div>Disk ident=
ifier: 0xd5310289</div><div><br></div><div>=A0 =A0Device Boot =A0 =A0 =A0St=
art =A0 =A0 =A0 =A0 End =A0 =A0 =A0Blocks =A0 Id =A0System</div><div>/dev/s=
db1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 =A0 =A0 =A0 51200 =A0 =A052428784 =A0 8e =
=A0Linux LVM</div>
<div><br></div><div>Disk /dev/mapper/vg00-root: 1073 MB, 1073741824 bytes</=
div><div>255 heads, 63 sectors/track, 130 cylinders</div><div>Units =3D cyl=
inders of 16065 * 512 =3D 8225280 bytes</div><div>Sector size (logical/phys=
ical): 512 bytes / 512 bytes</div>
<div>I/O size (minimum/optimal): 512 bytes / 512 bytes</div><div>Disk ident=
ifier: 0x00000000</div><div><br></div><div>Disk /dev/mapper/vg00-root doesn=
&#39;t contain a valid partition table</div><div><br></div><div>Disk /dev/m=
apper/vg00-opt: 1073 MB, 1073741824 bytes</div>
<div>255 heads, 63 sectors/track, 130 cylinders</div><div>Units =3D cylinde=
rs of 16065 * 512 =3D 8225280 bytes</div><div>Sector size (logical/physical=
): 512 bytes / 512 bytes</div><div>I/O size (minimum/optimal): 512 bytes / =
512 bytes</div>
<div>Disk identifier: 0x00000000</div><div><br></div><div>Disk /dev/mapper/=
vg00-opt doesn&#39;t contain a valid partition table</div><div><br></div><d=
iv>Disk /dev/mapper/vg00-tmp: 2147 MB, 2147483648 bytes</div><div>255 heads=
, 63 sectors/track, 261 cylinders</div>
<div>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes</div><div>Sector =
size (logical/physical): 512 bytes / 512 bytes</div><div>I/O size (minimum/=
optimal): 512 bytes / 512 bytes</div><div>Disk identifier: 0x00000000</div>
<div><br></div><div>Disk /dev/mapper/vg00-tmp doesn&#39;t contain a valid p=
artition table</div><div><br></div><div>Disk /dev/mapper/vg00-var: 3221 MB,=
 3221225472 bytes</div><div>255 heads, 63 sectors/track, 391 cylinders</div=
>
<div>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes</div><div>Sector =
size (logical/physical): 512 bytes / 512 bytes</div><div>I/O size (minimum/=
optimal): 512 bytes / 512 bytes</div><div>Disk identifier: 0x00000000</div>
<div><br></div><div>Disk /dev/mapper/vg00-var doesn&#39;t contain a valid p=
artition table</div><div><br></div><div>Disk /dev/mapper/vg00-usr: 4294 MB,=
 4294967296 bytes</div><div>255 heads, 63 sectors/track, 522 cylinders</div=
>
<div>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes</div><div>Sector =
size (logical/physical): 512 bytes / 512 bytes</div><div>I/O size (minimum/=
optimal): 512 bytes / 512 bytes</div><div>Disk identifier: 0x00000000</div>
<div><br></div><div>Disk /dev/mapper/vg00-usr doesn&#39;t contain a valid p=
artition table</div><div><br></div><div>Disk /dev/mapper/vg00-home: 1073 MB=
, 1073741824 bytes</div><div>255 heads, 63 sectors/track, 130 cylinders</di=
v>
<div>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes</div><div>Sector =
size (logical/physical): 512 bytes / 512 bytes</div><div>I/O size (minimum/=
optimal): 512 bytes / 512 bytes</div><div>Disk identifier: 0x00000000</div>
<div><br></div><div>Disk /dev/mapper/vg00-home doesn&#39;t contain a valid =
partition table</div></div><div><br></div>
</div>

--00151740259ac658dc04cd10ddfd--
