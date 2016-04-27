Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RCX7OT022443
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 08:33:07 -0400
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D3E947046
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 12:33:06 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id j9so21680649obd.3
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 05:33:05 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 27 Apr 2016 14:33:05 +0200
Message-ID: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
From: Bhasker C V <bhasker@unixindia.com>
Content-Type: multipart/alternative; boundary=f46d044795f783ddf20531769c6c
Subject: [linux-lvm] Lvm think provisioning query
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

--f46d044795f783ddf20531769c6c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

 I am starting with investigating about the lvm thin provisioning
 (repeat post from
https://lists.debian.org/debian-user/2016/04/msg00852.html )
 (apologies for html mail)

 I have done the following

1.Create a PV
vdb    252:16   0   10G  0 disk
=E2=94=9C=E2=94=80vdb1 252:17   0  100M  0 part
=E2=94=94=E2=94=80vdb2 252:18   0  9.9G  0 part
root@vmm-deb:~# pvcreate /dev/vdb1
  Physical volume "/dev/vdb1" successfully created.
root@vmm-deb:~# pvs
  PV         VG   Fmt  Attr PSize   PFree
  /dev/vdb1       lvm2 ---  100.00m 100.00m

2. create a VG
root@vmm-deb:~# vgcreate virtp /dev/vdb1
  Volume group "virtp" successfully created
root@vmm-deb:~# vgs
  VG    #PV #LV #SN Attr   VSize  VFree
  virtp   1   0   0 wz--n- 96.00m 96.00m

3. create a lv pool  and a over-provisioned volume inside it
root@vmm-deb:~# lvcreate -n virtpool -T virtp/virtpool -L40M
  Logical volume "virtpool" created.
root@vmm-deb:~# lvs
  LV       VG    Attr       LSize  Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  virtpool virtp twi-a-tz-- 40.00m             0.00   0.88

root@vmm-deb:~# lvcreate  -V1G -T virtp/virtpool -n vol01
  WARNING: Sum of all thin volume sizes (1.00 GiB) exceeds the size of thin
pool virtp/virtpool and the size of whole volume group (96.00 MiB)!
  For thin pool auto extension activation/thin_pool_autoextend_threshold
should be below 100.
  Logical volume "vol01" created.
root@vmm-deb:~# lvs
  LV       VG    Attr       LSize  Pool     Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  virtpool virtp twi-aotz-- 40.00m                 0.00   0.98

  vol01    virtp Vwi-a-tz--  1.00g virtpool        0.00


---------- Now the operations
# dd if=3D/dev/urandom of=3D./fil status=3Dprogress
90532864 bytes (91 MB, 86 MiB) copied, 6.00005 s, 15.1 MB/s^C
188706+0 records in
188705+0 records out
96616960 bytes (97 MB, 92 MiB) copied, 6.42704 s, 15.0 MB/s

# df -h .
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/virtp-vol01  976M   95M  815M  11% /tmp/x
# sync
# cd ..
root@vmm-deb:/tmp# umount x
root@vmm-deb:/tmp# fsck.ext4 -f -C0  /dev/virtp/vol01
e2fsck 1.43-WIP (15-Mar-2016)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure

Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 36544/262144 blocks


<mount>
# du -hs fil
93M    fil

# dd if=3D./fil of=3D/dev/null status=3Dprogress
188705+0 records in
188705+0 records out
96616960 bytes (97 MB, 92 MiB) copied, 0.149194 s, 648 MB/s


# vgs
  VG    #PV #LV #SN Attr   VSize  VFree
  virtp   1   2   0 wz--n- 96.00m 48.00m

Definetly the file is occupying 90+MB.

What i expect is that the pool is 40M and the file must NOT exceed 40M.
Where does the file get 93M space ?
I know the VG is 96M but the pool created was max 40M (also VG still says
48M free). Is the file exceeding the boundaries ?
or am I doing anything wrong ?

--f46d044795f783ddf20531769c6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>=C2=A0I am starting with investigating abo=
ut the lvm thin provisioning<br></div>=C2=A0(repeat post from <a href=3D"ht=
tps://lists.debian.org/debian-user/2016/04/msg00852.html">https://lists.deb=
ian.org/debian-user/2016/04/msg00852.html</a> ) <br><div>=C2=A0(apologies f=
or html mail)<br><br>=C2=A0I have done the following<br><br>1.Create a PV<b=
r>vdb =C2=A0 =C2=A0252:16 =C2=A0 0 =C2=A0 10G =C2=A00 disk<br>=E2=94=9C=E2=
=94=80vdb1 252:17 =C2=A0 0 =C2=A0100M =C2=A00 part<br>=E2=94=94=E2=94=80vdb=
2 252:18 =C2=A0 0 =C2=A09.9G =C2=A00 part<br>root@vmm-deb:~# pvcreate /dev/=
vdb1<br>=C2=A0 Physical volume &quot;/dev/vdb1&quot; successfully created.<=
br>root@vmm-deb:~# pvs<br>=C2=A0 PV =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 F=
mt =C2=A0Attr PSize =C2=A0 PFree <br>=C2=A0 /dev/vdb1 =C2=A0 =C2=A0 =C2=A0 =
lvm2 --- =C2=A0100.00m 100.00m<br><br>2. create a VG<br>root@vmm-deb:~# vgc=
reate virtp /dev/vdb1<br>=C2=A0 Volume group &quot;virtp&quot; successfully=
 created<br>root@vmm-deb:~# vgs<br>=C2=A0 VG =C2=A0 =C2=A0#PV #LV #SN Attr =
=C2=A0 VSize =C2=A0VFree<br>=C2=A0 virtp =C2=A0 1 =C2=A0 0 =C2=A0 0 wz--n- =
96.00m 96.00m<br><br>3. create a lv pool =C2=A0and a over-provisioned volum=
e inside it<br>root@vmm-deb:~# lvcreate -n virtpool -T virtp/virtpool -L40M=
<br>=C2=A0 Logical volume &quot;virtpool&quot; created.<br>root@vmm-deb:~# =
lvs<br>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =
=C2=A0 LSize =C2=A0Pool Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sync Co=
nvert<br>=C2=A0 virtpool virtp twi-a-tz-- 40.00m =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0.00 =C2=A0 0.88 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>root@vmm-deb:~# lv=
create =C2=A0-V1G -T virtp/virtpool -n vol01<br>=C2=A0 WARNING: Sum of all =
thin volume sizes (1.00 GiB) exceeds the size of thin pool virtp/virtpool a=
nd the size of whole volume group (96.00 MiB)!<br>=C2=A0 For thin pool auto=
 extension activation/thin_pool_autoextend_threshold should be below 100.<b=
r>=C2=A0 Logical volume &quot;vol01&quot; created.<br>root@vmm-deb:~# lvs<b=
r>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =C2=A0 =
LSize =C2=A0Pool =C2=A0 =C2=A0 Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%=
Sync Convert<br>=C2=A0 virtpool virtp twi-aotz-- 40.00m =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.00 =C2=A0 0.98 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>=C2=A0 vol01 =C2=A0 =C2=A0virtp Vwi-a-tz-- =C2=A01.00g virtpool =C2=A0 =
=C2=A0 =C2=A0 =C2=A00.00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><b=
r>---------- Now the operations<br># dd if=3D/dev/urandom of=3D./fil status=
=3Dprogress<br>90532864 bytes (91 MB, 86 MiB) copied, 6.00005 s, 15.1 MB/s^=
C<br>188706+0 records in<br>188705+0 records out<br>96616960 bytes (97 MB, =
92 MiB) copied, 6.42704 s, 15.0 MB/s<br><br># df -h .<br>Filesystem =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Size =C2=A0Used Avail Use% Mounte=
d on<br>/dev/mapper/virtp-vol01 =C2=A0976M =C2=A0 95M =C2=A0815M =C2=A011% =
/tmp/x<br># sync<br># cd ..<br>root@vmm-deb:/tmp# umount x<br>root@vmm-deb:=
/tmp# fsck.ext4 -f -C0 =C2=A0/dev/virtp/vol01 <br>e2fsck 1.43-WIP (15-Mar-2=
016)<br>Pass 1: Checking inodes, blocks, and sizes<br>Pass 2: Checking dire=
ctory structure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>Pass 3: Checking directory connectivity<br>Pass 4: Checkin=
g reference counts<br>Pass 5: Checking group summary information<br>/dev/vi=
rtp/vol01: 12/65536 files (8.3% non-contiguous), 36544/262144 blocks =C2=A0=
 <br><br>&lt;mount&gt;<br><span style=3D"color:rgb(255,0,0)"># du -hs fil<b=
r>93M =C2=A0 =C2=A0fil<br><br># dd if=3D./fil of=3D/dev/null status=3Dprogr=
ess<br>188705+0 records in<br>188705+0 records out<br>96616960 bytes (97 MB=
, 92 MiB) copied, 0.149194 s, 648 MB/s</span><br><br><br># vgs<br>=C2=A0 VG=
 =C2=A0 =C2=A0#PV #LV #SN Attr =C2=A0 VSize =C2=A0VFree<br>=C2=A0 virtp =C2=
=A0 1 =C2=A0 2 =C2=A0 0 wz--n- 96.00m 48.00m<br><br>Definetly the file is o=
ccupying 90+MB.<br><br>What i expect is that the pool is 40M and the file m=
ust NOT exceed 40M. Where does the file get 93M space ?<br>I know the VG is=
 96M but the pool created was max 40M (also VG still says 48M free). Is the=
 file exceeding the boundaries ?<br>or am I doing anything wrong ?</div></d=
iv>

--f46d044795f783ddf20531769c6c--
