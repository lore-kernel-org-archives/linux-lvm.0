Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4HJikRY006719
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 15:44:46 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4HJiXtJ008225
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 15:44:34 -0400
Received: by fxm10 with SMTP id 10so256711fxm.33
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 12:44:32 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 17 May 2010 21:44:32 +0200
Message-ID: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>
From: Dael Elcar <kanonmatswe@gmail.com>
Content-Type: multipart/alternative; boundary=0015175884b63294c00486cf741e
Subject: [linux-lvm] shrink VG and PV
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

--0015175884b63294c00486cf741e
Content-Type: text/plain; charset=ISO-8859-1

My system is archlinux i386. lvm version 2.02.62(1) (2010-03-09)
I'd like to shrink a partition with lvm on it. Can this be done? In order to
shrink it I need to reduce the size of the PV, right? I have successfully
removed an LV (from the end on the VG) and there is no mention of it with
lvdisplay or in the file i get with vgcfgbackup. I think the next step is to
reduce the size of the VG and remove the now unallocated 3884 PEs from it. I
can't find a command for that. I have tried pvresize. How do I solve the
problem with "metadata areas"? vgdisplay says VG Status is "resizable".

pvresize /dev/sda2 --test --setphysicalvolumesize 49256M
Test mode: Metadata will NOT be updated.
/dev/sda2: too many metadata areas for pvresize
0 physical volume(s) resized / 1 physical volume(s) not resized

vgdisplay
--- Volume group ---
VG Name nonxpvg
System ID
Format lvm2
Metadata Areas 2
Metadata Sequence No 6
VG Access read/write
VG Status resizable
MAX LV 0
Cur LV 3
Open LV 3
Max PV 0
Cur PV 1
Act PV 1
VG Size 63.27 GiB
PE Size 4.00 MiB
Total PE 16198
Alloc PE / Size 12314 / 48.10 GiB
Free PE / Size 3884 / 15.17 GiB
VG UUID 7nSsEo-Hend-4Xi8-2Udy-hFTR-2s8K-7Z7bbm

--0015175884b63294c00486cf741e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

My system is archlinux i386. lvm version 2.02.62(1) (2010-03-09)<br>I&#39;d=
 like to shrink a partition with lvm on it. Can this be done? In order to s=
hrink it I need to reduce the size of the PV, right? I have successfully re=
moved an LV (from the end on the VG) and there is no mention of it with lvd=
isplay or in the file i get with vgcfgbackup. I think the next step is to r=
educe the size of the VG and remove the now unallocated 3884 PEs from it. I=
 can&#39;t find a command for that. I have tried pvresize. How do I solve t=
he problem with &quot;metadata areas&quot;? vgdisplay says VG Status is &qu=
ot;resizable&quot;. <br>
<br>pvresize /dev/sda2 --test --setphysicalvolumesize 49256M<br> Test mode:=
 Metadata will NOT be updated.<br> /dev/sda2: too many metadata areas for p=
vresize<br> 0 physical volume(s) resized / 1 physical volume(s) not resized=
<br>
<br>vgdisplay<br>  --- Volume group ---<br>  VG Name               nonxpvg<=
br>  System ID             <br>  Format                lvm2<br>  Metadata A=
reas        2<br>  Metadata Sequence No  6<br>  VG Access             read/=
write<br>
  VG Status             resizable<br>  MAX LV                0<br>  Cur LV =
               3<br>  Open LV               3<br>  Max PV                0<=
br>  Cur PV                1<br>  Act PV                1<br>  VG Size     =
          63.27 GiB<br>
  PE Size               4.00 MiB<br>  Total PE              16198<br>  Allo=
c PE / Size       12314 / 48.10 GiB<br>  Free  PE / Size       3884 / 15.17=
 GiB<br>  VG UUID               7nSsEo-Hend-4Xi8-2Udy-hFTR-2s8K-7Z7bbm<br>
<div><br></div><div><br></div>

--0015175884b63294c00486cf741e--
