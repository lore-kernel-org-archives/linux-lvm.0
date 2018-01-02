Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1FD5D6B7
	for <linux-lvm@redhat.com>; Tue,  2 Jan 2018 06:47:21 +0000 (UTC)
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8733981138
	for <linux-lvm@redhat.com>; Tue,  2 Jan 2018 06:47:20 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id d21so28126238pll.1
	for <linux-lvm@redhat.com>; Mon, 01 Jan 2018 22:47:20 -0800 (PST)
Received: from hurricane.ee.washington.edu
	([2603:3023:81d:3800:e09a:5f52:a85:8cfd])
	by smtp.gmail.com with ESMTPSA id
	z74sm96647907pfi.123.2018.01.01.22.47.18 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jan 2018 22:47:18 -0800 (PST)
From: Gordon Messmer <gordon.messmer@gmail.com>
Message-ID: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
Date: Mon, 1 Jan 2018 22:47:16 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] unable to exclude LVs using global_filter
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

I'd like to avoid scanning LVs, and I thought I'd set global_filter 
appropriately.  The following logs show global_filter set to reject 
^/dev/VolGroup/vm_, but the system is scanning 
/dev/VolGroup/vm_wiki_data.  Any hints as to what I'm doing wrong?



Dec 06 13:08:37 kvm-test.private lvm[532]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:37 kvm-test.private lvm[534]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:38 kvm-test.private lvm[543]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:40 kvm-test.private lvm[648]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:40 kvm-test.private lvm[648]: Setting devices/filter to 
filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:42 kvm-test.private lvm[751]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:42 kvm-test.private lvm[751]: Setting devices/filter to 
filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting devices/global_filter 
to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting devices/filter to 
filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
size is 10485760 sectors
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
block size is 4096 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
physical block size is 512 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
using cached size 10485760 sectors
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
block size is 4096 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
physical block size is 512 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Scanning dev 253:3 for 
lvmetad cache.
Dec 06 13:08:44 kvm-test.private lvm[785]: Reading label from device 
/dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
block size is 4096 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
physical block size is 512 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
lvm2 label detected at sector 1
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache 
/dev/VolGroup/vm_wiki_data: now in VG #orphans_lvm2 (#orphans_lvm2) with 
0 mda(s).
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
PV header extension version 2 found
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
Found metadata at 8704 size 1086 (in area at 4096 size 1044480) for 
DataGroup (ZY69boAqK0Cz6TYGHdevNQfQ2O1sbJoG)
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache has no info for 
vgname "DataGroup" with VGID ZY69boAqK0Cz6TYGHdevNQfQ2O1sbJoG.
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache has no info for 
vgname "DataGroup".
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache 
/dev/VolGroup/vm_wiki_data: now in VG DataGroup with 1 mda(s).
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache 
/dev/VolGroup/vm_wiki_data: VG DataGroup: set VGID to 
ZY69boAqK0Cz6TYGHdevNQfQ2O1sbJoG.
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache 
/dev/VolGroup/vm_wiki_data: VG DataGroup: set creation host to 
localhost.localdomain.
Dec 06 13:08:44 kvm-test.private lvm[785]: lvmcache 
/dev/VolGroup/vm_wiki_data: VG DataGroup: stored metadata checksum 
0xf5731900 with size 1086.
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
block size is 4096 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
physical block size is 512 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: Allocated VG DataGroup at 
0x560c70fc8bb0.
Dec 06 13:08:44 kvm-test.private lvm[785]: Importing logical volume 
DataGroup/data.
Dec 06 13:08:44 kvm-test.private lvm[785]: Read DataGroup metadata (4) 
from /dev/VolGroup/vm_wiki_data at 8704 size 1086
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Opened 
/dev/VolGroup/vm_wiki_data RO O_DIRECT
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
block size is 4096 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: /dev/VolGroup/vm_wiki_data: 
physical block size is 512 bytes
Dec 06 13:08:44 kvm-test.private lvm[785]: Closed /dev/VolGroup/vm_wiki_data
Dec 06 13:08:44 kvm-test.private lvm[785]: Telling lvmetad to store PV 
/dev/VolGroup/vm_wiki_data (NRKTXX-I9D8-Vxb1-hKcX-rjJX-GNhB-jgsXiW) in 
VG DataGroup
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting response to OK
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting response to OK
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting response to OK
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting seqno_after to 4
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting seqno_after to 4
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting seqno_before to 4
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting status to complete
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting vgname to DataGroup
Dec 06 13:08:44 kvm-test.private lvm[785]: Setting changed to 1
Dec 06 13:08:44 kvm-test.private lvm[785]: VG DataGroup is complete in 
lvmetad with dev /dev/VolGroup/vm_wiki_data.
Dec 06 13:08:44 kvm-test.private lvm[785]: VG DataGroup is changed in 
lvmetad.
Dec 06 13:08:44 kvm-test.private lvm[785]: Freeing VG DataGroup at 
0x560c70fc8bb0.
