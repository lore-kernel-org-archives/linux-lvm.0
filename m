Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6M78Rhp019935
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 08:08:27 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BnXgp-0002xH-AR
	for linux-lvm@redhat.com; Thu, 22 Jul 2004 08:08:27 +0100
Date: Thu, 22 Jul 2004 08:08:27 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] "__you_cannot_kmalloc_that_much" undefined
Message-ID: <20040722070827.GB10840@tykepenguin.com>
References: <5.1.0.14.2.20040721131110.038d67d8@pop.ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20040721131110.038d67d8@pop.ncsa.uiuc.edu>
Sender: Patrick <patrick@tykepenguin.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 21, 2004 at 01:13:25PM -0500, Guochun Shi wrote:
> hi,
> 
> I got a warning when compiling the patched 2.6.7 kernel:
> 
> *** Warning: "__you_cannot_kmalloc_that_much" [fs/gfs_locking/lock_gulm/lock_gulm.ko] undefined!
> 
> not a big issue since I can use dlm, but still want to know how I can remove this warning. 


Yes I hit this. here's a very crude patch that will at least get you going for
testing purposes.


Index: gfs-kernel/src/gulm/load_info.c
===================================================================
RCS file: /cvs/cluster/cluster/gfs-kernel/src/gulm/load_info.c,v
retrieving revision 1.2
diff -u -r1.2 load_info.c
--- gfs-kernel/src/gulm/load_info.c     12 Jul 2004 17:07:00 -0000      1.2
+++ gfs-kernel/src/gulm/load_info.c     22 Jul 2004 07:07:34 -0000
@@ -40,7 +40,7 @@
        init_MUTEX (&lt->sender);
        init_completion (&lt->startup);
        atomic_set (&lt->locks_pending, 0);
-       lt->hashbuckets = 8191;
+       lt->hashbuckets = 100;
        lt->hshlk = kmalloc (sizeof (spinlock_t) * lt->hashbuckets, GFP_KERNEL);
        if (lt->hshlk == NULL)
                return -ENOMEM;

patrick
