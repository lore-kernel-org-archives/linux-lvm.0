Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n87J9v5H009342
	for <linux-lvm@redhat.com>; Mon, 7 Sep 2009 15:09:57 -0400
Received: from rietz.debian.org (rietz.debian.org [140.211.166.43])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n87J9jEs009158
	for <linux-lvm@redhat.com>; Mon, 7 Sep 2009 15:09:45 -0400
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.545524.B.125234971614195@bugs.debian.org>
Date: Mon, 7 Sep 2009 20:55:19 +0200
From: Bastian Blank <waldi@debian.org>
Message-ID: <20090907185519.GA26243@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Bug#545524: dmsetup - LVM layer devices must not be
	used for UUID device
Reply-To: Bastian Blank <waldi@debian.org>, 545524@bugs.debian.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: submit@bugs.debian.org

Package: dmsetup
Version: 2:1.02.36-4
Severity: important

The device-mapper udev rules currently produces UUID and LABEL entries
for all devices, including the LVM specific -real device and snapshot
devices.

| # lvs            
|   LV         VG        Attr   LSize  Origin Snap%  Move Log Copy%  Convert
|   test       vg0_devel owi-a-  2,00G
|   test1      vg0_devel swi-a-  1,00G test     0,00
| # ls -al /dev/mapper/vg0_devel-test*
| brw------- 1 waldi disk 254, 4  6. Sep 00:10 /dev/mapper/vg0_devel-test
| brw-rw---- 1 root  disk 254, 5  7. Sep 20:33 /dev/mapper/vg0_devel-test1
| brw-rw---- 1 root  disk 254, 7  7. Sep 20:33 /dev/mapper/vg0_devel-test1-cow
| brw------- 1 waldi disk 254, 6  7. Sep 20:33 /dev/mapper/vg0_devel-test-real
| # cat /dev/.udev/db/\\x2fdevices\\x2fvirtual\\x2fblock\\x2fdm-4
| N:mapper/vg0_devel-test
| S:block/254:4
| S:dm-4
| S:disk/by-id/dm-name-vg0_devel-test
| S:disk/by-id/dm-uuid-LVM-gQW16K2IGtKODuJvxplrppedk57IHSrsg6ATwJYh28mwsb271Cwni4UV1IXnYzmC
| S:disk/by-uuid/0995ba56-731a-4e9a-a047-d12ae5117606
| S:vg0_devel/test
[...]
| # cat /dev/.udev/db/\\x2fdevices\\x2fvirtual\\x2fblock\\x2fdm-5
| N:mapper/vg0_devel-test1
| S:block/254:5
| S:dm-5
| S:disk/by-id/dm-name-vg0_devel-test1
| S:disk/by-id/dm-uuid-LVM-gQW16K2IGtKODuJvxplrppedk57IHSrsoCyDbIs9tJJWNCvrS9bp23pyyxYCxve4
| S:disk/by-uuid/0995ba56-731a-4e9a-a047-d12ae5117606
| S:vg0_devel/test1
[...]
| # cat /dev/.udev/db/\\x2fdevices\\x2fvirtual\\x2fblock\\x2fdm-6
| N:mapper/vg0_devel-test-real
| S:block/254:6
| S:dm-6
| S:disk/by-id/dm-name-vg0_devel-test-real
| S:disk/by-id/dm-uuid-LVM-gQW16K2IGtKODuJvxplrppedk57IHSrsg6ATwJYh28mwsb271Cwni4UV1IXnYzmC-real
| S:disk/by-uuid/0995ba56-731a-4e9a-a047-d12ae5117606
[...]
| # cat /dev/.udev/db/\\x2fdevices\\x2fvirtual\\x2fblock\\x2fdm-7
| N:mapper/vg0_devel-test1-cow
| S:block/254:7
| S:dm-7
| S:disk/by-id/dm-name-vg0_devel-test1-cow
| S:disk/by-id/dm-uuid-LVM-gQW16K2IGtKODuJvxplrppedk57IHSrsoCyDbIs9tJJWNCvrS9bp23pyyxYCxve4-cow
[...]

So the LVs test and test1, plus the base device test-real define the
same UUID name.

Bastian

-- 
Only a fool fights in a burning house.
		-- Kank the Klingon, "Day of the Dove", stardate unknown
