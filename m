Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r64CjmJV005660
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 08:45:48 -0400
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r64CjiJo028950
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 08:45:45 -0400
Received: by mail-la0-f54.google.com with SMTP id ec20so1216790lab.27
	for <linux-lvm@redhat.com>; Thu, 04 Jul 2013 05:45:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1372935324.66998.YahooMailNeo@web181505.mail.ne1.yahoo.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
	<CAFrGbuXJ54EgwA7pnzRMLtTnkjsgep=h2RvVZMN01fTXn+1hQw@mail.gmail.com>
	<CAFrGbuVRTSo1gTdgoOgmZLCk4NzVDf2jMYB=nT3_dNzJPz5HzA@mail.gmail.com>
	<1372935324.66998.YahooMailNeo@web181505.mail.ne1.yahoo.com>
Date: Thu, 4 Jul 2013 14:45:44 +0200
Message-ID: <CAFrGbuUB3+ZzFP=TEMx8p2GCULfFYwFcB=kMVRAqAgh=RDH_4g@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=089e01177467e0e37a04e0aef41e
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
 LVM complains "there is no suitable space"
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

--089e01177467e0e37a04e0aef41e
Content-Type: text/plain; charset=ISO-8859-1

2013/7/4 matthew patton <pattonme@yahoo.com>

>
>
> >
> >
> http://serverfault.com/questions/500533/lvm-mirror-with-data-and-logs-mirrored-on-same-2-devices
>
> wow, that smells like a logic bug to me. If not, then the documentation
> needs a VERY obvious warning about how to properly do mirrored devices with
> mirrored logs (nee 4+ distinct PV devices). If the internals can't be
> fixed, then it needs to error out on creation when there aren't 4 devices
> to work with. Any particular reason why you wanted pseudo-external logs in
> the first place?
>
> Does 'lvcreate -nv' show you the work plan?
>
>
Yet lvconvert looks the right tool for me if I could overcome this
limitation. I guess you meant 'lvconvert' instead of 'lvcreate' because
lvcreate works fine and I don't think it needs to be debugged. The only
drawback is that I need a much more complicated migration.

In case you needed the "lvconvert" here it is (pretty long) the output of

 lvconvert -vvv -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root /dev/sdb1


root@debian:/home/user# lvconvert -vvv -m1 --mirrorlog mirrored
/dev/lvgrptstnlvm/root /dev/sdb1
        Processing: lvconvert -vvv -m1 --mirrorlog mirrored
/dev/lvgrptstnlvm/root /dev/sdb1
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/wait_for_locks to 1
      File-based locking selected.
      Setting global/locking_dir to /run/lock/lvm
      Setting activation/mirror_region_size to 512
      Getting target version for mirror
        dm versions   OF   [16384] (*1)
      Getting target version for mirror
        dm versions   OF   [16384] (*1)
      Locking /run/lock/lvm/V_lvgrptstnlvm WB
        _do_flock /run/lock/lvm/V_lvgrptstnlvm:aux WB
        _do_flock /run/lock/lvm/V_lvgrptstnlvm WB
        _undo_flock /run/lock/lvm/V_lvgrptstnlvm:aux
        /dev/sr0: Added to device cache
        /dev/cdrom: Aliased to /dev/sr0 in device cache (preferred name)
        /dev/cdrw: Aliased to /dev/cdrom in device cache

/dev/disk/by-id/ata-VMware_Virtual_IDE_CDROM_Drive_10000000000000000001:
Aliased to /dev/cdrom in device cache
        /dev/disk/by-label/Debian\x20wheezy\x2020130505-08:21: Aliased to
/dev/cdrom in device cache
        /dev/disk/by-path/pci-0000:00:07.1-scsi-1:0:0:0: Aliased to
/dev/cdrom in device cache
        /dev/dvd: Aliased to /dev/cdrom in device cache
        /dev/dvdrw: Aliased to /dev/cdrom in device cache
        /dev/sda: Added to device cache
        /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:0:0: Aliased to
/dev/sda in device cache
        /dev/sda1: Added to device cache
        /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:0:0-part1: Aliased to
/dev/sda1 in device cache
        /dev/sdb: Added to device cache
        /dev/disk/by-id/scsi-26362623865306265: Aliased to /dev/sdb in
device cache
        /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0: Aliased to
/dev/sdb in device cache
        /dev/sdb1: Added to device cache
        /dev/disk/by-id/scsi-26362623865306265-part1: Aliased to /dev/sdb1
in device cache
        /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0-part1: Aliased to
/dev/sdb1 in device cache
        /dev/sdb2: Added to device cache
        /dev/disk/by-id/scsi-26362623865306265-part2: Aliased to /dev/sdb2
in device cache
        /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0-part2: Aliased to
