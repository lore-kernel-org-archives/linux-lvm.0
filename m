Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AFQ5006479
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:26:05 -0400
Received: from mailgate2.Cadence.COM (mailgate2.Cadence.COM [158.140.2.31])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5AFQ3i5026623
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:26:04 -0400
Received: from mailhub.Cadence.COM (mailhub.Cadence.COM [158.140.128.33])
	by mailgate2.Cadence.COM (8.9.3/8.9.3) with ESMTP id IAA26264
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 08:26:03 -0700 (PDT)
Received: from d158140025182.cadence.com (localhost [127.0.0.1])
	by mailhub.Cadence.COM (8.12.8/8.8.5) with ESMTP id i5AFQ3gR008366
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 08:26:03 -0700 (PDT)
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <200406101105.47606.StuartHarper@tampabay.rr.com>
References: <40C86F52.4090500@dgreaves.com>
	<200406101105.47606.StuartHarper@tampabay.rr.com>
Message-Id: <1086881485.3542.2357.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Date: Thu, 10 Jun 2004 08:31:25 -0700
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

try bs=64k, even better...

On Thu, 2004-06-10 at 08:05, Stuart Harper wrote:
> While doing backups of my LVM2 drive, I've found that setting the DD block 
> size to 4096 greatly improved my performance. Formerly, DDs on my 240G LVM 
> were taking 23hrs to complete with a block size of 512 or 1024. The same 
> volume now takes less than 2 hours with a block size of 4096. Large numbers 
> did not seem to increase DD speed.
> 
> On Thursday 10 June 2004 10:25 am, David Greaves wrote:
> > 65Mb/s on the raid5 device
> > 44Mb/s on the lv
> >
> > Is this expected?
> >
> > Kernel 2.6.6
> >
> > representative dd's:
> >
> > cu:/huge/editing/tmp# time dd if=/dev/video_vg/video_lv of=/dev/null
> > bs=1024k count=4k
> > David
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
