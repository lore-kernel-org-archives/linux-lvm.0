Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k363pdPq025037
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 23:51:39 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k363pZqV031061
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 23:51:36 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k363paUR012158
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 05:51:37 +0200
Subject: Re: [linux-lvm] Bad disk removal
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <44340F46.5040000@volved.com>
References: <44340F46.5040000@volved.com>
Date: Thu, 06 Apr 2006 05:51:35 +0200
Message-Id: <1144295496.8145.2.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2006-04-05 at 14:41 -0400, Barnaby Claydon wrote:
> Hey all,
> 
> So after lots of scans and log review, turns out 1 of the 8 IDE disks in 
> my LVM is bad. (I know, IDE, yeahyeah...)

When this happened to me, I got a replacement drive as large as that
drive, and used dd to copy the PV data bit-by-bit to the new disk, and
then zeroed the sectors corresponding to the old bad sectors. It worked
fairly well, but the bad sectors were probably only file data blocks for
me.

As far as I managed to find out, pvmove will not handle bad sectors at
all, and abort when it finds any. It would be great if anyone could
correct me on that, though...

Fredrik Tolf
