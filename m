Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1H0X8i28634
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 19:33:08 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1H0X8b28007
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 19:33:08 -0500
Message-ID: <40316114.30207@backtobasicsmgmt.com>
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
Date: Mon Feb 16 19:32:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: Miquel van Smoorenburg <miquels@cistron.nl>

Jens Axboe wrote:
 > On Mon, Feb 16 2004, Miquel van Smoorenburg wrote:
 >
 >>Hello,
 >>
 >>	as you might have seen from the linux-kernel mailinglist
 >>I have been testing for months now with a fileserver set up to
 >>use XFS over LVM2 on a 3ware RAID5 controller.
 >>

I too have been fighting lower-than-expected performance with this 
identical combination, other than using a P4 2.8GHz instead of 3.0GHz, 
and 1GB RAM instead of 2GB. My 3ware 8506-8 has six Seagate Barracuda 
SATA drives behind it, which are very fast on their own :-) Try as I 
might, with the 2.6 kernel I have not been able to generate a bonnie++ 
or iozone run that provided performance better than a single disk, even 
with the 3ware card in JBOD, RAID-0 or RAID-1 mode. I had been 
conversing with 3ware about it, but to no real effect given than they 
don't support 2.6 yet.

 >>By fiddling about today I just found that changing
 >>/sys/block/sda/queue/nr_requests from 128 to something above
 >>the queue depth of the 3ware controller (256 doesn't work,
 >>384 and up do) also fixes the problem.

I will try this as well this evening and report my results.
