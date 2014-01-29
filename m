Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0TLXqQX018054
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 16:33:52 -0500
Received: from mx21lb.world4you.com (mx21lb.world4you.com [81.19.149.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0TLXmqO027295
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 16:33:49 -0500
Received: from [80.120.180.154] (helo=robbe.control.local)
	by mx21lb.world4you.com with esmtpa (Exim 4.77)
	(envelope-from <hans@hanswkraus.com>) id 1W8clX-0006Vz-0G
	for linux-lvm@redhat.com; Wed, 29 Jan 2014 22:33:47 +0100
Received: from [192.168.4.102] (unknown [192.168.4.102])
	by robbe.control.local (Postfix) with ESMTP id 9D591342E4B
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 22:33:46 +0100 (CET)
Message-ID: <52E973A9.8010008@hanswkraus.com>
Date: Wed, 29 Jan 2014 22:33:29 +0100
From: Hans Kraus <hans@hanswkraus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to remove vg + lv?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

A HD in my lvm2 array got flakey and I wanted to be on the safe side
and move its contents with pvmove.

During that operation the HD died completely, even a reboot didn't
revive it anymore. Now I tried to remove the vg and lv to be able to
set it up again (its for backup purposes, therefore the contents are
reproducible). I got the results:

root@elefant:/# pvmove --abort
   Couldn't find device with uuid TLYwDv-aNDB-TM6g-oLTf-pjdj-TN4E-Yr8KHQ.
   Couldn't find device with uuid CP2BAI-oZCw-woFK-MfLN-jAFD-66mj-aCLz3S.
   Cannot change VG vg_new while PVs are missing.
   Consider vgreduce --removemissing.

root@elefant:/# vgreduce --removemissing --force vg_new
   Couldn't find device with uuid TLYwDv-aNDB-TM6g-oLTf-pjdj-TN4E-Yr8KHQ.
   Couldn't find device with uuid CP2BAI-oZCw-woFK-MfLN-jAFD-66mj-aCLz3S.
   Removing partial LV lv_new.
   Can't remove locked LV lv_new

root@elefant:/# vgremove vg_new
   Couldn't find device with uuid TLYwDv-aNDB-TM6g-oLTf-pjdj-TN4E-Yr8KHQ.
   Couldn't find device with uuid CP2BAI-oZCw-woFK-MfLN-jAFD-66mj-aCLz3S.
   WARNING: 2 physical volumes are currently missing from the system.
Do you really want to remove volume group "vg_new" containing 1 logical 
volumes? [y/n]: y
   Can't remove locked LV lv_new

Your help is appreciated very much,
Hans
