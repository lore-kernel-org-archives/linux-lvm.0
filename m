Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6SJ7oV28560
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 15:07:50 -0400
Received: from mail.linuxcare.com (mail.levanta.com [69.36.243.36])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6SJ7kuQ016155
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 15:07:47 -0400
Received: from [10.1.1.183] (cisco-6509.levanta.com [69.36.253.2] (may be
	forged))
	by mail.linuxcare.com (8.12.11/8.12.8) with ESMTP id j6SJ1CoW016792
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 12:01:12 -0700
Message-ID: <42E92D7E.5090900@levanta.com>
Date: Thu, 28 Jul 2005 12:09:50 -0700
From: Nathaniel Stahl <nrs@levanta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How do you create large numbers of LVs? (In the 1000s)
 Is it even possible?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


We'd like to be able to create a large number of LVs (potentially 
numbering in the low thousands).  I get failure after LV 226 or so, 
though - "VG VolGroup01 metadata writing failed".

RedHat claims this should be possible with LVM2 on the following web page:

http://www.redhat.com/magazine/009jul05/features/lvm2/

I admit to being a little suprised at the 2^32 max LV claim - I was 
figuring 2^20 as the theoretical max given 2.6's 32 bit device numbering 
scheme (20 bits for minor, 12 bits for major).

The LVM2 code, at least version 2.00.25 as distributed in FC3, appears 
to have a check that the minor number is strictly less than 256.  
Removing this check allows for the creation of working LVs using minors 
greater than 256, but LV creation fails with the error "VG VolGroup01 
metadata writing failed" creating the 227th LV.  Even with the minor 
limit in place - I can't create more than 226 LVs.

Is there a patch that allows this limit to be broken?  Should I be using 
a newer version of the tools?  If not currently possible, is this 
something that will be in the near future?

Thanks for any help/advice you can give.

-Nate Stahl
