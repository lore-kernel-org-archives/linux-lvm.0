Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2THd1Ov015158
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:39:01 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2THcu2B022154
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:38:56 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l2THcox5011939
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:38:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l2THcoRg029905
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:38:50 -0400
Date: Thu, 29 Mar 2007 13:38:50 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM questions
In-Reply-To: <460BEF90.60900@ehsco.com>
Message-ID: <Pine.LNX.4.44.0703291325420.29826-100000@bmsred.bmsi.com>
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

On Thu, 29 Mar 2007, Eric A. Hall wrote:

> I have seen some people talk about creating hundreds of small partitions
> and using those for moving and resizing. Is this needed, desirable, or
> just a stupid human trick?

That is a work around for lack of functionality in LVM.  Having used
LVM on AIX, that is the gold standard for me.  The LVM divides into
little partitions and keeps track of them for you.  So why do it 
manually?  Using md for mirroring, each partition synchronizes separately.
Manually making several smaller partitions lets you move them around and resync
- all while the system is running.  This happens automatically when LVM
supports mirroring, but LVM mirroring is still a new experimental feature
on linux.

Multiple volume groups just get in the way when you are resizing and
migrating between physical volumes.  You need a separate volume group
when you need to physically pick up the entire volume group and 
take it somewhere else.  For instance, scientific datasets are
often much too large (terabytes) for DVD, tape, or internet.  So, just make a
volume group on a handful of 500G drives, build and process your data
there, then deactivate the VG and send the drives to your colleague
(make a copy first, of course).  Your colleague plugs the drives into
his USB/SATA/iSCSI/whatever controller, activates the volume group,
and now has a copy of your work.

For anything that will never be physically moved to another machine, keep
it all on one volume group.  But, for instance, if you think you might
want to move the iSCSI data to another box at some point, keep it 
in its own VG (with its own set of drives) to make that easy.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
