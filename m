Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7ONwdV23514
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 19:58:39 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7ONwblQ024987
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 19:58:37 -0400
Received: from d216-220-25-36.dynip.modwest.com (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 6381A2575F
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 17:58:22 -0600 (MDT)
Date: Wed, 24 Aug 2005 17:58:21 -0600
From: Michael Loftis <mloftis@wgops.com>
Message-ID: <F17F9AD240489C1D6AF3CA54@d216-220-25-36.dynip.modwest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Hello and what to do about a failed pvmove?
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

We've had a hardware problem necessitating pvmove-ing a large number of PVs 
to a new PV device, teh old PV device has some uncorrectable sectors, 
during a block of pvmove-es we hit one of these causing pvmove to 
fail....now we've got (according to pvdisplay) duplicate LE's associated 
with the (dead/dieing) PV such that pvdisplay on the destination device 
shows the PV extent/LE moved, but the original/source PV shows it still 
there as well.  lvdisplay shows the destination PV as being the 'current' 
PV in all cases as far as I can tell (which means the kernel is using 
these?)

My question is...now pvmove reports the below error and the source 
(dead/dieing) PV still displays the LEs in it's output...how do I clear 
this up?  basically I had pvmove fail on some impossible reads and now I 
need to clean up after it...

Any hints/suggestions/etc?

pvmove -- ERROR "Invalid argument" remapping
pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
