Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFF3C2010D59
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 23:58:02 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D03E430058C2
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 23:57:50 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r15-v6so12209869wmc.1
	for <linux-lvm@redhat.com>; Sun, 03 Jun 2018 16:57:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
From: Inbox <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 16:57:49 -0700
Message-ID: <CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

OK, I think I've traced this back to a bug in pvcreate with
"--pvmetadatacopies 2".  Or, at least a bug in lvm2 2.02.162 - the
version available back then when I started using this disk.

I found pvdissect, a python script from syslinux available here:
https://www.syslinux.org/wiki/index.php?title=Development/LVM_support/pvdissect
***

Working through its output (copied way below) it's looking to me like
lvm works within the pvmetadata space it has, overwriting out of data
metadata with new copies.

Ordinarily, I don't think this would be fatal.  If lvm works within
the space it has, this just means not as many old copies of metadata
will be kept.  But, the pvcreate bug left room for only 48,640 bytes
of xml in mda1 vs 966,656 in mda1.  As my "lvm = {" xml is 20,624
bytes, there's only room for 2 copies of the xml in mda1.

It must be this combination of too small of an xml area in mda1, with
a large "lvm = {" xml that doesn't allow LVM to work within such a
confined space, and try to write past the end of the disk.


The output way below below shows:

* disk size is correct (pv_header.device_size 0x48aa3231e00 is
4993488985600, bytes reported by fdisk)
* mda0 is located at 4096 bytes (pv_header.disk_areas.mda0.offset
0x1000 is 4096 bytes)
* mda0 is size 1044480 bytes (pv_header.disk_areas.md0.size 0xff000)
* mda1 is located at 4993488781312 bytes which is 204288 from last
disk byte (pv_header.disk_areas.mda1.offset 0x48aa3200000)
* mda1 is size 204288 bytes (pv_header.disk_areas.mda1.size 0x31e00)
* the mda checksums are now different (0xf0662726 vs 0xb46ba552)

So, it made mda1 to only be 19.5~% the size of mda0.

mda0 has room for xml of 966656 bytes.  (starts at 0x14000, mda0 goes
from 0x1000 for 0xff000 bytes, so to 0x100000 = EC000 available =
966656)

md1 only has room for xml of 48640 bytes.  (starts at 0x48aa3226000,
mda1 goes from 0x48aa3200000 for 0x31e00 bytes, so to 48AA3231E00 =
BE00 available = 48640)



*** pvdissect note: at end, per file's example usage, I had to add:
my_pv = PV()
my_pv.open("/dev/sdh3")
print my_pv
my_pv.close()



# python2 pvdissect.withPrint
0x00000200 (label_header.id):
    LABELONE
0x00000208 (label_header.sector):
    1
0x00000210 (label_header.crc):
    0x199978e7
0x00000214 (label_header.offset):
    0x20
0x00000218 (label_header.type):
    LVM2 001
0x00000220 (pv_header.uuid):
    BK8suJ-dqiy-mdK4-IyUH-aeRR-TPUo-3Dj6JG
0x00000240 (pv_header.device_size):
    0x48aa3231e00
0x00000248 (pv_header.disk_areas.da0.offset):
    0x100000
0x00000250 (pv_header.disk_areas.da0.size):
    0x0
0x00000268 (pv_header.disk_areas.mda0.offset):
    0x1000
0x00000270 (pv_header.disk_areas.mda0.size):
    0xff000
0x00000278 (pv_header.disk_areas.mda1.offset):
    0x48aa3200000
0x00000280 (pv_header.disk_areas.mda1.size):
    0x31e00
0x00001000 (mda_header.checksum):
    0xf0662726
0x00001004 (mda_header.magic):
     LVM2 x[5A%r0N*>
0x00001014 (mda_header.version):
    1
0x00001018 (mda_header.start):
    0x1000
0x00001020 (mda_header.size):
    0xff000
0x00001028 (mda_header.raw_locns0.offset):
    0x13000
0x00001030 (mda_header.raw_locns0.size):
    0x5072
0x00001038 (mda_header.raw_locns0.checksum):
    0xb13c7340
0x0000103c (mda_header.raw_locns0.flags):
    0
0x00001028 (mda_header.raw_locns0.offset):
    0x13000
0x00001030 (mda_header.raw_locns0.size):
    0x5072
0x00001038 (mda_header.raw_locns0.checksum):
    0xb13c7340
0x0000103c (mda_header.raw_locns0.flags):
    0
0x48aa3200000 (mda_header.checksum):
    0xb46ba552
0x48aa3200004 (mda_header.magic):
     LVM2 x[5A%r0N*>
0x48aa3200014 (mda_header.version):
    1
0x48aa3200018 (mda_header.start):
    0x48aa3200000
0x48aa3200020 (mda_header.size):
    0x31e00
0x48aa3200028 (mda_header.raw_locns0.offset):
    0x26000
0x48aa3200030 (mda_header.raw_locns0.size):
    0x51c8
0x48aa3200038 (mda_header.raw_locns0.checksum):
    0xe5da72ee
0x48aa320003c (mda_header.raw_locns0.flags):
    0
0x48aa3200028 (mda_header.raw_locns0.offset):
    0x26000
0x48aa3200030 (mda_header.raw_locns0.size):
    0x51c8
0x48aa3200038 (mda_header.raw_locns0.checksum):
    0xe5da72ee
0x48aa320003c (mda_header.raw_locns0.flags):
    0
0x00014000 (metadata.value):
...
0x48aa3226000 (metadata.value):
...
