Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AF5l030690
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:05:47 -0400
Received: from ms-smtp-04.tampabay.rr.com (ms-smtp-04-smtplb.tampabay.rr.com
	[65.32.5.134])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5AF5fXn009239
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:05:41 -0400
Received: from wakki.stuartrharper.net (182-3.200-68.tampabay.rr.com
	[68.200.3.182])
	by ms-smtp-04.tampabay.rr.com (8.12.10/8.12.7) with ESMTP id
	i5AF5c7t012429
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:05:39 -0400 (EDT)
From: Stuart Harper <StuartHarper@tampabay.rr.com>
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
Date: Thu, 10 Jun 2004 11:05:47 -0400
References: <40C86F52.4090500@dgreaves.com>
In-Reply-To: <40C86F52.4090500@dgreaves.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200406101105.47606.StuartHarper@tampabay.rr.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

While doing backups of my LVM2 drive, I've found that setting the DD block 
size to 4096 greatly improved my performance. Formerly, DDs on my 240G LVM 
were taking 23hrs to complete with a block size of 512 or 1024. The same 
volume now takes less than 2 hours with a block size of 4096. Large numbers 
did not seem to increase DD speed.

On Thursday 10 June 2004 10:25 am, David Greaves wrote:
> 65Mb/s on the raid5 device
> 44Mb/s on the lv
>
> Is this expected?
>
> Kernel 2.6.6
>
> representative dd's:
>
> cu:/huge/editing/tmp# time dd if=/dev/video_vg/video_lv of=/dev/null
> bs=1024k count=4k
> David
