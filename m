Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pB2M2nfY029232
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 17:02:49 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2M2mDB013903
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 17:02:49 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2M2m7T001296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 17:02:48 -0500
Message-Id: <6.2.5.6.2.20111202170042.063eb068@binnacle.cx>
Date: Fri, 02 Dec 2011 17:02:48 -0500
From: starlight@binnacle.cx
In-Reply-To: <alpine.LRH.2.00.1112021652250.5734@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
	<6.2.5.6.2.20111202160842.063ebbf0@binnacle.cx>
	<alpine.LRH.2.00.1112021652250.5734@bmsred.bmsi.com>
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

At 04:54 PM 12/2/2011 -0500, Stuart D. Gathman wrote:
>At least as of EL5.7, MD sync check does not take
>into account DISCARD, and does not report 
>individual blocks out of sync - just a count.

Ugly.  Will surely avoid SSD mirrors till that's
one is figured out.

>BTW, RAID0 does *not* provide mirroring!  You want
>RAID1 or RAID10 for that.

Ya.  Meant RAID1--was a goof.
