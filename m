Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6TGfra14093
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 12:41:53 -0400
Received: from mail.ecdl.hut.fi (mail.ecdl.hut.fi [130.233.167.1])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6TGflXn024705
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 12:41:47 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ecdl.hut.fi (Postfix) with ESMTP id 26F5B78016
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 19:41:41 +0300 (EEST)
Received: from zaphod.ecdl.hut.fi (zaphod.ecdl.hut.fi [130.233.167.69])
	by mail.ecdl.hut.fi (Postfix) with ESMTP id 747A07800D
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 19:41:39 +0300 (EEST)
From: Mika =?iso-8859-1?q?L=E4nsirinne?= <Mika.Lansirinne@iki.fi>
Date: Thu, 29 Jul 2004 19:41:53 +0300
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200407291941.53919.Mika.Lansirinne@iki.fi>
Subject: [linux-lvm] old md-partitions to pvs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello all,

I converted couple of md partitions to pvs. The reason for this was to remove 
unnecessary md layer (raid0) and to replace it with striped lvs.

When I had stopped the md and edited the partition types in the partition 
tables (and rebooted) I tried to pvcreate those, but it told me that the 
device was not found.

I found out that vgscan or pvscan (or whatever which creates the .cache file) 
skipped those partitions because it thought they still are part of a md.

vgscan -vvv:
...
      Getting size of /dev/hda3
        Opened /dev/hda3
        /dev/hda3: Skipping md component device
        Closed /dev/hda3
...

and same for hdb3 also.


It seems that it founds MD_SB_MAGIC in those partitions 
(lib/filters/filter-md.c, lines 54-62).


I have my system working now by hand editing the /etc/lvm/.cache and to never 
vgscan again :). The pvcreate and all the rest works now.


The question is that how could I get rid of those md signatures? pvcreate 
obviously didn't do it, because it complained them in the first place. Of 
course, I could have wiped the whole partitions with zeros in the beginning 
(a long time), but now I already have a vg and several lvs and filesystems 
there. Maybe I should write the filesystems full temporarily? Would that even 
help?


lvm tools version used is 2.00.15, kernel 2.6.7 and the system is fedora 2.



-Mika
