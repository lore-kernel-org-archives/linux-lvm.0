Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NJ3OWX012471
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:03:24 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NJ3B6i004724
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:03:11 -0400
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9NJ1204006477
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:01:02 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9NJ358b190966
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:03:05 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id n9NJ2bMC028229
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:02:37 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9NJ2a3t028142
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:02:36 -0600
Date: Fri, 23 Oct 2009 12:02:30 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LVs
Message-ID: <20091023190230.GA13442@us.ibm.com>
References: <4AE1B9FB.504@mortent.org> <20091023172914.GA12748@us.ibm.com>
	<1958a88d0910231128x2b072b48q504d56b03da39196@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1958a88d0910231128x2b072b48q504d56b03da39196@mail.gmail.com>
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

Morten Torstensen [morten@mortent.org] wrote:
> >> Why cannot the mirrorlog be stored persistently in one or more LEs in
> >> the LV? Why the need for a seperate PV for this?
> >
> > For better redundancy...
> 
> In a LE it would be mirrored too and a copy would be in each mirror...

That is not possible with the current LVM code. The log can't be a
'mirror' segment. Jonathan posted few patches to place the log on
mirrored segment but the code is not in the upstream yet!

> > Use "--alloc anywhere" to place the log LV on one of them when you
> > create your mirror.
> 
> Yes, but this will have the side effect of not ensuring separate PVs
> for the mirrored LV? An the mirror log would still not be mirrored, so
> in a failure situation you would still face data loss or force a fully
> resync of the mirror.

Agreed!
