Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2Lb3hr005881
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:37:03 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2Lb2Zp026501
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:37:02 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2Lb1ml001139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:37:01 -0500
Message-Id: <6.2.5.6.2.20111202162035.063ebe80@binnacle.cx>
Date: Fri, 02 Dec 2011 16:27:24 -0500
From: starlight@binnacle.cx
In-Reply-To: <alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

At 04:01 PM 12/2/2011 -0500, Stuart D. Gathman wrote:
>Both MD and LVM support
>DISCARD, and discarded blocks are not necessarily synced
>between mirror legs.

Googled it--seems like DISCARD (aka TRIM) is about
telling SSDs that blocks are no longer in use so
that the SSDs can optimally release tracking of the
storage.  I can see how this might result
in random data appearing in the "discarded"
region.  I don't see how the 'mdadm' mirror
check will cope with that result unless SSDs
return zeros or some other constant value when
TRIMed blocks are subsequently read.

However this is a hard-drive scenario--no SSDs.
It would seem that hard drives generally will
either ignore TRIM operations or via drive
flags inform the kernel to not attempt them.

So this leaves me with two LVs where it's
clear that LVM mirroring failed to maintain
synchronization at some point in the last
year or two.

Also based on this thread
http://www.issociate.de/board/post/507507/SSD_-_TRIM_command.html
it would seem TRIM is very much a bleeding-edge
feature.  Unlikely it appears in the CentOS 5.7
kernel in use on the affected system.

So I'm sticking with "turkey" as the appropriate
characterization of LVM mirroring.
