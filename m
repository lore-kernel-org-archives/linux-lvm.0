Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r64ERto0031069
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 10:27:55 -0400
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r64ERqVM005903
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 10:27:52 -0400
Received: by mail-lb0-f180.google.com with SMTP id o10so1249640lbi.25
	for <linux-lvm@redhat.com>; Thu, 04 Jul 2013 07:27:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFrGbuVF_F3y0CMazywv8Y2pavYXjUXJk7_3DE_X6-6hZsNf1w@mail.gmail.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<20130704111817.GA3344@agk-dp.fab.redhat.com>
	<CAFrGbuVF_F3y0CMazywv8Y2pavYXjUXJk7_3DE_X6-6hZsNf1w@mail.gmail.com>
Date: Thu, 4 Jul 2013 16:27:51 +0200
Message-ID: <CAFrGbuWmVKH+N970R6qrCEV1BaSSWyLix-4+66sP_Q84+bAFqQ@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b3439a41c1dce04e0b062ae
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
To: Alessandro MACUZ <alessandro.macuz@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

--047d7b3439a41c1dce04e0b062ae
Content-Type: text/plain; charset=ISO-8859-1

2013/7/4 Alessandro MACUZ <alessandro.macuz@gmail.com>

> 2013/7/4 Alasdair G Kergon <agk@redhat.com>
>
>> On Tue, Jul 02, 2013 at 02:14:01AM +0200, Alessandro MACUZ wrote:
>> > Why "*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root
>> > /dev/sdb1*" doesn't work whereas
>> > "*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*" does? The space to be
>> > allocated differs by just one PE.
>>
>> Exactly which version of lvm2 are you using?
>> Is it 2.02.97 or later?  If not, you should try a newer version.
>> To debug, you then need to run the command with -vvvv added to the command
>> line.  Post a link to this output if you want others to look.
>
>

I downloaded
https://git.fedorahosted.org/cgit/lvm2.git/snapshot/lvm2-2_02_98.tar.gz and
compiled/installed via

./configure
make
make install

on top of a Knoppix Live DVD

No errors in compiling and installing it.

Unfortunately I get the same error. This is the output of LVM2 2.02.98
command:

root@Microknoppix:/tmp/lvm2-2_02_98# lvs -a -o+devices
  LV   VG           Attr      LSize Pool Origin Data%  Move Log Copy%
 Convert Devices
  root lvgrptstnlvm -wi-a---- 6.00g
   /dev/sda1(0)
root@Microknoppix:/tmp/lvm2-2_02_98# lvconvert -vvv -m1 --mirrorlog
mirrored --alloc normal /dev/lvgrptstnlvm/root /dev/sdb1
      Setting activation/monitoring to 0
        Processing: lvconvert -vvv -m1 --mirrorlog mirrored --alloc normal
/dev/lvgrptstnlvm/root /dev/sdb1
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/wait_for_locks to 1
      File-based locking selected.
      Setting global/locking_dir to /run/lock/lvm
      Setting global/prioritise_write_locks to 1
      Setting activation/mirror_region_size to 512
      Getting target version for mirror
        dm version   OF   [16384] (*1)
        dm versions   OF   [16384] (*1)
      Found mirror target v1.12.1.
      Getting target version for mirror
        dm versions   OF   [16384] (*1)
      Found mirror target v1.12.1.
      Locking /run/lock/lvm/V_lvgrptstnlvm WB
        _do_flock /run/lock/lvm/V_lvgrptstnlvm:aux WB
        _do_flock /run/lock/lvm/V_lvgrptstnlvm WB
        _undo_flock /run/lock/lvm/V_lvgrptstnlvm:aux
        Opened /dev/ram0 RO O_DIRECT
        /dev/ram0: block size is 4096 bytes
      /dev/ram0: No label detected
        Closed /dev/ram0
        dm status   (252:0) OF   [16384] (*1)
        /dev/lvgrptstnlvm/root_mlog_mimage_0: Reserved internal LV device
