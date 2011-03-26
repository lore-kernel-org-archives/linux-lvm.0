Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2QG7hEF015417
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 12:07:43 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2QG7dpE015318
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 12:07:39 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2QG7ces031628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 12:07:38 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2QG7bl9028611
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 12:07:37 -0400
Date: Sat, 26 Mar 2011 12:07:37 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D8D78D5.7050701@cox.net>
Message-ID: <alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 26 Mar 2011, Ron Johnson wrote:

>> Yes, but a power failure can then mess up the ordering of write completions
>> distributed between 2 or more PVs, which could defeat the assumptions made
>> by your file system journaling.
>
> File a bug...  But against what?  LVM?  The FS?  The block layer?

It is not a bug.  Some progress can be made with barriers (similar to fsync())
that block until all affected blocks are confirmed written on all devices
through all levels of the storage stack (e.g. written to all legs
of a raid1 device).  My database does an fsync after each journal batch,
and I think it reasonable to hope that this guarantees that the writes
from the journal batch complete before any subsequent writes.  I don't
depend on any other ordering.

In the case of a snapshot, I believe the COW and origin blocks are written
in parallel.  Snapshots are slow enough as it is.  :-)  So it is not
surprising that it loses  consistency on power failure.

>> No, YMMV, but I generally have a number of smaller LVs (for virtual
>> machines) and it is nice to have a larger pool of PVs from which they are
>> allocated.
>
> I guess I'm just a DP Dinosaur who thinks that if a machine is beefy
> enough to run a bunch of services then those services should run directly on 
> the machine.  (Obviously I don't work for a web hosting company...)

The VMs give excellent isolation between VMs in case you don't trust
the (morals and/or competence of) admins for the VMs.  I understand,
however, that Open Solaris has comparable isolation without a full VM, and one
of these days I'll play with it.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
