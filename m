Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8EI5Frq013865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 14:05:15 -0400
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mx1.redhat.com (Postfix) with ESMTPS id 7604DDB3
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 18:05:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8EI5DQX019236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 11:05:13 -0700 (PDT)
Message-ID: <55F70C58.5010205@windriver.com>
Date: Mon, 14 Sep 2015 12:05:12 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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

I'm running a 3.10 kernel with LVM 2.02.95.

I'm running into a problem where activating snapshots can take quite a long 
time, roughly one minute per 25GB of delta between the snapshot and the origin 
volume.  (See below for my test procedure.)

I realize that my kernel/LVM aren't exactly bleeding edge, and I wondering 
whether more recent versions have done anything to speed up the activation 
process (like maybe making it more lazy-loaded rather than reading in a bunch of 
data up-front).

If anyone is aware of such improvements, I'd appreciate it if you could point me 
at the appropriate changes.


For those that are interested, the test that I did was as follows:

lvcreate -L100G  -n test1 vg
lvcreate -L 100G -s -n test1snapshot /dev/vg/test1
dd if=/dev/zero of=/dev/cinder-volumes/test1snapshot bs=1M count=95000
lvchange -an  /dev/cinder-volumes/test1snapshot
time lvchange -ay  /dev/cinder-volumes/test1snapshot

The final "lvchange" command took about 4m22s.  This works out to 362MB/sec, 
which is almost exactly the speed I got doing a "dd" from the volume to /dev/null.

Thanks,
Chris