lvgrptstnlvm/root_mlog_mimage_0 not usable.
        /dev/lvgrptstnlvm/root_mlog_mimage_0: Skipping unusable device
        Opened /dev/ram RO O_DIRECT
        /dev/ram: block size is 4096 bytes
      /dev/ram: No label detected
        Closed /dev/ram
        Opened /dev/sda1 RO O_DIRECT
        /dev/sda1: block size is 4096 bytes
      /dev/sda1: lvm2 label detected at sector 1
        lvmcache: /dev/sda1: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sda1: Found metadata at 67584 size 1470 (in area at 4096 size
192512) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sda1: now in VG lvgrptstnlvm with 1 mdas
        lvmcache: /dev/sda1: setting lvgrptstnlvm VGID to
DxeZ119H0aLSu7DzkC21nfqolp4rPTBp
        lvmcache: /dev/sda1: VG lvgrptstnlvm: Set creation host to
Microknoppix.
        dm status   (252:1) OF   [16384] (*1)
        /dev/lvgrptstnlvm/root_mlog_mimage_1: Reserved internal LV device
lvgrptstnlvm/root_mlog_mimage_1 not usable.
        /dev/lvgrptstnlvm/root_mlog_mimage_1: Skipping unusable device
        Opened /dev/ram2 RO O_DIRECT
        /dev/ram2: block size is 4096 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
        dm status   (252:2) OF   [16384] (*1)
        /dev/dm-2: Skipping unusable device
        Opened /dev/ram3 RO O_DIRECT
        /dev/ram3: block size is 4096 bytes
      /dev/ram3: No label detected
        Closed /dev/ram3
        dm status   (252:3) OF   [16384] (*1)
        /dev/dm-3: Skipping unusable device
        Opened /dev/ram4 RO O_DIRECT
        /dev/ram4: block size is 4096 bytes
      /dev/ram4: No label detected
        Closed /dev/ram4
        dm status   (252:4) OF   [16384] (*1)
        /dev/dm-4: Skipping unusable device
        Opened /dev/ram5 RO O_DIRECT
        /dev/ram5: block size is 4096 bytes
      /dev/ram5: No label detected
        Closed /dev/ram5
        dm status   (252:5) OF   [16384] (*1)
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
        Opened /dev/ram6 RO O_DIRECT
        /dev/ram6: block size is 4096 bytes
      /dev/ram6: No label detected
        Closed /dev/ram6
        Opened /dev/ram7 RO O_DIRECT
        /dev/ram7: block size is 4096 bytes
      /dev/ram7: No label detected
        Closed /dev/ram7
        Opened /dev/ram8 RO O_DIRECT
        /dev/ram8: block size is 4096 bytes
      /dev/ram8: No label detected
        Closed /dev/ram8
        Opened /dev/ram9 RO O_DIRECT
        /dev/ram9: block size is 4096 bytes
      /dev/ram9: No label detected
        Closed /dev/ram9
        Opened /dev/ram10 RO O_DIRECT
        /dev/ram10: block size is 4096 bytes
      /dev/ram10: No label detected
        Closed /dev/ram10
        Opened /dev/ram11 RO O_DIRECT
        /dev/ram11: block size is 4096 bytes
      /dev/ram11: No label detected
        Closed /dev/ram11
        Opened /dev/ram12 RO O_DIRECT
        /dev/ram12: block size is 4096 bytes
      /dev/ram12: No label detected
        Closed /dev/ram12
        Opened /dev/ram13 RO O_DIRECT
        /dev/ram13: block size is 4096 bytes
      /dev/ram13: No label detected
        Closed /dev/ram13
        Opened /dev/ram14 RO O_DIRECT
        /dev/ram14: block size is 4096 bytes
      /dev/ram14: No label detected
        Closed /dev/ram14
        Opened /dev/ram15 RO O_DIRECT
        /dev/ram15: block size is 4096 bytes
      /dev/ram15: No label detected
        Closed /dev/ram15
        Opened /dev/sdb1 RO O_DIRECT
        /dev/sdb1: block size is 4096 bytes
      /dev/sdb1: lvm2 label detected at sector 1
        lvmcache: /dev/sdb1: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sdb1: Found metadata at 31232 size 1470 (in area at 4096 size
520192) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sdb1: now in VG lvgrptstnlvm
(DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas
        Opened /dev/sdb2 RO O_DIRECT
        /dev/sdb2: block size is 4096 bytes
      /dev/sdb2: lvm2 label detected at sector 1
        lvmcache: /dev/sdb2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sdb2: Found metadata at 29696 size 1470 (in area at 4096 size
1044480) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sdb2: now in VG lvgrptstnlvm
(DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas
        Opened /dev/sdc RO O_DIRECT
        /dev/sdc: block size is 4096 bytes
      /dev/sdc: lvm2 label detected at sector 1
        lvmcache: /dev/sdc: now in VG #orphans_lvm2 (#orphans_lvm2) with 0
mdas
        /dev/sdc: Found metadata at 28160 size 1470 (in area at 4096 size
1044480) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC-21nf-qolp-4rPTBp)
        lvmcache: /dev/sdc: now in VG lvgrptstnlvm
(DxeZ119H0aLSu7DzkC21nfqolp4rPTBp) with 1 mdas
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Using cached label for /dev/sdc
        Allocated VG lvgrptstnlvm at 0x8194c58.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Using cached label for /dev/sdc
        Read lvgrptstnlvm metadata (119) from /dev/sda1 at 67584 size 1470
        Allocated VG lvgrptstnlvm at 0x8198c60.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Using cached label for /dev/sdc
        Read lvgrptstnlvm metadata (119) from /dev/sdb1 at 31232 size 1470
        Freeing VG lvgrptstnlvm at 0x8198c60.
        Allocated VG lvgrptstnlvm at 0x8198c60.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Using cached label for /dev/sdc
        Read lvgrptstnlvm metadata (119) from /dev/sdb2 at 29696 size 1470
        Freeing VG lvgrptstnlvm at 0x8198c60.
        Allocated VG lvgrptstnlvm at 0x8198c60.
        Using cached label for /dev/sda1
        Using cached label for /dev/sdb1
        Using cached label for /dev/sdb2
        Using cached label for /dev/sdc
        Read lvgrptstnlvm metadata (119) from /dev/sdc at 28160 size 1470
        Freeing VG lvgrptstnlvm at 0x8198c60.
        /dev/sda1 0:      0   1536: root(0:0)
        /dev/sda1 1:   1536    767: NULL(0:0)
        /dev/sdb1 0:      0   2271: NULL(0:0)
        /dev/sdb2 0:      0     31: NULL(0:0)
        /dev/sdc 0:      0      7: NULL(0:0)
        Adding PE range: start PE 0 length 2271 on /dev/sdb1
    Archiving volume group "lvgrptstnlvm" metadata (seqno 119).
    Adjusting mirror image count of root
    Setting logging type to mirrored
      allocation/mirror_logs_require_separate_pvs not found in config:
defaulting to 0
      allocation/maximise_cling not found in config: defaulting to 1
        Allowing allocation on /dev/sdb1 start PE 0 length 2271
        Parallel PVs at LE 0 length 1536: /dev/sda1
        Trying allocation using contiguous policy.
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
        Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536
leaving 735.
        Trying allocation using cling policy.
        Cling_to_allocated is set
        Still need 1538 total extents:
          1 (1 data/0 parity) parallel areas of 1536 extents each
          2 mirror logs of 1 extents each
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
        Closed /dev/sdc
        Freeing VG lvgrptstnlvm at 0x8194c58.
root@Microknoppix:/tmp/lvm2-2_02_98#


Alex

--047d7b3439a41c1dce04e0b062ae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/7/4 Alessandro MACUZ <span dir=3D"ltr">&lt;<a href=3D"mailto:alessandr=
o.macuz@gmail.com" target=3D"_blank">alessandro.macuz@gmail.com</a>&gt;</sp=
an><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">2013/7/4 Alasdair G Kergon <span di=
r=3D"ltr">&lt;<a href=3D"mailto:agk@redhat.com" target=3D"_blank">agk@redha=
t.com</a>&gt;</span><br></div></div><div class=3D"gmail_quote"><div><div cl=
ass=3D"h5">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, Jul 02, 2013 at 02:14:01AM +0200, Alessandro MACUZ wrote:<br>
&gt; Why &quot;*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/r=
oot<br>
&gt; /dev/sdb1*&quot; doesn&#39;t work whereas<br>
&gt; &quot;*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*&quot; does? The=
 space to be<br>
<div>&gt; allocated differs by just one PE.<br>
<br>
</div>Exactly which version of lvm2 are you using?<br>
Is it 2.02.97 or later? =A0If not, you should try a newer version.<br>
To debug, you then need to run the command with -vvvv added to the command<=
br>
line. =A0Post a link to this output if you want others to look.</blockquote=
></div></div></div></blockquote><div><br></div><div><br></div><div>I downlo=
aded <a href=3D"https://git.fedorahosted.org/cgit/lvm2.git/snapshot/lvm2-2_=
02_98.tar.gz">https://git.fedorahosted.org/cgit/lvm2.git/snapshot/lvm2-2_02=
_98.tar.gz</a> and compiled/installed via=A0</div>
<div><br></div><div>./configure</div><div>make</div><div>make install</div>=
<div><br></div><div>on top of a Knoppix Live DVD</div><div><br></div><div>N=
o errors in compiling and installing it.</div><div><br></div><div>Unfortuna=
tely I get the same error. This is the output of LVM2 2.02.98 command:</div=
>
<div><br></div><div><div>root@Microknoppix:/tmp/lvm2-2_02_98# lvs -a -o+dev=
ices</div><div>=A0 LV =A0 VG =A0 =A0 =A0 =A0 =A0 Attr =A0 =A0 =A0LSize Pool=
 Origin Data% =A0Move Log Copy% =A0Convert Devices</div><div>=A0 root lvgrp=
tstnlvm -wi-a---- 6.00g =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/sda1(0)</div>
<div>root@Microknoppix:/tmp/lvm2-2_02_98# lvconvert -vvv -m1 --mirrorlog mi=
rrored --alloc normal /dev/lvgrptstnlvm/root /dev/sdb1</div><div>=A0 =A0 =
=A0 Setting activation/monitoring to 0</div><div>=A0 =A0 =A0 =A0 Processing=
: lvconvert -vvv -m1 --mirrorlog mirrored --alloc normal /dev/lvgrptstnlvm/=
root /dev/sdb1</div>
<div>=A0 =A0 =A0 =A0 O_DIRECT will be used</div><div>=A0 =A0 =A0 Setting gl=
obal/locking_type to 1</div><div>=A0 =A0 =A0 Setting global/wait_for_locks =
to 1</div><div>=A0 =A0 =A0 File-based locking selected.</div><div>=A0 =A0 =
=A0 Setting global/locking_dir to /run/lock/lvm</div>
<div>=A0 =A0 =A0 Setting global/prioritise_write_locks to 1</div><div>=A0 =
=A0 =A0 Setting activation/mirror_region_size to 512</div><div>=A0 =A0 =A0 =
Getting target version for mirror</div><div>=A0 =A0 =A0 =A0 dm version =A0 =
OF =A0 [16384] (*1)</div><div>
=A0 =A0 =A0 =A0 dm versions =A0 OF =A0 [16384] (*1)</div><div>=A0 =A0 =A0 F=
ound mirror target v1.12.1.</div><div>=A0 =A0 =A0 Getting target version fo=
r mirror</div><div>=A0 =A0 =A0 =A0 dm versions =A0 OF =A0 [16384] (*1)</div=
><div>=A0 =A0 =A0 Found mirror target v1.12.1.</div>
<div>=A0 =A0 =A0 Locking /run/lock/lvm/V_lvgrptstnlvm WB</div><div>=A0 =A0 =
=A0 =A0 _do_flock /run/lock/lvm/V_lvgrptstnlvm:aux WB</div><div>=A0 =A0 =A0=
 =A0 _do_flock /run/lock/lvm/V_lvgrptstnlvm WB</div><div>=A0 =A0 =A0 =A0 _u=
ndo_flock /run/lock/lvm/V_lvgrptstnlvm:aux</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/ram0 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0=
 /dev/ram0: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram0: No la=
bel detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram0</div><div>=A0 =A0 =
=A0 =A0 dm status =A0 (252:0) OF =A0 [16384] (*1)</div>
<div>=A0 =A0 =A0 =A0 /dev/lvgrptstnlvm/root_mlog_mimage_0: Reserved interna=
l LV device lvgrptstnlvm/root_mlog_mimage_0 not usable.</div><div>=A0 =A0 =
=A0 =A0 /dev/lvgrptstnlvm/root_mlog_mimage_0: Skipping unusable device</div=
><div>=A0 =A0 =A0 =A0 Opened /dev/ram RO O_DIRECT</div>
<div>=A0 =A0 =A0 =A0 /dev/ram: block size is 4096 bytes</div><div>=A0 =A0 =
=A0 /dev/ram: No label detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram</=
div><div>=A0 =A0 =A0 =A0 Opened /dev/sda1 RO O_DIRECT</div><div>=A0 =A0 =A0=
 =A0 /dev/sda1: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/sda1: lvm2 label detected at sector 1</div><div>=A0 =
=A0 =A0 =A0 lvmcache: /dev/sda1: now in VG #orphans_lvm2 (#orphans_lvm2) wi=
th 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sda1: Found metadata at 67584 size=
 1470 (in area at 4096 size 192512) for lvgrptstnlvm (DxeZ11-9H0a-LSu7-DzkC=
-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sda1: now in VG lvgrptstnlvm with 1 mda=
s</div><div>=A0 =A0 =A0 =A0 lvmcache: /dev/sda1: setting lvgrptstnlvm VGID =
to DxeZ119H0aLSu7DzkC21nfqolp4rPTBp</div><div>=A0 =A0 =A0 =A0 lvmcache: /de=
v/sda1: VG lvgrptstnlvm: Set creation host to Microknoppix.</div>
<div>=A0 =A0 =A0 =A0 dm status =A0 (252:1) OF =A0 [16384] (*1)</div><div>=
=A0 =A0 =A0 =A0 /dev/lvgrptstnlvm/root_mlog_mimage_1: Reserved internal LV =
device lvgrptstnlvm/root_mlog_mimage_1 not usable.</div><div>=A0 =A0 =A0 =
=A0 /dev/lvgrptstnlvm/root_mlog_mimage_1: Skipping unusable device</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/ram2 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0=
 /dev/ram2: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram2: No la=
bel detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram2</div><div>=A0 =A0 =
=A0 =A0 dm status =A0 (252:2) OF =A0 [16384] (*1)</div>
<div>=A0 =A0 =A0 =A0 /dev/dm-2: Skipping unusable device</div><div>=A0 =A0 =
=A0 =A0 Opened /dev/ram3 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/ram3: b=
lock size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram3: No label detected<=
/div><div>=A0 =A0 =A0 =A0 Closed /dev/ram3</div>
<div>=A0 =A0 =A0 =A0 dm status =A0 (252:3) OF =A0 [16384] (*1)</div><div>=
=A0 =A0 =A0 =A0 /dev/dm-3: Skipping unusable device</div><div>=A0 =A0 =A0 =
=A0 Opened /dev/ram4 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/ram4: block=
 size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram4: No label detected</div=
>
<div>=A0 =A0 =A0 =A0 Closed /dev/ram4</div><div>=A0 =A0 =A0 =A0 dm status =
=A0 (252:4) OF =A0 [16384] (*1)</div><div>=A0 =A0 =A0 =A0 /dev/dm-4: Skippi=
ng unusable device</div><div>=A0 =A0 =A0 =A0 Opened /dev/ram5 RO O_DIRECT</=
div><div>=A0 =A0 =A0 =A0 /dev/ram5: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/ram5: No label detected</div><div>=A0 =A0 =A0 =A0 Clo=
sed /dev/ram5</div><div>=A0 =A0 =A0 =A0 dm status =A0 (252:5) OF =A0 [16384=
] (*1)</div><div>=A0 =A0 =A0 =A0 Opened /dev/lvgrptstnlvm/root RO O_DIRECT<=
/div><div>=A0 =A0 =A0 /dev/lvgrptstnlvm/root: size is 12582912 sectors</div=
>
<div>=A0 =A0 =A0 =A0 Closed /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 /d=
ev/lvgrptstnlvm/root: size is 12582912 sectors</div><div>=A0 =A0 =A0 =A0 Op=
ened /dev/lvgrptstnlvm/root RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/lvgr=
ptstnlvm/root: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 =
=A0 Using /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 =A0 Opened /dev/lvgr=
ptstnlvm/root RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/lvgrptstnlvm/root:=
 block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/lvgrptstnlvm/root: No label detected</div><div>=A0 =
=A0 =A0 =A0 Closed /dev/lvgrptstnlvm/root</div><div>=A0 =A0 =A0 =A0 Opened =
/dev/ram6 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/ram6: block size is 40=
96 bytes</div><div>=A0 =A0 =A0 /dev/ram6: No label detected</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/ram6</div><div>=A0 =A0 =A0 =A0 Opened /dev=
/ram7 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/ram7: block size is 4096 b=
ytes</div><div>=A0 =A0 =A0 /dev/ram7: No label detected</div><div>=A0 =A0 =
=A0 =A0 Closed /dev/ram7</div><div>
=A0 =A0 =A0 =A0 Opened /dev/ram8 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev=
/ram8: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram8: No label d=
etected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram8</div><div>=A0 =A0 =A0 =
=A0 Opened /dev/ram9 RO O_DIRECT</div>
<div>=A0 =A0 =A0 =A0 /dev/ram9: block size is 4096 bytes</div><div>=A0 =A0 =
=A0 /dev/ram9: No label detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram9=
</div><div>=A0 =A0 =A0 =A0 Opened /dev/ram10 RO O_DIRECT</div><div>=A0 =A0 =
=A0 =A0 /dev/ram10: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/ram10: No label detected</div><div>=A0 =A0 =A0 =A0 Cl=
osed /dev/ram10</div><div>=A0 =A0 =A0 =A0 Opened /dev/ram11 RO O_DIRECT</di=
v><div>=A0 =A0 =A0 =A0 /dev/ram11: block size is 4096 bytes</div><div>=A0 =
=A0 =A0 /dev/ram11: No label detected</div>
<div>=A0 =A0 =A0 =A0 Closed /dev/ram11</div><div>=A0 =A0 =A0 =A0 Opened /de=
v/ram12 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/ram12: block size is 409=
6 bytes</div><div>=A0 =A0 =A0 /dev/ram12: No label detected</div><div>=A0 =
=A0 =A0 =A0 Closed /dev/ram12</div>
<div>=A0 =A0 =A0 =A0 Opened /dev/ram13 RO O_DIRECT</div><div>=A0 =A0 =A0 =
=A0 /dev/ram13: block size is 4096 bytes</div><div>=A0 =A0 =A0 /dev/ram13: =
No label detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ram13</div><div>=A0=
 =A0 =A0 =A0 Opened /dev/ram14 RO O_DIRECT</div>
<div>=A0 =A0 =A0 =A0 /dev/ram14: block size is 4096 bytes</div><div>=A0 =A0=
 =A0 /dev/ram14: No label detected</div><div>=A0 =A0 =A0 =A0 Closed /dev/ra=
m14</div><div>=A0 =A0 =A0 =A0 Opened /dev/ram15 RO O_DIRECT</div><div>=A0 =
=A0 =A0 =A0 /dev/ram15: block size is 4096 bytes</div>
<div>=A0 =A0 =A0 /dev/ram15: No label detected</div><div>=A0 =A0 =A0 =A0 Cl=
osed /dev/ram15</div><div>=A0 =A0 =A0 =A0 Opened /dev/sdb1 RO O_DIRECT</div=
><div>=A0 =A0 =A0 =A0 /dev/sdb1: block size is 4096 bytes</div><div>=A0 =A0=
 =A0 /dev/sdb1: lvm2 label detected at sector 1</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb1: now in VG #orphans_lvm2 (#orphans=
_lvm2) with 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sdb1: Found metadata at 3=
1232 size 1470 (in area at 4096 size 520192) for lvgrptstnlvm (DxeZ11-9H0a-=
LSu7-DzkC-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb1: now in VG lvgrptstnlvm (DxeZ119H0=
aLSu7DzkC21nfqolp4rPTBp) with 1 mdas</div><div>=A0 =A0 =A0 =A0 Opened /dev/=
sdb2 RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/sdb2: block size is 4096 by=
tes</div><div>=A0 =A0 =A0 /dev/sdb2: lvm2 label detected at sector 1</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb2: now in VG #orphans_lvm2 (#orphans=
_lvm2) with 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sdb2: Found metadata at 2=
9696 size 1470 (in area at 4096 size 1044480) for lvgrptstnlvm (DxeZ11-9H0a=
-LSu7-DzkC-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdb2: now in VG lvgrptstnlvm (DxeZ119H0=
aLSu7DzkC21nfqolp4rPTBp) with 1 mdas</div><div>=A0 =A0 =A0 =A0 Opened /dev/=
sdc RO O_DIRECT</div><div>=A0 =A0 =A0 =A0 /dev/sdc: block size is 4096 byte=
s</div><div>=A0 =A0 =A0 /dev/sdc: lvm2 label detected at sector 1</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdc: now in VG #orphans_lvm2 (#orphans_=
lvm2) with 0 mdas</div><div>=A0 =A0 =A0 =A0 /dev/sdc: Found metadata at 281=
60 size 1470 (in area at 4096 size 1044480) for lvgrptstnlvm (DxeZ11-9H0a-L=
Su7-DzkC-21nf-qolp-4rPTBp)</div>
<div>=A0 =A0 =A0 =A0 lvmcache: /dev/sdc: now in VG lvgrptstnlvm (DxeZ119H0a=
LSu7DzkC21nfqolp4rPTBp) with 1 mdas</div><div>=A0 =A0 =A0 =A0 Using cached =
label for /dev/sda1</div><div>=A0 =A0 =A0 =A0 Using cached label for /dev/s=
db1</div><div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdb2</div>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdc</div><div>=A0 =A0 =A0 =
=A0 Allocated VG lvgrptstnlvm at 0x8194c58.</div><div>=A0 =A0 =A0 =A0 Using=
 cached label for /dev/sda1</div><div>=A0 =A0 =A0 =A0 Using cached label fo=
r /dev/sdb1</div><div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdb2</div=
>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdc</div><div>=A0 =A0 =A0 =
=A0 Read lvgrptstnlvm metadata (119) from /dev/sda1 at 67584 size 1470</div=
><div>=A0 =A0 =A0 =A0 Allocated VG lvgrptstnlvm at 0x8198c60.</div><div>=A0=
 =A0 =A0 =A0 Using cached label for /dev/sda1</div>
<div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdb1</div><div>=A0 =A0 =A0=
 =A0 Using cached label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 Using cache=
d label for /dev/sdc</div><div>=A0 =A0 =A0 =A0 Read lvgrptstnlvm metadata (=
119) from /dev/sdb1 at 31232 size 1470</div>
<div>=A0 =A0 =A0 =A0 Freeing VG lvgrptstnlvm at 0x8198c60.</div><div>=A0 =
=A0 =A0 =A0 Allocated VG lvgrptstnlvm at 0x8198c60.</div><div>=A0 =A0 =A0 =
=A0 Using cached label for /dev/sda1</div><div>=A0 =A0 =A0 =A0 Using cached=
 label for /dev/sdb1</div><div>
=A0 =A0 =A0 =A0 Using cached label for /dev/sdb2</div><div>=A0 =A0 =A0 =A0 =
Using cached label for /dev/sdc</div><div>=A0 =A0 =A0 =A0 Read lvgrptstnlvm=
 metadata (119) from /dev/sdb2 at 29696 size 1470</div><div>=A0 =A0 =A0 =A0=
 Freeing VG lvgrptstnlvm at 0x8198c60.</div>
<div>=A0 =A0 =A0 =A0 Allocated VG lvgrptstnlvm at 0x8198c60.</div><div>=A0 =
=A0 =A0 =A0 Using cached label for /dev/sda1</div><div>=A0 =A0 =A0 =A0 Usin=
g cached label for /dev/sdb1</div><div>=A0 =A0 =A0 =A0 Using cached label f=
or /dev/sdb2</div><div>=A0 =A0 =A0 =A0 Using cached label for /dev/sdc</div=
>
<div>=A0 =A0 =A0 =A0 Read lvgrptstnlvm metadata (119) from /dev/sdc at 2816=
0 size 1470</div><div>=A0 =A0 =A0 =A0 Freeing VG lvgrptstnlvm at 0x8198c60.=
</div><div>=A0 =A0 =A0 =A0 /dev/sda1 0: =A0 =A0 =A00 =A0 1536: root(0:0)</d=
iv><div>=A0 =A0 =A0 =A0 /dev/sda1 1: =A0 1536 =A0 =A0767: NULL(0:0)</div>
<div>=A0 =A0 =A0 =A0 /dev/sdb1 0: =A0 =A0 =A00 =A0 2271: NULL(0:0)</div><di=
v>=A0 =A0 =A0 =A0 /dev/sdb2 0: =A0 =A0 =A00 =A0 =A0 31: NULL(0:0)</div><div=
>=A0 =A0 =A0 =A0 /dev/sdc 0: =A0 =A0 =A00 =A0 =A0 =A07: NULL(0:0)</div><div=
>=A0 =A0 =A0 =A0 Adding PE range: start PE 0 length 2271 on /dev/sdb1</div>
<div>=A0 =A0 Archiving volume group &quot;lvgrptstnlvm&quot; metadata (seqn=
o 119).</div><div>=A0 =A0 Adjusting mirror image count of root</div><div>=
=A0 =A0 Setting logging type to mirrored</div><div>=A0 =A0 =A0 allocation/m=
irror_logs_require_separate_pvs not found in config: defaulting to 0</div>
<div>=A0 =A0 =A0 allocation/maximise_cling not found in config: defaulting =
to 1</div><div>=A0 =A0 =A0 =A0 Allowing allocation on /dev/sdb1 start PE 0 =
length 2271</div><div>=A0 =A0 =A0 =A0 Parallel PVs at LE 0 length 1536: /de=
v/sda1</div><div>=A0 =A0 =A0 =A0 Trying allocation using contiguous policy.=
</div>
<div>=A0 =A0 =A0 =A0 Still need 1538 total extents:</div><div>=A0 =A0 =A0 =
=A0 =A0 1 (1 data/0 parity) parallel areas of 1536 extents each</div><div>=
=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><div>=A0 =A0 =A0 =
=A0 Considering allocation area 0 as /dev/sdb1 start PE 0 length 1536 leavi=
ng 735.</div>
<div>=A0 =A0 =A0 =A0 Trying allocation using cling policy.</div><div>=A0 =
=A0 =A0 =A0 Cling_to_allocated is set</div><div>=A0 =A0 =A0 =A0 Still need =
1538 total extents:</div><div>=A0 =A0 =A0 =A0 =A0 1 (1 data/0 parity) paral=
lel areas of 1536 extents each</div>
<div>=A0 =A0 =A0 =A0 =A0 2 mirror logs of 1 extents each</div><div>=A0 =A0 =
=A0 =A0 Trying allocation using normal policy.</div><div>=A0 =A0 =A0 =A0 Cl=
ing_to_allocated is set</div><div>=A0 =A0 =A0 =A0 Still need 1538 total ext=
ents:</div><div>=A0 =A0 =A0 =A0 =A0 1 (1 data/0 parity) parallel areas of 1=
536 extents each</div>
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
Closed /dev/sdc</div><div>=A0 =A0 =A0 =A0 Freeing VG lvgrptstnlvm at 0x8194=
c58.</div><div>root@Microknoppix:/tmp/lvm2-2_02_98#</div>
</div><div><br></div><div><br></div><div>Alex</div><div><br></div></div>

--047d7b3439a41c1dce04e0b062ae--