/dev/sdb2 in device cache
        /dev/fd0: Added to device cache
        /dev/loop0: Added to device cache
        /dev/loop1: Added to device cache
        /dev/loop2: Added to device cache
        /dev/loop3: Added to device cache
        /dev/loop4: Added to device cache
        /dev/loop5: Added to device cache
        /dev/loop6: Added to device cache
        /dev/loop7: Added to device cache
        /dev/dm-0: Added to device cache
        /dev/disk/by-id/dm-name-lvgrptstnlvm-root: Aliased to /dev/dm-0 in
device cache (preferred name)

/dev/disk/by-id/dm-uuid-LVM-DxeZ119H0aLSu7DzkC21nfqolp4rPTBpNTJpPI2EvQWsK2Xd5eoSvk4x8slmPVYC:
Aliased to /dev/disk/by-id/dm-name-lvgrptstnlvm-root in device cache
        /dev/disk/by-uuid/2e715f19-ad02-44d8-9e06-e1ac5e302dfd: Aliased to
/dev/disk/by-id/dm-name-lvgrptstnlvm-root in device cache
        /dev/lvgrptstnlvm/root: Aliased to
/dev/disk/by-id/dm-name-lvgrptstnlvm-root in device cache (preferred name)
        /dev/mapper/lvgrptstnlvm-root: Aliased to /dev/lvgrptstnlvm/root in
device cache
        /dev/fd0: Skipping: Unrecognised LVM device type 2
        Opened /dev/loop0 RO O_DIRECT
      /dev/loop0: size is 1094288 sectors
        Closed /dev/loop0
      /dev/loop0: size is 1094288 sectors
        Opened /dev/loop0 RO O_DIRECT
        /dev/loop0: block size is 1024 bytes
        Closed /dev/loop0
        Using /dev/loop0
        Opened /dev/loop0 RO O_DIRECT
        /dev/loop0: block size is 1024 bytes
      /dev/loop0: No label detected
        Closed /dev/loop0
        Opened /dev/sda RO O_DIRECT
      /dev/sda: size is 18874368 sectors
        /dev/sda: block size is 4096 bytes
        /dev/sda: Skipping: Partition table signature found
        Closed /dev/sda
        /dev/cdrom: Skipping: Unrecognised LVM device type 11
        dm status   (254:0) OF   [16384] (*1)
        Opened /dev/lvgrptstnlvm/root RO O_DIRECT
      /dev/lvgrptstnlvm/root: size is 12582912 sectors
        Closed /dev/lvgrptstnlvm/root
      /dev/lvgrptstnlvm/root: size is 12582912 sectors
        Opened /dev/lvgrptstnlvm/root RO O_DIRECT
        /dev/lvgrptstnlvm/root: block size is 4096 bytes
        Closed /dev/lvgrptstnlvm/root
        Using /dev/lvgrptstnlvm/root
        Opened /dev/lvgrptstnlvm/root RO O_DIRECT
        /dev/lvgrptstnlvm/root: block size is 4096 bytes
      /dev/lvgrptstnlvm/root: No label detected
        Closed /dev/lvgrptstnlvm/root
        Opened /dev/loop1 RO O_DIRECT
      /dev/loop1: size is 0 sectors
        /dev/loop1: Skipping: Too small to hold a PV
        Closed /dev/loop1
        Opened /dev/sda1 RO O_DIRECT
      /dev/sda1: size is 18872320 sectors
        Closed /dev/sda1
      /dev/sda1: size is 18872320 sectors
        Opened /dev/sda1 RO O_DIRECT
        /dev/sda1: block size is 4096 bytes
        Closed /dev/sda1
        Using /dev/sda1
        Opened /dev/sda1 RO O_DIRECT
        /dev/sda1: block size is 4096 bytes
      /dev/sda1: lvm2 label detected at sector 1
        lvmcache: /dev/sda1: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sda1: Found metadata at 42496 size 1283 (in area at 4096 size
192512) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sda1: now in VG lvgrptstnlvm with 1 mdas
        lvmcache: /dev/sda1: setting lvgrptstnlvm VGID to
