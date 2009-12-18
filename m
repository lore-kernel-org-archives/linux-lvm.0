Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBI2HFAs023924
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:17:15 -0500
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBI2H0Rj000392
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:17:00 -0500
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id nBI2AJnT024301
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:10:19 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nBI2Gx60130700
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 21:16:59 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	nBI2GxKv014926
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 00:16:59 -0200
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nBI2GxQG014910
	for <linux-lvm@redhat.com>; Fri, 18 Dec 2009 00:16:59 -0200
Date: Thu, 17 Dec 2009 18:16:58 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: brainfart: lilo'd a PV
Message-ID: <20091218021658.GA20200@us.ibm.com>
References: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
	<4B2AD174.40402@redhat.com>
	<1261101785.21162.712.camel@pc.interlinx.bc.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1261101785.21162.712.camel@pc.interlinx.bc.ca>
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

Brian J. Murrell [brian@interlinx.bc.ca] wrote:
> On Thu, 2009-12-17 at 19:48 -0500, Takahiro Yasui wrote: 
> > 
> > Yes. The area begin with "LABELONE" is PV label,
> 
> Looks like the LVM developers foresaw my brainfart and left the first
> sector of the disk for me to bugger up without buggering up LVM.  :-)

Partition table uses the first sector (0th sector), so pretty much every
other software that uses labels avoid the first sector.

> > which is recorded in
> > the first sector by default.
> 
> Hrm.  Do you really mean "first" there or second, which is sector 1 if
> you start counting with 0?

He really meant sector 1!

You are just lucky!
