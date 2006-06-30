Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5U7WMxd018006
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 03:32:22 -0400
Received: from vwclub.ro (lcx.at [213.239.193.148])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5U7WFSh015338
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 03:32:16 -0400
Date: Fri, 30 Jun 2006 09:32:13 +0200
From: Cristian Livadaru <drac3@vwclub.ro>
Subject: Re: [linux-lvm] LVM incredible slow with Kernel 2.6.11
Message-ID: <20060630073213.GI20554@vwclub.ro>
References: <20060628092427.GI20554@vwclub.ro>
	<20060629144606.GG20554@vwclub.ro> <44A3FC9B.3070500@conterra.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44A3FC9B.3070500@conterra.de>
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

On Thu, Jun 29, 2006 at 06:15:23PM +0200, Dieter St?ken wrote:
> Cristian Livadaru wrote:
> > me again ... isn't there anybody that could give ANY hint on what's
> > wrong?
> > 
> > I did some test with dd and the result is terrible!
> > 
> > LVM
> > explendidos:/shared# dd if=/dev/zero of=test1.dd bs=64 count=1000
> > 1000+0 records in
> > 1000+0 records out
> > 64000 bytes transferred in 20.019969 seconds (3197 bytes/sec)
> 
> seems the data gets written synchronously without any buffering.
> Thus each write is delayed until the data is really written to
> disk. For a 5400 RPM disk you get 90 transactions per seconds.
> This gives about 10 seconds for 1000 chunks. "bs=64" means
> 64 bytes! so each sector will be written multiple times.
> So may be the system even reads in each sector again each time
> before writing it, thus it takes two turns which gives 20 seconds.
> 
> Unfortunately I can't tell why this happens :-(
> 
> May be "direct IO" takes place (like for oflags=direct),

where could I check this? 

> or this is some configuration option of LVM, i don't know about.
> Try using "hdparm" to see, if DMA etc. is enabled. Have a look

no matter how it's set, the result is always the same.
I could'nt find any usefull information in any logfiles, I enabled LVM
verbose mode and debug output but still nothing was found.

> into /var/log/messages or use "dmesg" for nay hardware problems.
> I recently discovered the "blockdev" command. Do you use any special
I have read in some posts on the mailinglist about blockdev but not
quite sure on how I could use it to solve my problem.

> ext3 feature? You may try "tune2fs -o journal_data_writeback".
> If you don't have relevant data on the LV, you may try to write
> to the LV device directly. Is it slow for read, too? try "hdparm -t"

hdparm -t /dev/share/sharevg

/dev/share/sharevg:
 Timing buffered disk reads:  146 MB in  3.01 seconds =  48.50 MB/sec
 HDIO_DRIVE_CMD(null) (wait for flush complete) failed: Inappropriate
 ioctl for device

I tried tune2fs but it didn't get any better.
I also dont understand why with kernel 2.4 I get about 5mb/s instead of
the 350kb/s 
not that 5mb would be great but still, much better then 350kb/s

Maybee I should mention that this is some "want-to-be" raid controler
that was on the mainboard.

0000:00:0e.0 RAID bus controller: Triones Technologies, Inc. HPT374 (rev
07)


Cris
 
