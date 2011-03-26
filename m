Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q7nTVR005205
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 03:49:30 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q7nOxf010916
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 03:49:25 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1Q3OFP-0007j4-MJ
	for linux-lvm@redhat.com; Sat, 26 Mar 2011 00:49:23 -0700
Date: Sat, 26 Mar 2011 02:49:22 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110326024922.19c9382d@bettercgi.com>
In-Reply-To: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Sat, 26 Mar 2011 00:24:56 -0400 (EDT)
"Stuart D. Gathman" <stuart@bmsi.com> wrote:

> Assuming my theory is correct, the morals would be:
...
> 2) make sure important LVs do not span multiple PVs (except for LVM
>     mirroring) - you could be unhappy in the event of a system crash.

   I don't believe that multiple PVs necesarily makes a 
difference. On a single PV, there is no guarantee that 
writes make it to disk during a power failure, what order
they make it in, or even if a write is correct while voltage
is dropping. The drive itself could reorder a write (NCQ), 
the raid card could do so, etc. One might say the moral
of the story is "don't run important production servers 
on spotty power systems without an effective UPS".  

  Someone mentioned journaling. Journaling does not of
course guarantee data consistency, only makes meta data, 
more likely to be consistent, so regardless when you 
undervolt a drive during power failure something is subject
to go wrong, aside from the more obvious effects of even
an instant power cut while writing a block.  Moral - 
don't yank the power is the data is important.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
