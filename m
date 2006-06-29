Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TGFosN002525
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 12:15:50 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5TGFhjn002990
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 12:15:44 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 85ECC1F4217
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 18:15:37 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24965-10 for <linux-lvm@redhat.com>;
	Thu, 29 Jun 2006 18:15:25 +0200 (CEST)
Message-ID: <44A3FC9B.3070500@conterra.de>
Date: Thu, 29 Jun 2006 18:15:23 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM incredible slow with Kernel 2.6.11
References: <20060628092427.GI20554@vwclub.ro>
	<20060629144606.GG20554@vwclub.ro>
In-Reply-To: <20060629144606.GG20554@vwclub.ro>
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

Cristian Livadaru wrote:
> me again ... isn't there anybody that could give ANY hint on what's
> wrong?
> 
> I did some test with dd and the result is terrible!
> 
> LVM
> explendidos:/shared# dd if=/dev/zero of=test1.dd bs=64 count=1000
> 1000+0 records in
> 1000+0 records out
> 64000 bytes transferred in 20.019969 seconds (3197 bytes/sec)

seems the data gets written synchronously without any buffering.
Thus each write is delayed until the data is really written to
disk. For a 5400 RPM disk you get 90 transactions per seconds.
This gives about 10 seconds for 1000 chunks. "bs=64" means
64 bytes! so each sector will be written multiple times.
So may be the system even reads in each sector again each time
before writing it, thus it takes two turns which gives 20 seconds.

Unfortunately I can't tell why this happens :-(

May be "direct IO" takes place (like for oflags=direct),
or this is some configuration option of LVM, i don't know about.
Try using "hdparm" to see, if DMA etc. is enabled. Have a look
into /var/log/messages or use "dmesg" for nay hardware problems.
I recently discovered the "blockdev" command. Do you use any special
ext3 feature? You may try "tune2fs -o journal_data_writeback".
If you don't have relevant data on the LV, you may try to write
to the LV device directly. Is it slow for read, too? try "hdparm -t"

Dieter.
