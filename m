Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0KE4vO25040
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 09:04:57 -0500
Received: from kumc-smtpout.kumc.edu (kumc-smtpout.kumc.edu [169.147.4.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0KE4uW7001367
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 09:04:57 -0500
Message-Id: <s1ef6623.067@kumc-smtpout.kumc.edu>
Date: Thu, 20 Jan 2005 08:04:41 -0600
From: "Dustin Decker" <ddecker@kumc.edu>
Subject: Re: [linux-lvm] LVM + SAN Behavior
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

>>> <gilles.massen@restena.lu> 01/20/05 12:26 AM >>>
[snip]

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

>>> You could make the partition larger, but the only way I found was
to delete the partition, and recreate it with another last sector (this
is 
not for weak hearts) and even then I'm not sure that you can resize
your PV easily.

>>> Erm...sorry...I reread your posting: it seems you made the whole
disk, not a partition, a PV? The you would need 'pvresize'. However when
running it, it says: "command not implemented yet" (LVM2, latest
release)

Gilles,
Thanks for the input.  In hindsight, it certainly appears that had I
created an 850GB "partition" on my SAN allotment, and then made a pv of
it, I would have been just fine and dandy.

Lessons learned :)
I'll eventually get around to ensuring whoever maintains the HOW-TO for
LVM addresses this caveat for those who follow us.

Thanks!
Dustin
