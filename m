Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2BMVjhU015759
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 17:31:45 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2BMVUP5009916
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 17:31:33 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id p2BMVTVQ013071
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 17:31:29 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id p2BMVTA1013070
	for linux-lvm@redhat.com; Fri, 11 Mar 2011 17:31:29 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Fri, 11 Mar 2011 22:31:29 +0000 (UTC)
Message-ID: <ile7s1$nji$3@taco.int.tagonline.com>
References: <ildv9o$nji$2@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove or vgextend: metadata too large for
 circular buffer
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Fri, 11 Mar 2011 20:05:12 +0000, Andrew Gideon wrote:

> However, that time I didn't get the error from lvremove.  This time,
> that is occurring.  So I don't seem to be able to make any space.

I've tried vgcfgrestore, but this too yields:

	metadata too large for circular buffer

I ran some commands with -vvv.  The output which seems to always 
immediately precede the error is:

	Doubling metadata output buffer to 131072

I also noticed that it appears to be looking at /dev/sdi and /dev/sdj.  
These are two PVs I'd tried to add, but where vgextend also issued the 
"too large..." error.  These two PVs do not appear in 'vgdisplay -v'.

[root@backup2 backup]# /usr/sbin/lvremove -d -vvv -f /dev/jetarray004/i2-backup0 2>&1  | egrep 'sd[ij]' 
        Opened /dev/sdi RW O_DIRECT
        /dev/sdi: block size is 4096 bytes
      /dev/sdi: lvm2 label detected
        lvmcache: /dev/sdi: now in VG #orphans_lvm2 (#orphans_lvm2)
        Closed /dev/sdi
        Opened /dev/sdj RW O_DIRECT
        /dev/sdj: block size is 4096 bytes
      /dev/sdj: lvm2 label detected
        lvmcache: /dev/sdj: now in VG #orphans_lvm2 (#orphans_lvm2)
        Closed /dev/sdj
[root@backup2 backup]# 

Is there perhaps some "internal" VG (ie. #orphans_lvm2) that I'd be
able to successfully remove?

Thanks...

	Andrew
