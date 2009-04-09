Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n39Dfghv013903
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:41:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n39DfORR022722
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:41:24 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n39DfDZn013671
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:41:13 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n39Df3BU005363
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:41:03 -0400
Date: Thu, 9 Apr 2009 09:41:03 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
In-Reply-To: <49DDD499.50303@Calva.COM>
Message-ID: <Pine.LNX.4.64.0904090930160.5240@bmsred.bmsi.com>
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
	<49DDD499.50303@Calva.COM>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 9 Apr 2009, John Hughes wrote:

> > So if u need performance a "Software RAID Solution" would always be a bad
> > choice.
> Why?  Do you have any benchmarks that show that software raid is slower than
> hardware raid?

For RAID 1 and 0, software RAID is as fast or faster in my experience.
If you think about it, the software is just coordinating DMA transfers,
no actual processing.  It is RAID 5 and similar configurations that benefit
from hardware implementation.  My experience has been with the 'md' driver
and AIX LVM, not with Linux LVM mirroring/striping, however.

A big drawback of controller based hardware RAID is the requirement
to have same sized drives (or waste the difference).  With software RAID (and
with high end sub-system based hardware RAID), you can mix a variety of drive
sizes.  I typically use RAID 1, and I like to expand storage by just 
adding a drive in the size du jour (500G today, 1T tomorrow), and doing
a few pvmoves to expand mirrored space.  (And you can also move md
mirrors while in operation with judicious use of mdadm -a and mdadm -f,
the tricky part being no changes to a partition table while a partition is
in use).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
