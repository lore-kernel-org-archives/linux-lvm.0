Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0JM67O31820
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 17:06:07 -0500
Received: from kumc-smtpout.kumc.edu (kumc-smtpout.kumc.edu [169.147.4.11])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0JM61fa028906
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 17:06:01 -0500
Message-Id: <s1ee8563.047@kumc-smtpout.kumc.edu>
Date: Wed, 19 Jan 2005 16:05:45 -0600
From: "Dustin Decker" <ddecker@kumc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM + SAN Behavior
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
To: linux-lvm@redhat.com

Greetings/Salutations,
I have an interesting situation, and am hoping a few extra eyeballs may
help out.  The background:
 
SuSE Linux Enterprise Server 9.0 - fully patched
Root and swap partitions are "local", while we have a SAN which
provides additional storage over fiber.  For all intents and purposes,
the server sees this as a "local" disk as well.
 
Originally a single physical volume (/dev/sda which = 850GB SAN
allotment) was made part of a Logical Volume.  Now I am in need of
extending the logical volume to a full terabyte, which I expected to be
quite easy.  Our SAN administrator happily enlarged the volume we have
on the SAN by an additional 150GB, to equal a full terabyte.  The
server, even post reboot (M$ mentality, agreed), doesn't appear to know
about the additional 150GB.
 
What I am finding is that I cannot simply enlarge a physical partition.
 (Kinda felt like a "duh" moment.)  The real killer in this instance is
that our SAN supports expanding a SAN allotment, but not necessarily
reducing one.  Having asked my SAN admin to make this allotment larger,
I've pretty well made 150GB of disk space out there un-usable, as the
Linux system cannot (to my knowledge thus far) "see" it, and until such
time as the SAN allotment is deleted/recreated, the extra space is in
limbo.  (I.E. if I perform a pvcreate on /dev/sda, I expect now I would
get a full terabyte physical volume, but destroy the 850GB +/- 1% of
data currently there.)
 
I recognize that had the SAN provided us _another_ drive, vice
extending the size of what we had, I could have created a new PV and
extended our logical volume to include that.  Short term, we're hoping
an additional 1TB of space is available on the SAN so we can perform a
snapshot to it, destroy the current logical volume, and run with the
new, etc.
 
Is anyone aware of alternative methods I can use to reclaim this 150GB?
 Or perhaps you may have a better option for cleanup?  Granted, I could
just blow the whole thing away and restore from tape - but that would
take FOREVER.  Not an option on this system, it's already in
production.
 
Many thanks,
 
Dustin


--
Dustin Decker - Project Manager
Department of Information Resources
University of Kansas Medical Center
3901 Rainbow Blvd.
MS3030 - 3030 Taylor
Kansas City, KS 66160

phone: 913.588.0479
pager: 913.917.0212
fax: 913.588.2579
email: ddecker@kumc.edu
