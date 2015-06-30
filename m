Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5UEuOxI008870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2015 10:56:24 -0400
Received: from mail-vn0-f42.google.com (mail-vn0-f42.google.com
	[209.85.216.42])
	by mx1.redhat.com (Postfix) with ESMTPS id 01F92B66BB
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2015 14:56:22 +0000 (UTC)
Received: by vnav203 with SMTP id v203so1930379vna.8
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2015 07:56:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE8gLhnpcpOsoyiO5i6FSX7-5Lo+3fMciJgzrppScFDQAWNEQA@mail.gmail.com>
References: <CAE8gLhnpcpOsoyiO5i6FSX7-5Lo+3fMciJgzrppScFDQAWNEQA@mail.gmail.com>
Date: Tue, 30 Jun 2015 17:56:22 +0300
Message-ID: <CADxRZqz1ST+hKrYcB2L+pg4n14f0FD8NA8gZj9SUxMzjq1igng@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=089e01634730da588c0519bd68f7
Subject: Re: [linux-lvm] Difficulties with creating RAID1 LV
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

--089e01634730da588c0519bd68f7
Content-Type: text/plain; charset=UTF-8

Tried same setup on rhel7 :

[root@rhel7 ~]# rpm -q lvm2
lvm2-2.02.115-3.el7.x86_64

[root@rhel7 ~]# pvcreate  /dev/sdb1 /dev/sdc1
  Physical volume "/dev/sdb1" successfully created
  Physical volume "/dev/sdc1" successfully created

[root@rhel7 ~]# vgcreate  vmhost-vg  /dev/sdb1 /dev/sdc1
  Volume group "vmhost-vg" successfully created

[root@rhel7 ~]# lvcreate --verbose --type raid1 --mirrors 1 --extents 1 -n
testlv vmhost-vg
    Finding volume group "vmhost-vg"
    Archiving volume group "vmhost-vg" metadata (seqno 1).
    Creating logical volume testlv
    Creating logical volume testlv_rimage_0
    Creating logical volume testlv_rmeta_0
    Creating logical volume testlv_rimage_1
    Creating logical volume testlv_rmeta_1
    activation/volume_list configuration setting not defined: Checking only
host tags for vmhost-vg/testlv_rmeta_0
    Creating vmhost--vg-testlv_rmeta_0
    Loading vmhost--vg-testlv_rmeta_0 table (253:2)
    Resuming vmhost--vg-testlv_rmeta_0 (253:2)
    Clearing metadata area of vmhost-vg/testlv_rmeta_0
    Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_0" with
value 0.
    Removing vmhost--vg-testlv_rmeta_0 (253:2)
    activation/volume_list configuration setting not defined: Checking only
host tags for vmhost-vg/testlv_rmeta_1
    Creating vmhost--vg-testlv_rmeta_1
    Loading vmhost--vg-testlv_rmeta_1 table (253:2)
    Resuming vmhost--vg-testlv_rmeta_1 (253:2)
    Clearing metadata area of vmhost-vg/testlv_rmeta_1
    Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_1" with
value 0.
    Removing vmhost--vg-testlv_rmeta_1 (253:2)
    Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 3).
    Activating logical volume "testlv" exclusively.
    activation/volume_list configuration setting not defined: Checking only
host tags for vmhost-vg/testlv
    Creating vmhost--vg-testlv_rmeta_0
    Loading vmhost--vg-testlv_rmeta_0 table (253:2)
    Resuming vmhost--vg-testlv_rmeta_0 (253:2)
    Creating vmhost--vg-testlv_rimage_0
    Loading vmhost--vg-testlv_rimage_0 table (253:3)
    Resuming vmhost--vg-testlv_rimage_0 (253:3)
    Creating vmhost--vg-testlv_rmeta_1
    Loading vmhost--vg-testlv_rmeta_1 table (253:4)
    Resuming vmhost--vg-testlv_rmeta_1 (253:4)
    Creating vmhost--vg-testlv_rimage_1
    Loading vmhost--vg-testlv_rimage_1 table (253:5)
    Resuming vmhost--vg-testlv_rimage_1 (253:5)
    Creating vmhost--vg-testlv
    Loading vmhost--vg-testlv table (253:6)
    Resuming vmhost--vg-testlv (253:6)
    Monitoring vmhost-vg/testlv
    Wiping known signatures on logical volume "vmhost-vg/testlv"
    Initializing 4.00 KiB of logical volume "vmhost-vg/testlv" with value 0.
  Logical volume "testlv" created.

