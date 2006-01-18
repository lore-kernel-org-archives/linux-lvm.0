Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0IMbS116064
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 17:37:28 -0500
Received: from smtp2.linkline.com (smtp2.linkline.com [64.30.215.157])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0IMbPRb027040
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 17:37:25 -0500
Received: from pride (64-30-200-38.dsl.linkline.com [64.30.200.38])
	by smtp2.linkline.com (Postfix) with SMTP id 02587323
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 14:37:22 -0800 (PST)
From: Alan Wise <lists@tnotd.net>
Date: Wed, 18 Jan 2006 14:37:25 -0800
Message-ID: <ac8rs15d9td9ke80r4mt1d2i294n99id4k@4ax.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "vg doesn't exist" after removing a pv
Reply-To: lists@tnotd.net,
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
To: linux-lvm@redhat.com


I just attempted to remove two physical volumes from one of my volume
groups.  Since I very recently added them, I knew (or thought I knew)
that there was no data on them so I attempted to to remove them using
"pvremove /dev/hda8 /dev/hdb1".

The program complained, but suggested I try using the "-ff" option,
which I promptly did, without considering the consequences of my
actions (or backing up the data).

Now I'm getting the following errors:

Couldn't find device with uuid "..."
Couldn't find all physical volumes for volume group my_vg
Volume group "my_vg" doesn't exist

Unfortunately, being rather new to LVM, I didn't know about
vgcfgbackup until I started researching how to fix my problem, so I
can't go that route.

Is there any way I can recover my data.  Any help would be MUCH
appreciated.

Alan
