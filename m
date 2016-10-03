Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u93NnoKU002256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 3 Oct 2016 19:49:50 -0400
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4542CBAF0
	for <linux-lvm@redhat.com>; Mon,  3 Oct 2016 23:49:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f193so136313277wmg.0
	for <linux-lvm@redhat.com>; Mon, 03 Oct 2016 16:49:48 -0700 (PDT)
MIME-Version: 1.0
From: Slava Prisivko <vprisivko@gmail.com>
Date: Mon, 03 Oct 2016 23:49:35 +0000
Message-ID: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7ba973124f3b21053dfe9941
Subject: [linux-lvm] LVM RAID5 out-of-sync recovery
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

--047d7ba973124f3b21053dfe9941
Content-Type: text/plain; charset=UTF-8

Hi,

In order to mitigate cross-posting, here's the original question on
Serverfault.SE: LVM RAID5 out-of-sync recovery
<https://serverfault.com/questions/806805/lvm-raid5-out-of-sync-recovery>,
but feel free to answer wherever you deem appropriate.

How can one recover from an LVM RAID5 out-of-sync?

I have an LVM RAID5 configuration (RAID5 using the LVM tools).

However, because of a technical problem mirrors went out of sync. You can
reproduce this as explained in this Unix & Linux question
<http://unix.stackexchange.com/a/182503>:

> Playing with my Jessie VM, I disconnected (virtually) one disk. That
worked, the machine stayed running. lvs, though, gave no indication the
arrays were degraded. I re-attached the disk, and removed a second. Stayed
running (this is raid6). Re-attached, still no indication from lvs. I ran
lvconvert --repair on the volume, it told me it was OK. Then I pulled a
third disk... and the machine died. Re-inserted it, rebooted, and am now
unsure how to fix.

If I had been using mdadm, I could have probably recovered the data using
`mdadm --force --assemble`, but I was not able to achieve the same using
the LVM tools.

I have tried to concatenate rmeta and rimage for each mirror and put them
on three linear devices in order to feed them to the mdadm (because LVM
leverages MD), but without success (`mdadm --examine` does not recognize
the superblock), because it appears that the mdadm superblock format
<https://raid.wiki.kernel.org/index.php/RAID_superblock_formats> differs
from the dm_raid superblock format (search for the "dm_raid_superblock")
<https://github.com/torvalds/linux/blob/43f4d36cbf82428374966568ea57a0bc0d664a20/drivers/md/dm-raid.c>
.

I tried to understand how device-mapper RAID
<https://www.kernel.org/doc/Documentation/device-mapper/dm-raid.txt>
leverages MD, but was unable to find any documentation while the kernel code
<https://github.com/torvalds/linux/blob/43f4d36cbf82428374966568ea57a0bc0d664a20/drivers/md/dm-raid.c>
is quite complicated.

I also tried to rebuild the mirror directly by using `dmsetup`, but it
can't rebuild if metadata is out of sync.

Overall, almost the only useful information I could find is RAIDing with
LVM vs MDRAID - pros and cons? question on Unix & Linux SE
<http://unix.stackexchange.com/a/182503>.

The output of various commands is provided below.

    # lvs -a -o +devices

    test                           vg   rwi---r---  64.00m
test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)
    [test_rimage_0]                vg   Iwi-a-r-r-  32.00m /dev/sdc2(1)
    [test_rimage_1]                vg   Iwi-a-r-r-  32.00m
/dev/sda2(238244)
    [test_rimage_2]                vg   Iwi-a-r-r-  32.00m
/dev/sdb2(148612)
    [test_rmeta_0]                 vg   ewi-a-r-r-   4.00m /dev/sdc2(0)
    [test_rmeta_1]                 vg   ewi-a-r-r-   4.00m
/dev/sda2(238243)
    [test_rmeta_2]                 vg   ewi-a-r-r-   4.00m /dev/sdb2(148611)

I cannot activate the LV:

    # lvchange -ay vg/test -v
        Activating logical volume "test" exclusively.
        activation/volume_list configuration setting not defined: Checking
