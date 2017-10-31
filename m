Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 609AF5C66F
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2017 09:13:19 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34D0A81138
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2017 09:13:18 +0000 (UTC)
From: Eric Ren <zren@suse.com>
Message-ID: <62e20a94-30fe-ebe1-ad09-63ef8fb5feb4@suse.com>
Date: Tue, 31 Oct 2017 17:13:04 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] Does cmirror can tolerate one faulty PV?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I performed a fault tolerance testing on cmirrored LV in cluster with 
lvm2-2.02.98.

The result really surprises me: a cmirrored LV cannot continue to work 
after disabling
its one leg PV. Is this a known issue? Or am I doing something wrong?

The steps follows:

# clvmd and cmirrord started...
# vgcreate vg1 /dev/sda /dev/sdb
# lvcreate -L1G -n lv1 --mirrorlog mirrored vg1 /dev/sda /dev/sdb
# dd if=/dev/zero of=/dev/vg1/lv1 bs=1k count=1000        ===> OK
# lvchange -an vg1/lv1
# echo 1 > /sys/block/sdb/device/delete   ==> disable one leg

# lvchange -ay --partial vg1/lv1

# dd if=/dev/zero of=/dev/vg1/lv1 bs=1k count=1000   ===> stuck forever
^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C

The following log repeats while dd command is stuck:

"""
Oct 31 13:39:37 sa kernel: [316278.368081] device-mapper: 
dm-log-userspace: [NZ8pEil9] Request timed out: [9/178486] - retrying
Oct 31 13:39:37 sa kernel: [316278.448069] device-mapper: 
dm-log-userspace: [NZ8pEil9] Request timed out: [15/178497] - retrying
Oct 31 13:39:52 sa kernel: [316293.368081] device-mapper: 
dm-log-userspace: [NZ8pEil9] Request timed out: [9/178498] - retrying
....
"""

Thanks,
Eric
