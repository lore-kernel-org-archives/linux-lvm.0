Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1H6lLi09431
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 01:47:21 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1H6lKb16674
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 01:47:20 -0500
Message-ID: <4031B8F2.7080306@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IO scheduler, queue depth, nr_requests
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de>
In-Reply-To: <20040216133047.GA9330@suse.de>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 17 01:46:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: Miquel van Smoorenburg <miquels@cistron.nl>

Jens Axboe wrote:

>>By fiddling about today I just found that changing
>>/sys/block/sda/queue/nr_requests from 128 to something above
>>the queue depth of the 3ware controller (256 doesn't work,
>>384 and up do) also fixes the problem.

OK, I have run three sets of bonnie++ tests on my system. This was using 
the 2.6-bk kernel as of about midnight GMT of 2004-02-17.

System is single P4HT 2.8GHz (SMP kernel), 1GB RAM (4GB highmem 
enabled), Intel 865G chipset, 3ware 8506-8 with six Seagate 160GB 
Barracuda SATA disks in a single RAID-5. bonnie++ tests run on an XFS 
filesystem (made with default mkfs.xfs parameters using a recent 
xfstools package) over a 200GB LVM2 volume (dm-linear).

bonnie++ -r 512 -s 40960 -f -b

Anticipatory scheduler, nr_requests=128 (default)

Seq. Write   53772
Rand. Write  15557
Seq. Read    47730
Rand. Seek   146.5

Anticipatory scheduler, nr_requests=384

Seq. Write   53843
Rand. Write  17595
Seq. Read    44663
Rand. Seek   143.1

Deadline scheduler, nr_requests=384

Seq. Write   54973
Rand. Write  18897
Seq. Read    41476
Rand. Seek   227.3 (!)

Miquel's suggestion has a definite positive effect, except on sequential 
reads. This system still doesn't produce anywhere near the throughput 
I'd expect though, and still doesn't come close to 2.4 numbers either 
(but those are somewhat bogus, as they rely on setting extremely large 
readahead settings). There may be some sort of hardware problem that is 
limiting me to ~60MB/s, although with 2.4 I was able to get sequential 
read numbers around 95MB/s, so I think the hardware is OK.
