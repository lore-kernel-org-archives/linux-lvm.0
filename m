Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OJjLS4018852
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:45:21 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OJjBk1010074
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:45:12 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1OJjBj1028092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:45:11 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1OJjAsb023562
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:45:10 -0500
Date: Thu, 24 Feb 2011 14:45:10 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D667743.3010102@abpni.co.uk>
Message-ID: <Pine.LNX.4.64.1102241421550.22996@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
	<4D65A1A9.1040205@abpni.co.uk>
	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
	<4D65A839.50107@abpni.co.uk> <4D65A8F5.8040606@abpni.co.uk>
	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
	<4D6609E4.10800@abpni.co.uk>
	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>
	<4D6671D7.7020301@abpni.co.uk>
	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>
	<4D667743.3010102@abpni.co.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 24 Feb 2011, Jonathan Tripathy wrote:

> > Yes.  When you make the snapshot, there is only one copy, and the COW table
> > is empty.  AS YOU WRITE to the origin, each chunk written is saved to
> > *-cow first before being written to *-real.
> Got ya. So data that is being written to the origin, while the snapshot
> exists, is the data that may leak, as it's saved to the COW first, then copied
> over to real.
> 
> Hopefully an expert will let me know weather its safe to zero the COW after
> I've finished with the snapshot.

What *is* safe is to zero the snapshot.  This will overwrite any blocks
in the COW copied from the origin.  The problem is that if the snapshot runs
out of room, it is invalidated, and you may or may not have overwritten
all blocks copied from the origin.

So if you don't hear from an expert, a safe prodecure is to allocate 
snapshots for backup that are as big as the origin + 1 PP (which should
be enough for the COW table as well unless we are talking terabytes).  Then you
can zero the snapshot (not the COW) after making a backup. That will overwrite
any data copied from the origin.  The only leftover data will just be the COW
table which is a bunch of block #s, so shouldn't be a security problem.

This procedure is less efficient than zeroing LVs on allocation, and takes
extra space for worst case snapshot allocation.  But if you want allocation
to be "instant", and can pay for it when recycling, that should solve your
problem.  You should still zero all free space (by allocating a huge LV
with all remaining space and zeroing it) periodically in case anything
got missed.

IDEA, since you are on raid1, reads are faster than writes (twice as fast),
and your snapshots will be mostly unused (the COW will only have a few blocks
copied from the origin).  So you can write a "clear" utility that scans 
a block device for non-zero chunks, and only writes over those with zeros.
This might be a good application for mmap().  

Furthermore, if you have 3 copies of the data in your raid1 system, then reads
are 3 times as fast, and the clear utility might be fast enough to use at
allocation time - which is simple and safe.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