[root@rhel7 ~]# lvs -a vmhost-vg
  LV                VG        Attr       LSize Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  testlv            vmhost-vg rwi-a-r---
4.00m                                    100.00
  [testlv_rimage_0] vmhost-vg iwi-aor---
4.00m
  [testlv_rimage_1] vmhost-vg iwi-aor---
4.00m
  [testlv_rmeta_0]  vmhost-vg ewi-aor---
4.00m
  [testlv_rmeta_1]  vmhost-vg ewi-aor--- 4.00m


[root@rhel7 ~]# dmsetup status
vmhost--vg-testlv_rmeta_1: 0 8192 linear
vmhost--vg-testlv_rmeta_0: 0 8192 linear
vmhost--vg-testlv_rimage_1: 0 8192 linear
vmhost--vg-testlv_rimage_0: 0 8192 linear
vmhost--vg-testlv: 0 8192 raid raid1 2 AA 8192/8192 idle 0

[root@rhel7 ~]# dmsetup table vmhost--vg-testlv
0 8192 raid raid1 3 0 region_size 1024 2 253:2 253:3 253:4 253:5



On Sat, Jun 27, 2015 at 11:48 AM, MegaBrutal <megabrutal@gmail.com> wrote:

> Hi all,
>
> Nowadays it's difficult to create raid1 LVs, or converting linear LVs
> to raid1. If I try hard, once it succeeds, but it's not supposed to
> work like this. I'm on Ubuntu Vivid. I've never experienced this
> before, but I didn't create much raid1 LVs before I added plus PVs.
> But I don't remember ever having this problem, so whatever it is,
> probably it's introduced with Vivid.
>
>
> Case 1: Creating raid1 LV
>
> root@vmhost:~# lvcreate --verbose --type raid1 --mirrors 1 --extents 1
> --name testlv vmhost-vg
>     DEGRADED MODE. Incomplete RAID LVs will be processed.
>     Setting logging type to disk
>     Finding volume group "vmhost-vg"
>     Archiving volume group "vmhost-vg" metadata (seqno 112).
>     Creating logical volume testlv
>     Creating logical volume testlv_rimage_0
>     Creating logical volume testlv_rmeta_0
>     Creating logical volume testlv_rimage_1
>     Creating logical volume testlv_rmeta_1
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vmhost-vg/testlv_rmeta_0
>     Creating vmhost--vg-testlv_rmeta_0
>     Loading vmhost--vg-testlv_rmeta_0 table (252:122)
>     Resuming vmhost--vg-testlv_rmeta_0 (252:122)
>     Clearing metadata area of vmhost-vg/testlv_rmeta_0
>     Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_0"
> with value 0.
>     Removing vmhost--vg-testlv_rmeta_0 (252:122)
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vmhost-vg/testlv_rmeta_1
>     Creating vmhost--vg-testlv_rmeta_1
>     Loading vmhost--vg-testlv_rmeta_1 table (252:122)
>     Resuming vmhost--vg-testlv_rmeta_1 (252:122)
>     Clearing metadata area of vmhost-vg/testlv_rmeta_1
>     Initializing 512 B of logical volume "vmhost-vg/testlv_rmeta_1"
> with value 0.
>     Removing vmhost--vg-testlv_rmeta_1 (252:122)
>     Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 114).
>     Activating logical volume "testlv" exclusively.
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vmhost-vg/testlv
>     Creating vmhost--vg-testlv_rmeta_0
>     Loading vmhost--vg-testlv_rmeta_0 table (252:122)
>     Resuming vmhost--vg-testlv_rmeta_0 (252:122)
>     Creating vmhost--vg-testlv_rimage_0
>     Loading vmhost--vg-testlv_rimage_0 table (252:123)
>     Resuming vmhost--vg-testlv_rimage_0 (252:123)
>     Creating vmhost--vg-testlv_rmeta_1
>     Loading vmhost--vg-testlv_rmeta_1 table (252:124)
>     Resuming vmhost--vg-testlv_rmeta_1 (252:124)
>     Creating vmhost--vg-testlv_rimage_1
>     Loading vmhost--vg-testlv_rimage_1 table (252:125)
>     Resuming vmhost--vg-testlv_rimage_1 (252:125)
>     Creating vmhost--vg-testlv
>     Loading vmhost--vg-testlv table (252:126)
>   device-mapper: reload ioctl on  failed: Device or resource busy
>     Removing vmhost--vg-testlv (252:126)
>   Failed to activate new LV.
>     Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 115).
>
> Result: nothing is actually created according to "lvs -a".
>
>
> Case 2: Create linear LV and then convert it to raid1
>
> root@vmhost:~# lvcreate --verbose --extents 1 --name testlv vmhost-vg
>     DEGRADED MODE. Incomplete RAID LVs will be processed.
>     Setting logging type to disk
>     Finding volume group "vmhost-vg"
>     Archiving volume group "vmhost-vg" metadata (seqno 115).
>     Creating logical volume testlv
>     Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 116).
>     Activating logical volume "testlv".
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vmhost-vg/testlv
>     Creating vmhost--vg-testlv
>     Loading vmhost--vg-testlv table (252:126)
>     Resuming vmhost--vg-testlv (252:126)
>     Wiping known signatures on logical volume "vmhost-vg/testlv"
>     Initializing 4.00 KiB of logical volume "vmhost-vg/testlv" with value
> 0.
>     Creating volume group backup "/etc/lvm/backup/vmhost-vg" (seqno 116).
>   Logical volume "testlv" created
>
> root@vmhost:~# lvs -a | grep testlv
>   testlv                    vmhost-vg -wi-a-----   4.00m
>
> root@vmhost:~# lvconvert --verbose --type raid1 --mirrors 1
> vmhost-vg/testlv
>     DEGRADED MODE. Incomplete RAID LVs will be processed.
>     Archiving volume group "vmhost-vg" metadata (seqno 116).
>     Creating logical volume testlv_rmeta_0
>     Creating logical volume testlv_rmeta_1
>     Creating logical volume testlv_rimage_0
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vmhost-vg/testlv_rmeta_0
>     Creating vmhost--vg-testlv_rmeta_0
>   device-mapper: create ioctl on vmhost--vg-testlv_rmeta_0 failed:
> Device or resource busy
>   Failed to activate localy testlv_rmeta_0 for clearing
>
> root@vmhost:~# lvs -a | grep testlv
>   testlv                    vmhost-vg -wi-a-----   4.00m
>   testlv_rimage_1           vmhost-vg -wi-------   4.00m
>   testlv_rmeta_0            vmhost-vg -wi-------   4.00m
>   testlv_rmeta_1            vmhost-vg -wi-------   4.00m
>
> Result: mirror and meta LVs are created as distinct linear LVs and are
> not bound together to form a raid1 LV.
>
>