only host tags for vg/test.
        Loading vg-test_rmeta_0 table (253:35)
        Suppressed vg-test_rmeta_0 (253:35) identical table reload.
        Loading vg-test_rimage_0 table (253:36)
        Suppressed vg-test_rimage_0 (253:36) identical table reload.
        Loading vg-test_rmeta_1 table (253:37)
        Suppressed vg-test_rmeta_1 (253:37) identical table reload.
        Loading vg-test_rimage_1 table (253:38)
        Suppressed vg-test_rimage_1 (253:38) identical table reload.
        Loading vg-test_rmeta_2 table (253:39)
        Suppressed vg-test_rmeta_2 (253:39) identical table reload.
        Loading vg-test_rimage_2 table (253:40)
        Suppressed vg-test_rimage_2 (253:40) identical table reload.
        Creating vg-test
        Loading vg-test table (253:87)
      device-mapper: reload ioctl on (253:87) failed: Invalid argument
        Removing vg-test (253:87)

While trying to activate I'm getting the following in the dmesg:

    device-mapper: table: 253:87: raid: Cannot change device positions in
RAID array
    device-mapper: ioctl: error adding target to table

lvconvert only works on active LVs:
    # lvconvert --repair vg/test

      vg/test must be active to perform this operation.

I have the following LVM version:

    # lvm version
      LVM version:     2.02.145(2) (2016-03-04)
      Library version: 1.02.119 (2016-03-04)
      Driver version:  4.34.0

And the following kernel version:

    Linux server 4.4.8-hardened-r1-1 #1 SMP

--
Best regards,
Slava Prisivko.

--047d7ba973124f3b21053dfe9941
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>In order to mitigate cross-posting,=
 here&#39;s the original question on Serverfault.SE:=C2=A0<a href=3D"https:=
//serverfault.com/questions/806805/lvm-raid5-out-of-sync-recovery">LVM RAID=
5 out-of-sync recovery</a>, but feel free to answer wherever you deem appro=
priate.</div><div><br></div><div><div>How can one recover from an LVM RAID5=
 out-of-sync?</div><div><br></div><div>I have an LVM RAID5 configuration (R=
AID5 using the LVM tools).=C2=A0</div><div><br></div><div>However, because =
of a technical problem mirrors went out of sync. You can reproduce this as =
explained <a href=3D"http://unix.stackexchange.com/a/182503">in this Unix &=
amp; Linux question</a>:</div><div><br></div><div>&gt; Playing with my Jess=
ie VM, I disconnected (virtually) one disk. That worked, the machine stayed=
 running. lvs, though, gave no indication the arrays were degraded. I re-at=
tached the disk, and removed a second. Stayed running (this is raid6). Re-a=
ttached, still no indication from lvs. I ran lvconvert --repair on the volu=
me, it told me it was OK. Then I pulled a third disk... and the machine die=
d. Re-inserted it, rebooted, and am now unsure how to fix.</div><div><br></=
div><div>If I had been using mdadm, I could have probably recovered the dat=
a using `mdadm --force --assemble`, but I was not able to achieve the same =
using the LVM tools.</div><div><br></div><div>I have tried to concatenate r=
meta and rimage for each mirror and put them on three linear devices in ord=
er to feed them to the mdadm (because LVM leverages MD), but without succes=
s (`mdadm --examine` does not recognize the superblock), because it appears=
 that the <a href=3D"https://raid.wiki.kernel.org/index.php/RAID_superblock=
_formats">mdadm superblock format</a> differs from the <a href=3D"https://g=
ithub.com/torvalds/linux/blob/43f4d36cbf82428374966568ea57a0bc0d664a20/driv=
ers/md/dm-raid.c">dm_raid superblock format (search for the &quot;dm_raid_s=
uperblock&quot;)</a>.</div><div><br></div><div>I tried to understand how <a=
 href=3D"https://www.kernel.org/doc/Documentation/device-mapper/dm-raid.txt=
">device-mapper RAID</a> leverages MD, but was unable to find any documenta=
tion while the <a href=3D"https://github.com/torvalds/linux/blob/43f4d36cbf=
82428374966568ea57a0bc0d664a20/drivers/md/dm-raid.c">kernel code</a> is qui=
te complicated.</div><div><br></div><div>I also tried to rebuild the mirror=
 directly by using `dmsetup`, but it can&#39;t rebuild if metadata is out o=
