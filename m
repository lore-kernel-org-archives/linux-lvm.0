Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m420cuTQ020544
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:38:56 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m420ckAV026681
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:38:46 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m420cfKB011324
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:38:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m420cfnH026767
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:38:41 -0400
Date: Thu, 1 May 2008 20:38:41 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481A574B.50705@verizon.net>
Message-ID: <Pine.LNX.4.44.0805012035420.26700-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 1 May 2008, Gerry Reno wrote:

> I started looking at this and then found that Fedora appears to have the 
> device mapper and snapshot support as modules:
> 
> /lib/modules/2.6.20-1.2952.fc6xen/kernel/drivers/md/dm-snapshot.ko
> /lib/modules/2.6.20-1.2952.fc6xen/kernel/drivers/md/dm-mod.ko
> 
> So what is going to happen if you have a snapshot of root partition 
> active and then a reboot happens (sound familiar?).  The kernel on 
> restart can no longer read device mapper or snapshot module or root 
> partition and it will panic and who knows what else will happen.  
> Corruption maybe???

The modules are copied to initrd by mkinitrd, and loaded from there.  They
are treated the same as device drivers for the disk containing
the root filesystem.   Mkinitrd can also copy md drivers to initrd
so that root can be on a software raid partition.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
