Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SJ8atP001459
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 14:08:36 -0500
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SJ8G02002780
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 14:08:16 -0500
Received: from IWDUBCORMSG001.sci.local (iwdubcormsg001.sci.local
	[10.105.142.31])
	by boamail2.stercomm.com (Postfix) with ESMTP id 4F36F33CE2
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 14:09:04 -0500 (EST)
Subject: Re: [linux-lvm] LVM limits?
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <200801281801.m0SI10Xi010185@beta.mvs.co.il>
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
Content-Transfer-Encoding: 7bit
Date: Mon, 28 Jan 2008 13:08:14 -0600
Message-Id: <1201547294.30560.29.camel@behemoth.csg.stercomm.com>
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

On Mon, 2008-01-28 at 20:01 +0200, Ehud Karni wrote:
> On Mon, 28 Jan 2008 11:38:14 Chris Cox wrote:
> >
> > Ok.  But it's really impractical to have large multi-terabyte
> > single filesystem today.  What are you wanting to do?  Ever fsck a
> > 2TB filesystem?  Consider yourself warned.
> 
> Just last night I ran fsck on my home 1.5 TB file server (it is software
> RAID-5 - mdadm, built on 7200 RPM, 500GB SATA2 x 4, ext3 without LVM).
> It has went 191 days without fsck so when I booted the machine (I just
> upgraded to 2.6.18-53.1.6.el5) it did the fsck automaticaly.
> 
> It took less then 90 minutes.

:)  It can vary.  I've seen it take days (on infrastructure much
better than what you have).