f sync.</div><div><br></div><div>Overall, almost the only useful informatio=
n I could find is <a href=3D"http://unix.stackexchange.com/a/182503">RAIDin=
g with LVM vs MDRAID - pros and cons? question on Unix &amp; Linux SE</a>.<=
/div><div><br></div><div>The output of various commands is provided below.<=
/div><div><br></div><div>=C2=A0 =C2=A0 # lvs -a -o +devices =C2=A0</div><di=
v>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 test =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg =C2=
=A0 rwi---r--- =C2=A064.00m test_rimage_0(0),test_rimage_1(0),test_rimage_2=
(0)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rimage_0] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg =C2=A0 Iwi-a-r-r- =C2=A032.00m /dev/sdc2(=
1)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rimage_1] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg =C2=A0 Iwi-a-r-r- =C2=A032.00m /dev/sda2(=
238244)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rimage_2] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg =C2=A0 Iwi-a-r-r- =C2=A032.00m /dev/sd=
b2(148612)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rmeta_0] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg =C2=A0 ewi-a-r-r- =C2=A0 4.00m /d=
ev/sdc2(0)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rmeta_1] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg =C2=A0 ewi-a-r-r- =C2=A0 4.00m /d=
ev/sda2(238243)=C2=A0</div><div>=C2=A0 =C2=A0 [test_rmeta_2] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg =C2=A0 ewi-a-r-r- =C2=A0 4.00m=
 /dev/sdb2(148611)</div><div><br></div><div>I cannot activate the LV:</div>=
<div><br></div><div>=C2=A0 =C2=A0 # lvchange -ay vg/test -v</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Activating logical volume &quot;test&quot; exclusi=
vely.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 activation/volume_list configur=
ation setting not defined: Checking only host tags for vg/test.</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Loading vg-test_rmeta_0 table (253:35)</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suppressed vg-test_rmeta_0 (253:35) identical=
 table reload.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Loading vg-test_rimage=
_0 table (253:36)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suppressed vg-test_=
rimage_0 (253:36) identical table reload.</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Loading vg-test_rmeta_1 table (253:37)</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Suppressed vg-test_rmeta_1 (253:37) identical table reload.</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Loading vg-test_rimage_1 table (253:38)</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suppressed vg-test_rimage_1 (253:38) i=
dentical table reload.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Loading vg-tes=
t_rmeta_2 table (253:39)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suppressed v=
g-test_rmeta_2 (253:39) identical table reload.</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Loading vg-test_rimage_2 table (253:40)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Suppressed vg-test_rimage_2 (253:40) identical table reload.<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Creating vg-test</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Loading vg-test table (253:87)</div><div>=C2=A0 =C2=A0 =
=C2=A0 device-mapper: reload ioctl on (253:87) failed: Invalid argument</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Removing vg-test (253:87)</div><div><br>=
</div><div>While trying to activate I&#39;m getting the following in the dm=
esg:</div><div><br></div><div>=C2=A0 =C2=A0 device-mapper: table: 253:87: r=
aid: Cannot change device positions in RAID array</div><div>=C2=A0 =C2=A0 d=
evice-mapper: ioctl: error adding target to table</div><div><br></div><div>=
lvconvert only works on active LVs:</div><div>=C2=A0 =C2=A0 # lvconvert --r=
epair vg/test =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 vg/test must be active to =
perform this operation.</div><div><br></div><div>I have the following LVM v=
ersion:</div><div><br></div><div>=C2=A0 =C2=A0 # lvm version</div><div>=C2=
=A0 =C2=A0 =C2=A0 LVM version: =C2=A0 =C2=A0 2.02.145(2) (2016-03-04)</div>=
<div>=C2=A0 =C2=A0 =C2=A0 Library version: 1.02.119 (2016-03-04)</div><div>=
=C2=A0 =C2=A0 =C2=A0 Driver version: =C2=A04.34.0</div><div><br></div><div>=
And the following kernel version:</div><div><br></div><div>=C2=A0 =C2=A0 Li=
nux server 4.4.8-hardened-r1-1 #1 SMP</div><div><br></div><div>--</div></di=
v><div>Best regards,</div><div>Slava Prisivko.</div></div>

--047d7ba973124f3b21053dfe9941--
