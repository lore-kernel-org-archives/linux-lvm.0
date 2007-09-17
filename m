Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l8HLXJNd012097
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2007 17:33:19 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IXODX-0005ZZ-Lb
	for linux-lvm@redhat.com; Mon, 17 Sep 2007 22:33:19 +0100
Date: Mon, 17 Sep 2007 22:33:19 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm HA problem with  file descriptor left open
Message-ID: <20070917213319.GV18444@agk.fab.redhat.com>
References: <46E4F110.6040003@ezpear.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46E4F110.6040003@ezpear.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 10, 2007 at 03:24:00PM +0800, hans wrote:
> File descriptor 5 left open File descriptor 6 left open File descriptor
> 7 left open File descriptor 8 left open File descriptor 9 left open File
> descriptor 10 left open File descriptor 11 left open File descriptor 12
> left open 0 logical volume(s) in volume group "vg0_sites" now active
> Is it possible to force LVM
> to close descriptors?
 
Those are only harmless warnings - LVM2 does close the file descriptors.
It is only fatal under some selinux configurations.

Alasdair
-- 
agk@redhat.com
