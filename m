Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8I1uZIg023236
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:56:35 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8I1uPJh022465
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:56:25 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8I1ttTb011689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:55:55 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8I1tpnn009691
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 21:55:52 -0400
Date: Thu, 17 Sep 2009 21:55:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
In-Reply-To: <1253231287.2339.754.camel@pc.interlinx.bc.ca>
Message-ID: <Pine.LNX.4.64.0909172142350.9233@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
	<1253231287.2339.754.camel@pc.interlinx.bc.ca>
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

On Thu, 17 Sep 2009, Brian J. Murrell wrote:

> > 1) Eventually you still need to copy the snapshot to a normal LV to get 
> > your performance back
> 
> Will you?  When you are using the snapshot instead of the origin, you
> are writing to the COW already, not writing to the origin which requires
> a COW copy-out.

Only if you are updating an entire fragment.  Otherwise, it is 
read/modify/write.

Furthermore, even when the snapshot is entirely filled out, the
fragments are in random physical order.  (Could be mitigated by
smart placement in the COW based on LV size.)

Furthermore, even if you don't care about performance, 
you currently *still* have to copy to a real LV to take another snapshot.  

Furthermore, if some future LVM version is capable of recursive snapshots, the
performance issue is intensified with each snapshot layer.

Actually, that last isn't strictly true.  There is the device mapper based
"Zumastor" product that uses a common COW shared among many snapshots
and can take multiple snapshots or snapshots of snapshots with no
(additional) performance degradation.  That could be a standard feature
in some future LVM version.

> > 2) (minor, but important) Another FAQ is "exactly how big do I need to make
> > my snapshot so that it is guaranteed never to overflow".
> 
> Heh.  Yeah.

This is instensified in the Zumastor idea, since overflow can potentially
invalidate hundreds of snapshots, some of which could be essential
(cloned virtual servers for a client).  (Maybe it's best to simply 
revert all the Zumastor LVs to readonly in that case.  Maybe it already does
that.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
