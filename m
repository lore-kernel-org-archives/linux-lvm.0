Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0LBkfO18992
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 06:46:41 -0500
Received: from crusaders.powertech.no
	(IDENT:fDHMKgr46UvzGcOS/xAqBBVkc7yqvxz8@www2.gathering.org
	[195.159.31.10])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j0LBkZoP015874
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 06:46:35 -0500
Date: Fri, 21 Jan 2005 12:40:57 +0100
From: Per Kristiansen <per@gathering.org>
Message-ID: <20050121114057.GA4961@gathering.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Issues with large LVM's ?
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

I've been following this list for a while now.
running LVM on home systems and smaller production systems.

But now I'm about to deploy LVM on a slightly larger scale.

I'm currently planning to merge three storage systems.

-Eon Store A16U-G2421 (1.6TB)
-StorCase DS560 (1.5TB)
-SGI TP9100 (1.4TB)

Still waiting for confirmation on the usability of the TP9100 on linux thou,
so it's more of a wish that a fact :)

From past experience I'm leaning toward reiserfs, but I'm looking for 
advice from people that have been playing with large filesystems and LVM

So..Am I courting disaster here ? :)



-- 
Per Kristiansen
per@gathering.org