--089e01634730da588c0519bd68f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Tried same setup on rhel7 :<br><br></div>[root@r=
hel7 ~]# rpm -q lvm2<br>lvm2-2.02.115-3.el7.x86_64<br><br>[root@rhel7 ~]# p=
vcreate=C2=A0 /dev/sdb1 /dev/sdc1<br>=C2=A0 Physical volume &quot;/dev/sdb1=
&quot; successfully created<br>=C2=A0 Physical volume &quot;/dev/sdc1&quot;=
 successfully created<br><br>[root@rhel7 ~]# vgcreate=C2=A0 vmhost-vg=C2=A0=
 /dev/sdb1 /dev/sdc1<br>=C2=A0 Volume group &quot;vmhost-vg&quot; successfu=
lly created<br><br>[root@rhel7 ~]# lvcreate --verbose --type raid1 --mirror=
s 1 --extents 1 -n testlv vmhost-vg<br>=C2=A0=C2=A0=C2=A0 Finding volume gr=
oup &quot;vmhost-vg&quot;<br>=C2=A0=C2=A0=C2=A0 Archiving volume group &quo=
t;vmhost-vg&quot; metadata (seqno 1).<br>=C2=A0=C2=A0=C2=A0 Creating logica=
l volume testlv<br>=C2=A0=C2=A0=C2=A0 Creating logical volume testlv_rimage=
_0<br>=C2=A0=C2=A0=C2=A0 Creating logical volume testlv_rmeta_0<br>=C2=A0=
=C2=A0=C2=A0 Creating logical volume testlv_rimage_1<br>=C2=A0=C2=A0=C2=A0 =
Creating logical volume testlv_rmeta_1<br>=C2=A0=C2=A0=C2=A0 activation/vol=
ume_list configuration setting not defined: Checking only host tags for vmh=
ost-vg/testlv_rmeta_0<br>=C2=A0=C2=A0=C2=A0 Creating vmhost--vg-testlv_rmet=
a_0<br>=C2=A0=C2=A0=C2=A0 Loading vmhost--vg-testlv_rmeta_0 table (253:2)<b=
r>=C2=A0=C2=A0=C2=A0 Resuming vmhost--vg-testlv_rmeta_0 (253:2)<br>=C2=A0=
=C2=A0=C2=A0 Clearing metadata area of vmhost-vg/testlv_rmeta_0<br>=C2=A0=
=C2=A0=C2=A0 Initializing 512 B of logical volume &quot;vmhost-vg/testlv_rm=
eta_0&quot; with value 0.<br>=C2=A0=C2=A0=C2=A0 Removing vmhost--vg-testlv_=
rmeta_0 (253:2)<br>=C2=A0=C2=A0=C2=A0 activation/volume_list configuration =
setting not defined: Checking only host tags for vmhost-vg/testlv_rmeta_1<b=
r>=C2=A0=C2=A0=C2=A0 Creating vmhost--vg-testlv_rmeta_1<br>=C2=A0=C2=A0=C2=
=A0 Loading vmhost--vg-testlv_rmeta_1 table (253:2)<br>=C2=A0=C2=A0=C2=A0 R=
esuming vmhost--vg-testlv_rmeta_1 (253:2)<br>=C2=A0=C2=A0=C2=A0 Clearing me=
tadata area of vmhost-vg/testlv_rmeta_1<br>=C2=A0=C2=A0=C2=A0 Initializing =
512 B of logical volume &quot;vmhost-vg/testlv_rmeta_1&quot; with value 0.<=
br>=C2=A0=C2=A0=C2=A0 Removing vmhost--vg-testlv_rmeta_1 (253:2)<br>=C2=A0=
=C2=A0=C2=A0 Creating volume group backup &quot;/etc/lvm/backup/vmhost-vg&q=
uot; (seqno 3).<br>=C2=A0=C2=A0=C2=A0 Activating logical volume &quot;testl=
v&quot; exclusively.<br>=C2=A0=C2=A0=C2=A0 activation/volume_list configura=
tion setting not defined: Checking only host tags for vmhost-vg/testlv<br>=
=C2=A0=C2=A0=C2=A0 Creating vmhost--vg-testlv_rmeta_0<br>=C2=A0=C2=A0=C2=A0=
 Loading vmhost--vg-testlv_rmeta_0 table (253:2)<br>=C2=A0=C2=A0=C2=A0 Resu=
