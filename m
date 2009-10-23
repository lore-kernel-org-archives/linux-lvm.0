Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NJG3as024409
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:16:04 -0400
Received: from e8.ny.us.ibm.com (e8.ny.us.ibm.com [32.97.182.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NJFoOl002300
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:15:51 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e8.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9NFCbmq011717
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:12:37 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9NJFmNs1294532
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:15:48 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9NJEt8X027049
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:14:55 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9NJEtjq027021
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:14:55 -0400
Date: Fri, 23 Oct 2009 12:15:47 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LVs
Message-ID: <20091023191547.GB13442@us.ibm.com>
References: <4AE1B9FB.504@mortent.org> <20091023172914.GA12748@us.ibm.com>
	<29ae894c0910231140l2a7732d4na691ef87e4b852e8@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ae894c0910231140l2a7732d4na691ef87e4b852e8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

brem belguebli [brem.belguebli@gmail.com] wrote:
> >> Why cannot the mirrorlog be stored persistently in one or more LEs in
> >> the LV? Why the need for a seperate PV for this?
> >
> > For better redundancy...
> That is something I do not clearly see.
> I am not going to enumarate em all, but mdadm stores the bitmap on
> each mirror leg, HP-UX LVM store the MWC on each mirror leg .... what
> makes them less redundant?

They are NOT less redundant as they store the bit map on both the legs.
Linux LVM can't place the log on both the legs at the moment so a leg
that has your log goes down, then you don't have the log data at all.

I heard another reason for not placing the log on the same PV as your
mirror leg -- performance. Since the logical block address for the log
data and the leg data will be far apart, you may cause disk seeking
back and forth. I don't know how much degradation in reality though.
A non issue when we go to SSD...
 
> If we came to loose the LVM2 mirror third log device, what would
> happen (you already answered me on this topic that the mirror would
> stop).

Currently either log failure or leg failure would transform your
'mirror' to a 'leaner' LV in linux. In other words, it can't handle
transient device failures at all.

> I saw that there is some work being done to add a fourth log device to
> address this SPOF.

Yes.
 
> I think the current implementation, by trying to be the MOST redundant
> one, is getting too complex, or too expensive (each mirror device
> requiring 3 or 4 devices even if the 1 or 2 log devices are a few
> Megs) that one would, in the best case, use corelog instead, or
> partition the drives to mirror with 1 small log partition and the
> remaining space for data : both cases got off of the redundancy
> targeted.

I understand this as some missing functionality in Linux LVM rather than
trying to make it "most redundant"...
