Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m32G3VB1029156
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 12:03:31 -0400
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m32G3KnU031987
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 12:03:21 -0400
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail2.stercomm.com (Postfix) with ESMTP id CAD6E33BE1
	for <linux-lvm@redhat.com>; Wed,  2 Apr 2008 12:04:50 -0400 (EDT)
Subject: Re: [linux-lvm] JBOD/NRAID configuration with LVM (repost)
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <3457CA04-F4B0-4D9A-A42C-290A4BCD9844@xgm.de>
References: <3457CA04-F4B0-4D9A-A42C-290A4BCD9844@xgm.de>
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Apr 2008 11:03:18 -0500
Message-Id: <1207152198.30043.17.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2008-04-02 at 17:17 +0200, Florian Lindner wrote:
...snip...
> My idea:
> 
> - Create an JBOD/NRAID of a all harddisks (except the system disk)
> 
> - The JBOD should be flexible when it comes to removing or adding  
> another disk. For example if I want to remove a harddisk I a) unmount  
> the JBOD b) say some kind of tool to free the harddisk to remove as  
> completely as possible c) remove the disk software and hardware wise.
> 
> - If we manage to get our hands on another harddisk it is added to the  
> volume. It there are already more than three disk present it replaces  
> the smallest one.
> 
> - Hot swapping is not important. I don't think it's possible anyway  
> due to the desktop PC hardware
> 
> - If a disk is broken the data loss should be limited to the data that  
> actually is on that disk, the rest of the JBOD should remain  
> functional (it is ok if it is not functional before a manual repair run)
> 
> How far is this possible with LVM? The distribution is Debian etch.

IMHO, the safest way it to segment your data areas into multiple
filesystems rather than (you can use LVM areas, just not leverage
it for what you are asking for) using LVM.

Just my opinion.

By using separate filesystems (possibly separate VGs in your
situation), you can bring a new drive into a VG holding the
partitions you want to migrate to the larger drive (pvmove) and
the after that, remove the old smaller drive from that VG
and ultimately the system.

You might be able to create some kind of mess using contiguous
allocation of LVs ... but I personally would not recommend it
(makes way too many assumptions about things... loses flexibility).