ming vmhost--vg-testlv_rmeta_0 (253:2)<br>=C2=A0=C2=A0=C2=A0 Creating vmhos=
t--vg-testlv_rimage_0<br>=C2=A0=C2=A0=C2=A0 Loading vmhost--vg-testlv_rimag=
e_0 table (253:3)<br>=C2=A0=C2=A0=C2=A0 Resuming vmhost--vg-testlv_rimage_0=
 (253:3)<br>=C2=A0=C2=A0=C2=A0 Creating vmhost--vg-testlv_rmeta_1<br>=C2=A0=
=C2=A0=C2=A0 Loading vmhost--vg-testlv_rmeta_1 table (253:4)<br>=C2=A0=C2=
=A0=C2=A0 Resuming vmhost--vg-testlv_rmeta_1 (253:4)<br>=C2=A0=C2=A0=C2=A0 =
Creating vmhost--vg-testlv_rimage_1<br>=C2=A0=C2=A0=C2=A0 Loading vmhost--v=
g-testlv_rimage_1 table (253:5)<br>=C2=A0=C2=A0=C2=A0 Resuming vmhost--vg-t=
estlv_rimage_1 (253:5)<br>=C2=A0=C2=A0=C2=A0 Creating vmhost--vg-testlv<br>=
=C2=A0=C2=A0=C2=A0 Loading vmhost--vg-testlv table (253:6)<br>=C2=A0=C2=A0=
=C2=A0 Resuming vmhost--vg-testlv (253:6)<br>=C2=A0=C2=A0=C2=A0 Monitoring =
vmhost-vg/testlv<br>=C2=A0=C2=A0=C2=A0 Wiping known signatures on logical v=
olume &quot;vmhost-vg/testlv&quot;<br>=C2=A0=C2=A0=C2=A0 Initializing 4.00 =
KiB of logical volume &quot;vmhost-vg/testlv&quot; with value 0.<br>=C2=A0 =
Logical volume &quot;testlv&quot; created.<br><br>[root@rhel7 ~]# lvs -a vm=
host-vg<br>=C2=A0 LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LSize Pool Origin Data%=C2=
=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<br>=C2=A0 testlv=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmhost-vg rwi-a-r--- 4.=
00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100.00=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [testlv_rima=
ge_0] vmhost-vg iwi-aor--- 4.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [testlv_rimage_1] vmhost=
-vg iwi-aor--- 4.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [testlv_rmeta_0]=C2=A0 vmhost-vg ewi=
-aor--- 4.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>=C2=A0 [testlv_rmeta_1]=C2=A0 vmhost-vg ewi-aor--=
- 4.00m <br><br><br>[root@rhel7 ~]# dmsetup status<br>vmhost--vg-testlv_rme=
ta_1: 0 8192 linear <br>vmhost--vg-testlv_rmeta_0: 0 8192 linear <br>vmhost=
--vg-testlv_rimage_1: 0 8192 linear <br>vmhost--vg-testlv_rimage_0: 0 8192 =
linear <br>vmhost--vg-testlv: 0 8192 raid raid1 2 AA 8192/8192 idle 0<br><b=
r>[root@rhel7 ~]# dmsetup table vmhost--vg-testlv<br>0 8192 raid raid1 3 0 =
region_size 1024 2 253:2 253:3 253:4 253:5<br><br></div><div><br></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jun 27, 2015 =
at 11:48 AM, MegaBrutal <span dir=3D"ltr">&lt;<a href=3D"mailto:megabrutal@=
gmail.com" target=3D"_blank">megabrutal@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi all,<br>
<br>
Nowadays it&#39;s difficult to create raid1 LVs, or converting linear LVs<b=
r>
to raid1. If I try hard, once it succeeds, but it&#39;s not supposed to<br>
work like this. I&#39;m on Ubuntu Vivid. I&#39;ve never experienced this<br=
>
before, but I didn&#39;t create much raid1 LVs before I added plus PVs.<br>
But I don&#39;t remember ever having this problem, so whatever it is,<br>
probably it&#39;s introduced with Vivid.<br>
<br>
<br>
Case 1: Creating raid1 LV<br>
<br>
root@vmhost:~# lvcreate --verbose --type raid1 --mirrors 1 --extents 1<br>
--name testlv vmhost-vg<br>
=C2=A0 =C2=A0 DEGRADED MODE. Incomplete RAID LVs will be processed.<br>
=C2=A0 =C2=A0 Setting logging type to disk<br>
=C2=A0 =C2=A0 Finding volume group &quot;vmhost-vg&quot;<br>
=C2=A0 =C2=A0 Archiving volume group &quot;vmhost-vg&quot; metadata (seqno =
112).<br>
=C2=A0 =C2=A0 Creating logical volume testlv<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rimage_0<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rmeta_0<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rimage_1<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rmeta_1<br>
=C2=A0 =C2=A0 activation/volume_list configuration setting not defined: Che=
cking<br>
only host tags for vmhost-vg/testlv_rmeta_0<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rmeta_0<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rmeta_0 table (252:122)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rmeta_0 (252:122)<br>
=C2=A0 =C2=A0 Clearing metadata area of vmhost-vg/testlv_rmeta_0<br>
=C2=A0 =C2=A0 Initializing 512 B of logical volume &quot;vmhost-vg/testlv_r=
meta_0&quot;<br>
with value 0.<br>
=C2=A0 =C2=A0 Removing vmhost--vg-testlv_rmeta_0 (252:122)<br>
=C2=A0 =C2=A0 activation/volume_list configuration setting not defined: Che=
cking<br>
only host tags for vmhost-vg/testlv_rmeta_1<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rmeta_1<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rmeta_1 table (252:122)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rmeta_1 (252:122)<br>
=C2=A0 =C2=A0 Clearing metadata area of vmhost-vg/testlv_rmeta_1<br>
=C2=A0 =C2=A0 Initializing 512 B of logical volume &quot;vmhost-vg/testlv_r=
meta_1&quot;<br>
with value 0.<br>
=C2=A0 =C2=A0 Removing vmhost--vg-testlv_rmeta_1 (252:122)<br>
=C2=A0 =C2=A0 Creating volume group backup &quot;/etc/lvm/backup/vmhost-vg&=
quot; (seqno 114).<br>
=C2=A0 =C2=A0 Activating logical volume &quot;testlv&quot; exclusively.<br>
=C2=A0 =C2=A0 activation/volume_list configuration setting not defined: Che=
cking<br>
only host tags for vmhost-vg/testlv<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rmeta_0<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rmeta_0 table (252:122)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rmeta_0 (252:122)<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rimage_0<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rimage_0 table (252:123)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rimage_0 (252:123)<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rmeta_1<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rmeta_1 table (252:124)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rmeta_1 (252:124)<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rimage_1<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv_rimage_1 table (252:125)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv_rimage_1 (252:125)<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv table (252:126)<br>
=C2=A0 device-mapper: reload ioctl on=C2=A0 failed: Device or resource busy=
<br>
=C2=A0 =C2=A0 Removing vmhost--vg-testlv (252:126)<br>
=C2=A0 Failed to activate new LV.<br>
=C2=A0 =C2=A0 Creating volume group backup &quot;/etc/lvm/backup/vmhost-vg&=
quot; (seqno 115).<br>
<br>
Result: nothing is actually created according to &quot;lvs -a&quot;.<br>
<br>
<br>
Case 2: Create linear LV and then convert it to raid1<br>
<br>
root@vmhost:~# lvcreate --verbose --extents 1 --name testlv vmhost-vg<br>
=C2=A0 =C2=A0 DEGRADED MODE. Incomplete RAID LVs will be processed.<br>
=C2=A0 =C2=A0 Setting logging type to disk<br>
=C2=A0 =C2=A0 Finding volume group &quot;vmhost-vg&quot;<br>
=C2=A0 =C2=A0 Archiving volume group &quot;vmhost-vg&quot; metadata (seqno =
115).<br>
=C2=A0 =C2=A0 Creating logical volume testlv<br>
=C2=A0 =C2=A0 Creating volume group backup &quot;/etc/lvm/backup/vmhost-vg&=
quot; (seqno 116).<br>
=C2=A0 =C2=A0 Activating logical volume &quot;testlv&quot;.<br>
=C2=A0 =C2=A0 activation/volume_list configuration setting not defined: Che=
cking<br>
only host tags for vmhost-vg/testlv<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv<br>
=C2=A0 =C2=A0 Loading vmhost--vg-testlv table (252:126)<br>
=C2=A0 =C2=A0 Resuming vmhost--vg-testlv (252:126)<br>
=C2=A0 =C2=A0 Wiping known signatures on logical volume &quot;vmhost-vg/tes=
tlv&quot;<br>
=C2=A0 =C2=A0 Initializing 4.00 KiB of logical volume &quot;vmhost-vg/testl=
v&quot; with value 0.<br>
=C2=A0 =C2=A0 Creating volume group backup &quot;/etc/lvm/backup/vmhost-vg&=
quot; (seqno 116).<br>
=C2=A0 Logical volume &quot;testlv&quot; created<br>
<br>
root@vmhost:~# lvs -a | grep testlv<br>
=C2=A0 testlv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 vmhost-vg -wi-a-----=C2=A0 =C2=A04.00m<br>
<br>
root@vmhost:~# lvconvert --verbose --type raid1 --mirrors 1 vmhost-vg/testl=
v<br>
=C2=A0 =C2=A0 DEGRADED MODE. Incomplete RAID LVs will be processed.<br>
=C2=A0 =C2=A0 Archiving volume group &quot;vmhost-vg&quot; metadata (seqno =
116).<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rmeta_0<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rmeta_1<br>
=C2=A0 =C2=A0 Creating logical volume testlv_rimage_0<br>
=C2=A0 =C2=A0 activation/volume_list configuration setting not defined: Che=
cking<br>
only host tags for vmhost-vg/testlv_rmeta_0<br>
=C2=A0 =C2=A0 Creating vmhost--vg-testlv_rmeta_0<br>
=C2=A0 device-mapper: create ioctl on vmhost--vg-testlv_rmeta_0 failed:<br>
Device or resource busy<br>
=C2=A0 Failed to activate localy testlv_rmeta_0 for clearing<br>
<br>
root@vmhost:~# lvs -a | grep testlv<br>
=C2=A0 testlv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 vmhost-vg -wi-a-----=C2=A0 =C2=A04.00m<br>
=C2=A0 testlv_rimage_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmhost-vg -w=
i-------=C2=A0 =C2=A04.00m<br>
=C2=A0 testlv_rmeta_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmhost-vg -w=
i-------=C2=A0 =C2=A04.00m<br>
=C2=A0 testlv_rmeta_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmhost-vg -w=
i-------=C2=A0 =C2=A04.00m<br>
<br>
Result: mirror and meta LVs are created as distinct linear LVs and are<br>
not bound together to form a raid1 LV.<br>
<br>
</blockquote></div><br></div></div>

--089e01634730da588c0519bd68f7--
