Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k47BHYf1017464
	for <linux-lvm@redhat.com>; Sun, 7 May 2006 07:17:34 -0400
Received: from deepthought.kylesfamily.com (cust1810.qld01.dataco.com.au
	[202.63.51.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k47BHRUD001923
	for <linux-lvm@redhat.com>; Sun, 7 May 2006 07:17:28 -0400
Received: from deepthought.kylesfamily.com (localhost.localdomain [127.0.0.1])
	by deepthought.kylesfamily.com (8.13.6/8.13.6) with ESMTP id
	k47BHLbX010323
	for <linux-lvm@redhat.com>; Sun, 7 May 2006 21:17:21 +1000
Received: (from jay@localhost)
	by deepthought.kylesfamily.com (8.13.6/8.13.6/Submit) id k47BHKaZ010322
	for linux-lvm@redhat.com; Sun, 7 May 2006 21:17:20 +1000
Date: Sun, 7 May 2006 21:17:20 +1000
From: Jason Wilson <jay@kylesfamily.com>
Message-ID: <20060507111720.GA10160@deepthought.kylesfamily.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Cant remove a locked volume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


All,

I have managed to get one of my systems into a bit of a mess. It a Fedora
Core 5 running with recent patches.

During an attempted pvmove from one physical volume to another I had my
server crash (not sure exactly what, may have been a power fluctuation).

When attempting to reboot the server it would fail to mount the root
filesystem. After much messing around I finally determined that it was
failing to mount as my new disk was on a SATA card I had just added and
the initrd did not have the relevant driver loaded.

In sorting this out I rolled back my lvm configuration to a version
prior to me attempting the pvmove.

The problem I now has is when I try and remove one the volumes that was
in the middle of the pvmove it says the volume is locked:
    # lvremove /dev/VolGroup00/swap
    Can't remove locked LV swap

A lvs shows:
    # lvs /dev/VolGroup00/swap
    LV   VG         Attr   LSize Origin Snap%  Move Log Copy% 
    swap VolGroup00 -wI-a- 2.00G 

From the man pages it says that the capital 'I' means the volume is
locked.

I cannot find anywhere to remove this lock. I have tried changing the
allocation, this works, but the lock persists.

In the lgcfgbackup file I can see:
    swap {
	    id = "6IBwtq-sw2f-4Bss-A7W5-D1J2-XiAR-XHSlnJ"
	    status = ["READ", "WRITE", "VISIBLE", "LOCKED"]
	    segment_count = 1

	    segment1 {
		    start_extent = 0
		    extent_count = 64       # 2 Gigabytes

		    type = "striped"
		    stripe_count = 1        # linear

		    stripes = [
			    "pv0", 3509
		    ]
	    }
    }

Is there any way I can remove these locks? Can I edit the file and
manually reload the config with vgcfgrestore? Will this other
side-affects?

Your help is appreciated.

Jason