DxeZ119H0aLSu7DzkC21nfqolp4rPTBp
        lvmcache: /dev/sda1: VG lvgrptstnlvm: Set creation host to debian.
        Opened /dev/loop2 RO O_DIRECT
      /dev/loop2: size is 0 sectors
        /dev/loop2: Skipping: Too small to hold a PV
        Closed /dev/loop2
        Opened /dev/loop3 RO O_DIRECT
      /dev/loop3: size is 0 sectors
        /dev/loop3: Skipping: Too small to hold a PV
        Closed /dev/loop3
        Opened /dev/loop4 RO O_DIRECT
      /dev/loop4: size is 0 sectors
        /dev/loop4: Skipping: Too small to hold a PV
        Closed /dev/loop4
        Opened /dev/loop5 RO O_DIRECT
      /dev/loop5: size is 0 sectors
        /dev/loop5: Skipping: Too small to hold a PV
        Closed /dev/loop5
        Opened /dev/loop6 RO O_DIRECT
      /dev/loop6: size is 0 sectors
        /dev/loop6: Skipping: Too small to hold a PV
        Closed /dev/loop6
        Opened /dev/loop7 RO O_DIRECT
      /dev/loop7: size is 0 sectors
        /dev/loop7: Skipping: Too small to hold a PV
        Closed /dev/loop7
        Opened /dev/sdb RO O_DIRECT
      /dev/sdb: size is 18874368 sectors
        /dev/sdb: block size is 4096 bytes
        /dev/sdb: Skipping: Partition table signature found
        Closed /dev/sdb
        Opened /dev/sdb1 RO O_DIRECT
      /dev/sdb1: size is 18610176 sectors
        Closed /dev/sdb1
      /dev/sdb1: size is 18610176 sectors
        Opened /dev/sdb1 RO O_DIRECT
        /dev/sdb1: block size is 4096 bytes
        Closed /dev/sdb1
        Using /dev/sdb1
        Opened /dev/sdb1 RO O_DIRECT
        /dev/sdb1: block size is 4096 bytes
      /dev/sdb1: lvm2 label detected at sector 1
        lvmcache: /dev/sdb1: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sdb1: Found metadata at 6144 size 1283 (in area at 4096 size
520192) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sdb1: now in VG lvgrptstnlvm
(DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas
        Opened /dev/sdb2 RO O_DIRECT
      /dev/sdb2: size is 262144 sectors
        Closed /dev/sdb2
      /dev/sdb2: size is 262144 sectors
        Opened /dev/sdb2 RO O_DIRECT
        /dev/sdb2: block size is 4096 bytes
        Closed /dev/sdb2
        Using /dev/sdb2
        Opened /dev/sdb2 RO O_DIRECT
        /dev/sdb2: block size is 4096 bytes
      /dev/sdb2: lvm2 label detected at sector 1
        lvmcache: /dev/sdb2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sdb2: Found metadata at 4608 size 1283 (in area at 4096 size
1044480) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sdb2: now in VG lvgrptstnlvm
(DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Allocated VG lvgrptstnlvm at 0x2732230.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Read lvgrptstnlvm metadata (109) from /dev/sda1 at 42496 size 1283
        Allocated VG lvgrptstnlvm at 0x2736240.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Read lvgrptstnlvm metadata (109) from /dev/sdb1 at 6144 size 1283
        Freeing VG lvgrptstnlvm at 0x2736240.
        Allocated VG lvgrptstnlvm at 0x2736240.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Read lvgrptstnlvm metadata (109) from /dev/sdb2 at 4608 size 1283
        Freeing VG lvgrptstnlvm at 0x2736240.
        /dev/sda1 0:      0   1536: root(0:0)
        /dev/sda1 1:   1536    767: NULL(0:0)
        /dev/sdb1 0:      0   2271: NULL(0:0)
        /dev/sdb2 0:      0     31: NULL(0:0)
        Adding PE range: start PE 0 length 2271 on /dev/sdb1
    Archiving volume group "lvgrptstnlvm" metadata (seqno 109).
    Adjusting mirror image count of root
    Setting logging type to mirrored
        Allowing allocation on /dev/sdb1 start PE 0 length 2271
        Parallel PVs at LE 0 length 1536: /dev/sda1
        Trying allocation using contiguous policy.
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
        Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536
leaving 735.
        Trying allocation using cling policy.
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
        Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536
leaving 735.
        Trying allocation using normal policy.
        Cling_to_allocated is set
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
        Cling_to_allocated is not set
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
        Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536
leaving 735.
        Found 1 areas for 1 parallel areas and 2 log areas so far.
        Considering allocation area 1 as /dev/sdb1 start PE 0 length 735
leaving 0.
  Insufficient suitable allocatable extents for logical volume : 1536 more
required
  Unable to allocate extents for mirror(s).
        Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
        Syncing device names
      Unlocking /run/lock/lvm/V_lvgrptstnlvm
        _undo_flock /run/lock/lvm/V_lvgrptstnlvm
        Closed /dev/sda1
        Closed /dev/sdb1
        Closed /dev/sdb2
        Freeing VG lvgrptstnlvm at 0x2732230.

--089e01177467e0e37a04e0aef41e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/7/4 matthew patton <span dir=3D"ltr">&lt;<a href=3D"mailto:pattonme@ya=
hoo.com" target=3D"_blank">pattonme@yahoo.com</a>&gt;</span><br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt;<br>
&gt;<a href=3D"http://serverfault.com/questions/500533/lvm-mirror-with-data=
-and-logs-mirrored-on-same-2-devices" target=3D"_blank">http://serverfault.=
com/questions/500533/lvm-mirror-with-data-and-logs-mirrored-on-same-2-devic=
es</a><br>

<br>
wow, that smells like a logic bug to me. If not, then the documentation nee=
ds a VERY obvious warning about how to properly do mirrored devices with mi=
rrored logs (nee 4+ distinct PV devices). If the internals can&#39;t be fix=
ed, then it needs to error out on creation when there aren&#39;t 4 devices =
to work with. Any particular reason why you wanted pseudo-external logs in =
the first place?<br>

<br>
Does &#39;lvcreate -nv&#39; show you the work plan?<br><br></blockquote><di=
v><br></div><div>Yet lvconvert looks the right tool for me if I could overc=
ome this limitation. I guess you meant &#39;lvconvert&#39; instead of &#39;=
lvcreate&#39; because lvcreate works fine and I don&#39;t think it needs to=
 be debugged. The only drawback is that I need a much more complicated migr=
ation.</div>
<div><br></div><div>In case you needed the &quot;lvconvert&quot; here it is=
 (pretty long) the output of=A0</div><div><br></div><div>=A0lvconvert -vvv =
-m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root /dev/sdb1</div></div><div><=
br>
</div><div><br></div><div>root@debian:/home/user# lvconvert -vvv -m1 --mirr=
orlog mirrored /dev/lvgrptstnlvm/root /dev/sdb1</div><div>=A0 =A0 =A0 =A0 P=
rocessing: lvconvert -vvv -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root /=
dev/sdb1</div>
<div>=A0 =A0 =A0 =A0 O_DIRECT will be used</div><div>=A0 =A0 =A0 Setting gl=
obal/locking_type to 1</div><div>=A0 =A0 =A0 Setting global/wait_for_locks =
to 1</div><div>=A0 =A0 =A0 File-based locking selected.</div><div>=A0 =A0 =
=A0 Setting global/locking_dir to /run/lock/lvm</div>
<div>=A0 =A0 =A0 Setting activation/mirror_region_size to 512</div><div>=A0=
 =A0 =A0 Getting target version for mirror</div><div>=A0 =A0 =A0 =A0 dm ver=
sions =A0 OF =A0 [16384] (*1)</div><div>=A0 =A0 =A0 Getting target version =
for mirror</div><div>=A0 =A0 =A0 =A0 dm versions =A0 OF =A0 [16384] (*1)</d=
iv>
<div>=A0 =A0 =A0 Locking /run/lock/lvm/V_lvgrptstnlvm WB</div><div>=A0 =A0 =
=A0 =A0 _do_flock /run/lock/lvm/V_lvgrptstnlvm:aux WB</div><div>=A0 =A0 =A0=
 =A0 _do_flock /run/lock/lvm/V_lvgrptstnlvm WB</div><div>=A0 =A0 =A0 =A0 _u=
ndo_flock /run/lock/lvm/V_lvgrptstnlvm:aux</div>
<div>=A0 =A0 =A0 =A0 /dev/sr0: Added to device cache</div><div>=A0 =A0 =A0 =
=A0 /dev/cdrom: Aliased to /dev/sr0 in device cache (preferred name)</div><=
div>=A0 =A0 =A0 =A0 /dev/cdrw: Aliased to /dev/cdrom in device cache</div><=
div>=A0 =A0 =A0 =A0 /dev/disk/by-id/ata-VMware_Virtual_IDE_CDROM_Drive_1000=
0000000000000001: Aliased to /dev/cdrom in device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/disk/by-label/Debian\x20wheezy\x2020130505-08:21:=
 Aliased to /dev/cdrom in device cache</div><div>=A0 =A0 =A0 =A0 /dev/disk/=
by-path/pci-0000:00:07.1-scsi-1:0:0:0: Aliased to /dev/cdrom in device cach=
e</div><div>
=A0 =A0 =A0 =A0 /dev/dvd: Aliased to /dev/cdrom in device cache</div><div>=
=A0 =A0 =A0 =A0 /dev/dvdrw: Aliased to /dev/cdrom in device cache</div><div=
>=A0 =A0 =A0 =A0 /dev/sda: Added to device cache</div><div>=A0 =A0 =A0 =A0 =
/dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:0:0: Aliased to /dev/sda in dev=
ice cache</div>
<div>=A0 =A0 =A0 =A0 /dev/sda1: Added to device cache</div><div>=A0 =A0 =A0=
 =A0 /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:0:0-part1: Aliased to /dev=
/sda1 in device cache</div><div>=A0 =A0 =A0 =A0 /dev/sdb: Added to device c=
ache</div><div>=A0 =A0 =A0 =A0 /dev/disk/by-id/scsi-26362623865306265: Alia=
sed to /dev/sdb in device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0: Alias=
ed to /dev/sdb in device cache</div><div>=A0 =A0 =A0 =A0 /dev/sdb1: Added t=
o device cache</div><div>=A0 =A0 =A0 =A0 /dev/disk/by-id/scsi-2636262386530=
6265-part1: Aliased to /dev/sdb1 in device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0-part1:=
 Aliased to /dev/sdb1 in device cache</div><div>=A0 =A0 =A0 =A0 /dev/sdb2: =
Added to device cache</div><div>=A0 =A0 =A0 =A0 /dev/disk/by-id/scsi-263626=
23865306265-part2: Aliased to /dev/sdb2 in device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/disk/by-path/pci-0000:00:10.0-scsi-0:0:1:0-part2:=
 Aliased to /dev/sdb2 in device cache</div><div>=A0 =A0 =A0 =A0 /dev/fd0: A=
dded to device cache</div><div>=A0 =A0 =A0 =A0 /dev/loop0: Added to device =
cache</div><div>=A0 =A0 =A0 =A0 /dev/loop1: Added to device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/loop2: Added to device cache</div><div>=A0 =A0 =
=A0 =A0 /dev/loop3: Added to device cache</div><div>=A0 =A0 =A0 =A0 /dev/lo=
op4: Added to device cache</div><div>=A0 =A0 =A0 =A0 /dev/loop5: Added to d=
evice cache</div><div>=A0 =A0 =A0 =A0 /dev/loop6: Added to device cache</di=
v>
<div>=A0 =A0 =A0 =A0 /dev/loop7: Added to device cache</div><div>=A0 =A0 =
=A0 =A0 /dev/dm-0: Added to device cache</div><div>=A0 =A0 =A0 =A0 /dev/dis=
k/by-id/dm-name-lvgrptstnlvm-root: Aliased to /dev/dm-0 in device cache (pr=
eferred name)</div><div>
=A0 =A0 =A0 =A0 /dev/disk/by-id/dm-uuid-LVM-DxeZ119H0aLSu7DzkC21nfqolp4rPTB=
pNTJpPI2EvQWsK2Xd5eoSvk4x8slmPVYC: Aliased to /dev/disk/by-id/dm-name-lvgrp=
tstnlvm-root in device cache</div><div>=A0 =A0 =A0 =A0 /dev/disk/by-uuid/2e=
715f19-ad02-44d8-9e06-e1ac5e302dfd: Aliased to /dev/disk/by-id/dm-name-lvgr=
ptstnlvm-root in device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/lvgrptstnlvm/root: Aliased to /dev/disk/by-id/dm-=
name-lvgrptstnlvm-root in device cache (preferred name)</div><div>=A0 =A0 =
=A0 =A0 /dev/mapper/lvgrptstnlvm-root: Aliased to /dev/lvgrptstnlvm/root in=
 device cache</div>
<div>=A0 =A0 =A0 =A0 /dev/fd0: Skipping: Unrecognised LVM device type 2</di=
v><div>=A0 =A0 =A0 =A0 Opened /dev/loop0 RO O_DIRECT</div><div>=A0 =A0 =A0 =
/dev/loop0: size is 1094288 sectors</div><div>=A0 =A0 =A0 =A0 Closed /dev/l=
oop0</div><div>=A0 =A0 =A0 /dev/loop0: size is 1094288 sectors</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/loop0 RO O_DIRECT</div><div>=A0 =A0 =A0 =
=A0 /dev/loop0: block size is 1024 bytes</div><div>=A0 =A0 =A0 =A0 Closed /=
dev/loop0</div><div>=A0 =A0 =A0 =A0 Using /dev/loop0</div><div>=A0 =A0 =A0 =
=A0 Opened /dev/loop0 RO O_DIRECT</div>
<div>=A0 =A0 =A0 =A0 /dev/loop0: block size is 1024 bytes</div><div>=A0 =A0=
 =A0 /dev/loop0: No label detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/lo=
op0</div><div>=A0 =A0 =A0 =A0 Opened /dev/sda RO O_DIRECT</div><div>=A0 =A0=
 =A0 /dev/sda: size is 18874368 sectors</div>
<div>=A0 =A0 =A0 =A0 /dev/sda: block size is 4096 bytes</div><div>=A0 =A0 =
=A0 =A0 /dev/sda: Skipping: Partition table signature found</div><div>=A0 =
=A0 =A0 =A0 Closed /dev/sda</div><div>=A0 =A0 =A0 =A0 /dev/cdrom: Skipping:=
 Unrecognised LVM device type 11</div>
<div>=A0 =A0 =A0 =A0 dm status =A0 (254:0) OF =A0 [16384] (*1)</div><div>=
=A0 =A0 =A0 =A0 Opened /dev/lvgrptstnlvm/root RO O_DIRECT</div><div>=A0 =A0=
 =A0 /dev/lvgrptstnlvm/root: size is 12582912 sectors</div><div>=A0 =A0 =A0=
 =A0 Closed /dev/lvgrptstnlvm/root</div>
<div>=A0 =A0 =A0 /dev/lvgrptstnlvm/root: size is 12582912 sectors</div><div=
>=A0 =A0 =A0 =A0 Opened /dev/lvgrptstnlvm/root RO O_DIRECT</div><div>=A0 =
=A0 =A0 =A0 /dev/lvgrptstnlvm/root: block size is 4096 bytes</div><div>=A0 =
=A0 =A0 =A0 Closed /dev/lvgrptstnlvm/root</div>
<div>=A0 =A0 =A0 =A0 Using /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 =A0=
 Opened /dev/lvgrptstnlvm/root RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/l=
vgrptstnlvm/root: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/lvgrp=
tstnlvm/root: No label detected</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 =
=A0 Opened /dev/loop1 RO O_DIRECT</div><div>=A0 =A0 =A0 /dev/loop1: size is=
 0 sectors</div><div>=A0 =A0 =A0 =A0 /dev/loop1: Skipping: Too small to hol=
d a PV</div><div>=A0 =A0 =A0 =A0 Closed /dev/loop1</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/sda1 RO O_DIRECT</div><div>=A0 =A0 =A0 /de=
v/sda1: size is 18872320 sectors</div><div>=A0 =A0 =A0 =A0 Closed /dev/sda1=
</div><div>=A0 =A0 =A0 /dev/sda1: size is 18872320 sectors</div><div>=A0 =
=A0 =A0 =A0 Opened /dev/sda1 RO O_DIRECT</div>
<div>=A0 =A0 =A0 =A0 /dev/sda1: block size is 4096 bytes</div><div>=A0 =A0 =
=A0 =A0 Closed /dev/sda1</div><div>=A0 =A0 =A0 =A0 Using /dev/sda1</div><di=
v>=A0 =A0 =A0 =A0 Opened /dev/sda1 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /d=
ev/sda1: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/sda1: lvm2 label detected at sector 1</div><div>=A0 =
=A0 =A0 =A0 lvmcache: /dev/sda1: now in VG #orphans_lvm2 (#orphans_lvm2) wi=
th 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sda1: Found metadata at 42496 size=
 1283 (in area at 4096 size 192512) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC=
-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sda1: now in VG lvgrptstnlvm with 1 mda=
s</div><div>=A0 =A0 =A0 =A0 lvmcache: /dev/sda1: setting lvgrptstnlvm VGID =
to DxeZ119H0aLSu7DzkC21nfqolp4rPTBp</div><div>=A0 =A0 =A0 =A0 lvmcache: /de=
v/sda1: VG lvgrptstnlvm: Set creation host to debian.</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/loop2 RO O_DIRECT</div><div>=A0 =A0 =A0 /d=
ev/loop2: size is 0 sectors</div><div>=A0 =A0 =A0 =A0 /dev/loop2: Skipping:=
 Too small to hold a PV</div><div>=A0 =A0 =A0 =A0 Closed /dev/loop2</div><d=
iv>=A0 =A0 =A0 =A0 Opened /dev/loop3 RO O_DIRECT</div>
<div>=A0 =A0 =A0 /dev/loop3: size is 0 sectors</div><div>=A0 =A0 =A0 =A0 /d=
ev/loop3: Skipping: Too small to hold a PV</div><div>=A0 =A0 =A0 =A0 Closed=
 /dev/loop3</div><div>=A0 =A0 =A0 =A0 Opened /dev/loop4 RO O_DIRECT</div><d=
iv>=A0 =A0 =A0 /dev/loop4: size is 0 sectors</div>
<div>=A0 =A0 =A0 =A0 /dev/loop4: Skipping: Too small to hold a PV</div><div=
>=A0 =A0 =A0 =A0 Closed /dev/loop4</div><div>=A0 =A0 =A0 =A0 Opened /dev/lo=
op5 RO O_DIRECT</div><div>=A0 =A0 =A0 /dev/loop5: size is 0 sectors</div><d=
iv>=A0 =A0 =A0 =A0 /dev/loop5: Skipping: Too small to hold a PV</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/loop5</div><div>=A0 =A0 =A0 =A0 Opened /de=
v/loop6 RO O_DIRECT</div><div>=A0 =A0 =A0 /dev/loop6: size is 0 sectors</di=
v><div>=A0 =A0 =A0 =A0 /dev/loop6: Skipping: Too small to hold a PV</div><d=
iv>=A0 =A0 =A0 =A0 Closed /dev/loop6</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/loop7 RO O_DIRECT</div><div>=A0 =A0 =A0 /d=
ev/loop7: size is 0 sectors</div><div>=A0 =A0 =A0 =A0 /dev/loop7: Skipping:=
 Too small to hold a PV</div><div>=A0 =A0 =A0 =A0 Closed /dev/loop7</div><d=
iv>=A0 =A0 =A0 =A0 Opened /dev/sdb RO O_DIRECT</div>
<div>=A0 =A0 =A0 /dev/sdb: size is 18874368 sectors</div><div>=A0 =A0 =A0 =
=A0 /dev/sdb: block size is 4096 bytes</div><div>=A0 =A0 =A0 =A0 /dev/sdb: =
Skipping: Partition table signature found</div><div>=A0 =A0 =A0 =A0 Closed =
/dev/sdb</div><div>=A0 =A0 =A0 =A0 Opened /dev/sdb1 RO O_DIRECT</div>
<div>=A0 =A0 =A0 /dev/sdb1: size is 18610176 sectors</div><div>=A0 =A0 =A0 =
=A0 Closed /dev/sdb1</div><div>=A0 =A0 =A0 /dev/sdb1: size is 18610176 sect=
ors</div><div>=A0 =A0 =A0 =A0 Opened /dev/sdb1 RO O_DIRECT</div><div>=A0 =
=A0 =A0 =A0 /dev/sdb1: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/sdb1</div><div>=A0 =A0 =A0 =A0 Using /dev/=
sdb1</div><div>=A0 =A0 =A0 =A0 Opened /dev/sdb1 RO O_DIRECT</div><div>=A0 =
=A0 =A0 =A0 /dev/sdb1: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/=
sdb1: lvm2 label detected at sector 1</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb1: now in VG #orphans_lvm2 (#orphans=
_lvm2) with 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sdb1: Found metadata at 6=
144 size 1283 (in area at 4096 size 520192) for lvgrptstnlvm (DxeZ11-9H0a-L=
Su7-DzkC-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb1: now in VG lvgrptstnlvm (DxeZ119H0=
aLSu7DzkC21nfqolp4rPTBp) with 1 mdas</div><div>=A0 =A0 =A0 =A0 Opened /dev/=
sdb2 RO O_DIRECT</div><div>=A0 =A0 =A0 /dev/sdb2: size is 262144 sectors</d=
iv><div>=A0 =A0 =A0 =A0 Closed /dev/sdb2</div>
<div>=A0 =A0 =A0 /dev/sdb2: size is 262144 sectors</div><div>=A0 =A0 =A0 =
=A0 Opened /dev/sdb2 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/sdb2: block=
 size is 4096 bytes</div><div>=A0 =A0 =A0 =A0 Closed /dev/sdb2</div><div>=
=A0 =A0 =A0 =A0 Using /dev/sdb2</div><div>
=A0 =A0 =A0 =A0 Opened /dev/sdb2 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev=
/sdb2: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/sdb2: lvm2 label=
 detected at sector 1</div><div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb2: now in=
 VG #orphans_lvm2 (#orphans_lvm2) with 0 mdas</div>
<div>=A0 =A0 =A0 =A0 /dev/sdb2: Found metadata at 4608 size 1283 (in area a=
t 4096 size 1044480) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPT=
Bp)</div><div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb2: now in VG lvgrptstnlvm (=
DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas</div>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sda1</div><div>=A0 =A0 =A0=
 =A0 Using cached label for /dev/sdb1</div><div>=A0 =A0 =A0 =A0 Using cache=
d label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 Allocated VG lvgrptstnlvm a=
t 0x2732230.</div><div>=A0 =A0 =A0 =A0 Using cached label for /dev/sda1</di=
v>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdb1</div><div>=A0 =A0 =A0=
 =A0 Using cached label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 Read lvgrpt=
stnlvm metadata (109) from /dev/sda1 at 42496 size 1283</div><div>=A0 =A0 =
=A0 =A0 Allocated VG lvgrptstnlvm at 0x2736240.</div>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sda1</div><div>=A0 =A0 =A0=
 =A0 Using cached label for /dev/sdb1</div><div>=A0 =A0 =A0 =A0 Using cache=
d label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 Read lvgrptstnlvm metadata =
(109) from /dev/sdb1 at 6144 size 1283</div>
<div>=A0 =A0 =A0 =A0 Freeing VG lvgrptstnlvm at 0x2736240.</div><div>=A0 =
=A0 =A0 =A0 Allocated VG lvgrptstnlvm at 0x2736240.</div><div>=A0 =A0 =A0 =
=A0 Using cached label for /dev/sda1</div><div>=A0 =A0 =A0 =A0 Using cached=
 label for /dev/sdb1</div><div>
=A0 =A0 =A0 =A0 Using cached label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 =
Read lvgrptstnlvm metadata (109) from /dev/sdb2 at 4608 size 1283</div><div=
>=A0 =A0 =A0 =A0 Freeing VG lvgrptstnlvm at 0x2736240.</div><div>=A0 =A0 =
=A0 =A0 /dev/sda1 0: =A0 =A0 =A00 =A0 1536: root(0:0)</div>
<div>=A0 =A0 =A0 =A0 /dev/sda1 1: =A0 1536 =A0 =A0767: NULL(0:0)</div><div>=
=A0 =A0 =A0 =A0 /dev/sdb1 0: =A0 =A0 =A00 =A0 2271: NULL(0:0)</div><div>=A0=
 =A0 =A0 =A0 /dev/sdb2 0: =A0 =A0 =A00 =A0 =A0 31: NULL(0:0)</div><div>=A0 =
=A0 =A0 =A0 Adding PE range: start PE 0 length 2271 on /dev/sdb1</div>
<div>=A0 =A0 Archiving volume group &quot;lvgrptstnlvm&quot; metadata (seqn=
o 109).</div><div>=A0 =A0 Adjusting mirror image count of root</div><div>=
=A0 =A0 Setting logging type to mirrored</div><div>=A0 =A0 =A0 =A0 Allowing=
 allocation on /dev/sdb1 start PE 0 length 2271</div>
<div>=A0 =A0 =A0 =A0 Parallel PVs at LE 0 length 1536: /dev/sda1</div><div>=
=A0 =A0 =A0 =A0 Trying allocation using contiguous policy.</div><div>=A0 =
=A0 =A0 =A0 Still need 1538 total extents:</div><div>=A0 =A0 =A0 =A0 =A0 1 =
(1 data/0 parity) parallel areas of 1536 extents each</div>
<div>=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><div>=A0 =A0 =
=A0 =A0 Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536 l=
eaving 735.</div><div>=A0 =A0 =A0 =A0 Trying allocation using cling policy.=
</div><div>=A0 =A0 =A0 =A0 Still need 1538 total extents:</div>
<div>=A0 =A0 =A0 =A0 =A0 1 (1 data/0 parity) parallel areas of 1536 extents=
 each</div><div>=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><d=
iv>=A0 =A0 =A0 =A0 Considering allocation area 0 as /dev/sdb1 start PE 0 le=
ngth 1536 leaving 735.</div>
<div>=A0 =A0 =A0 =A0 Trying allocation using normal policy.</div><div>=A0 =
=A0 =A0 =A0 Cling_to_allocated is set</div><div>=A0 =A0 =A0 =A0 Still need =
1538 total extents:</div><div>=A0 =A0 =A0 =A0 =A0 1 (1 data/0 parity) paral=
lel areas of 1536 extents each</div>
<div>=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><div>=A0 =A0 =
=A0 =A0 Cling_to_allocated is not set</div><div>=A0 =A0 =A0 =A0 Still need =
1538 total extents:</div><div>=A0 =A0 =A0 =A0 =A0 1 (1 data/0 parity) paral=
lel areas of 1536 extents each</div>
<div>=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><div>=A0 =A0 =
=A0 =A0 Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536 l=
eaving 735.</div><div>=A0 =A0 =A0 =A0 Found 1 areas for 1 parallel areas an=
d 2 log areas so far.</div>
<div>=A0 =A0 =A0 =A0 Considering allocation area 1 as /dev/sdb1 start PE 0 =
length 735 leaving 0.</div><div>=A0 Insufficient suitable allocatable exten=
ts for logical volume : 1536 more required</div><div>=A0 Unable to allocate=
 extents for mirror(s).</div>
<div>=A0 =A0 =A0 =A0 Unlock: Memlock counters: locked:0 critical:0 daemon:0=
 suspended:0</div><div>=A0 =A0 =A0 =A0 Syncing device names</div><div>=A0 =
=A0 =A0 Unlocking /run/lock/lvm/V_lvgrptstnlvm</div><div>=A0 =A0 =A0 =A0 _u=
ndo_flock /run/lock/lvm/V_lvgrptstnlvm</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/sda1</div><div>=A0 =A0 =A0 =A0 Closed /dev=
/sdb1</div><div>=A0 =A0 =A0 =A0 Closed /dev/sdb2</div><div>=A0 =A0 =A0 =A0 =
Freeing VG lvgrptstnlvm at 0x2732230.</div><div><br></div><div><br></div>

--089e01177467e0e37a04e0aef41e--
