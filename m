Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7LEBD3W005058
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 10:11:13 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7LEBCbo006499
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 10:11:12 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7LEB6bv002869
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 10:11:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7LEB69m011301
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 10:11:06 -0400
Date: Tue, 21 Aug 2007 10:11:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
In-Reply-To: <20070821065251.GB16272@percy.comedia.it>
Message-ID: <Pine.LNX.4.44.0708211003560.11224-100000@bmsred.bmsi.com>
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

On Tue, 21 Aug 2007, Luca Berra wrote:

> >> False. md uses bitmaps to avoid this.
> >
> >Ok, I just tested this with Centos-5.0, kernel-2.6.18-8.1.8.el5.
> >I shutdown with md1 50% resynced, and when it boots, it starts over
> >at the beginning.  Maybe we are talking about different things, but
> >it is a major annoyance that it restarts the sync from the beginning
> >if it misses just one update (e.g. unexpected power failure or reboot).
> >
> did you add the bitmap to your md array?

I installed Centos5 from the CDs on raid1 devices.  I do see a bitmap
option in the map page for mdadm.  How do I check whether Centos5 install
neglected to activate it?  Is there any way to add it after the install?
(LVM is on md1 and root,swap are on LVM.)  If not, what would be the
install procedure to actually use a bitmap?  Note: special restrictions
on the boot partition are acceptable.  Special restrictions on the root
partition/LV are not.

# mdadm --examine /dev/hde3
/dev/hde3:
          Magic : a92b4efc
        Version : 00.90.00
           UUID : 14c44605:1e3381da:9833dc4f:b4bdc3c0
  Creation Time : Mon Aug 20 15:13:47 2007
     Raid Level : raid1
    Device Size : 78059712 (74.44 GiB 79.93 GB)
     Array Size : 78059712 (74.44 GiB 79.93 GB)
   Raid Devices : 2
  Total Devices : 2
Preferred Minor : 1

    Update Time : Tue Aug 21 10:06:36 2007
          State : clean
 Active Devices : 2
Working Devices : 2
 Failed Devices : 0
  Spare Devices : 0
       Checksum : bb50a9f9 - correct
         Events : 0.8


      Number   Major   Minor   RaidDevice State
this     0      33        3        0      active sync   /dev/hde3

   0     0      33        3        0      active sync   /dev/hde3
   1     1      34        3        1      active sync   /dev/hdg3

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
