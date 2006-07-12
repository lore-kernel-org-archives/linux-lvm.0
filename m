Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6C969om023107
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 05:06:09 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6C9662q014636
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 05:06:06 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1G0afH-0001IE-W5
	for linux-lvm@redhat.com; Wed, 12 Jul 2006 11:05:52 +0200
Received: from servers.it.uni-wh.de ([62.206.172.225])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:05:51 +0200
Received: from cp by servers.it.uni-wh.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:05:51 +0200
From: Christoph Peus <cp@uni-wh.de>
Date: Wed, 12 Jul 2006 11:05:34 +0200
Message-ID: <e92e0t$uit$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Cannot create more than one snapshot per origin
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

when I try to create more than one snapshot of the same origin, the 
second and following snapshots are marked "inactive" and report 
Input/output errors all the time:

Berfore the first snapshot:

lunkwill pri # lvscan
   ACTIVE            '/dev/export/lvol0' [1.34 TB] inherit
   ACTIVE            '/dev/export/lvol1' [800.00 GB] inherit

lunkwill pri # lvcreate -s -L20G -n test /dev/export/lvol0
   Logical volume "test" created
lunkwill pri # lvscan
   ACTIVE   Original '/dev/export/lvol0' [1.34 TB] inherit
   ACTIVE            '/dev/export/lvol1' [800.00 GB] inherit
   ACTIVE   Snapshot '/dev/export/test' [20.00 GB] inherit

Everything's fine so far. Now the trouble starts:


lunkwill pri # lvcreate -s -L20G -n test2 /dev/export/lvol0
   Logical volume "test2" created
lunkwill pri # lvscan
   /dev/export/test2: read failed after 0 of 4096 at 1473844805632: 
Input/output error
   /dev/export/test2: read failed after 0 of 4096 at 0: Input/output error
   inactive Original '/dev/export/lvol0' [1.34 TB] inherit
   ACTIVE            '/dev/export/lvol1' [800.00 GB] inherit
   ACTIVE   Snapshot '/dev/export/test' [20.00 GB] inherit
   inactive Snapshot '/dev/export/test2' [20.00 GB] inherit


I'm using an xfs filesystem on /dev/export/lvol0 and the following 
software versions:

kernel: vanilla 2.6.15.1
device-mapper: 1.02.07
lvm2: 2.02.05


Thanks for your help in advance!

Regards
Christoph
