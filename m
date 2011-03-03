Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p235Ph3D031624
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 00:25:43 -0500
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p235PVOS010108
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 00:25:31 -0500
Received: by vws12 with SMTP id 12so852980vws.33
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2011 21:25:31 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Mar 2011 18:25:30 +1300
Message-ID: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
From: Scott Arthur <scott@scottatron.com>
Content-Type: multipart/alternative; boundary=bcaec53f943f0d1752049d8d4208
Subject: [linux-lvm] Resizing underlying LVM partition after cloning to
	bigger disk
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

--bcaec53f943f0d1752049d8d4208
Content-Type: text/plain; charset=ISO-8859-1

So I've just cloned a 1TB disk to a new 2TB disk using GNU ddresuce

My partition table looks like this:

Model: ATA WDC WD20EARS-00M (scsi)
Disk /dev/sda: 2000GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type      File system  Flags
 1      32.3kB  296MB   296MB   primary   ext4         boot
 2      296MB   1000GB  1000GB  extended
 5      296MB   1000GB  1000GB  logical                lvm

I'm obviously wanting to expand the LVM partition to fill the remaining 1TB
of space.

Am I able to simply use parted to resize the partition before doing a
pvresize etc?

Or is it risky to resize the underlying LVM partition?

--bcaec53f943f0d1752049d8d4208
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

So I&#39;ve just cloned a 1TB disk to a new 2TB disk using GNU ddresuce<div=
><br></div><div>My partition table looks like this:</div><div><div><br></di=
v><div><font class=3D"Apple-style-span" face=3D"&#39;courier new&#39;, mono=
space">Model: ATA WDC WD20EARS-00M (scsi)</font></div>
<div><font class=3D"Apple-style-span" face=3D"&#39;courier new&#39;, monosp=
ace">Disk /dev/sda: 2000GB</font></div><div><font class=3D"Apple-style-span=
" face=3D"&#39;courier new&#39;, monospace">Sector size (logical/physical):=
 512B/512B</font></div>
<div><font class=3D"Apple-style-span" face=3D"&#39;courier new&#39;, monosp=
ace">Partition Table: msdos</font></div><div><font class=3D"Apple-style-spa=
n" face=3D"&#39;courier new&#39;, monospace"><br></font></div><div><font cl=
ass=3D"Apple-style-span" face=3D"&#39;courier new&#39;, monospace">Number =
=A0Start =A0 End =A0 =A0 Size =A0 =A0Type =A0 =A0 =A0File system =A0Flags</=
font></div>
<div><font class=3D"Apple-style-span" face=3D"&#39;courier new&#39;, monosp=
ace">=A01 =A0 =A0 =A032.3kB =A0296MB =A0 296MB =A0 primary =A0 ext4 =A0 =A0=
 =A0 =A0 boot</font></div><div><font class=3D"Apple-style-span" face=3D"&#3=
9;courier new&#39;, monospace">=A02 =A0 =A0 =A0296MB =A0 1000GB =A01000GB =
=A0extended</font></div>
<div><font class=3D"Apple-style-span" face=3D"&#39;courier new&#39;, monosp=
ace">=A05 =A0 =A0 =A0296MB =A0 1000GB =A01000GB =A0logical =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0lvm</font></div><div><br></div><div>I&#39;m obviously wantin=
g to expand the LVM partition to fill the remaining 1TB of space.</div>
<div><br></div><div>Am I able to simply use parted to resize the partition =
before doing a pvresize etc?</div><div><br></div><div>Or is it risky to res=
ize the underlying LVM partition?</div><div><br></div><div><br></div>
</div>

--bcaec53f943f0d1752049d8d4208--
