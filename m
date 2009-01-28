Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0SHEsLQ016848
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 12:14:54 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0SHEWCx009243
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 12:14:33 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n0SHBZiX016704
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 10:11:35 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n0SHEVtR047316
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 10:14:31 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n0SHEVvj020385
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 10:14:31 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n0SHEVTO020358
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 10:14:31 -0700
Date: Wed, 28 Jan 2009 09:14:30 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Size of the mirror log?
Message-ID: <20090128171430.GA13592@us.ibm.com>
References: <20090128085024.GA14023@lupe-christoph.de>
	<20090128162636.GA12514@us.ibm.com> <49808E4B.7080804@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49808E4B.7080804@redhat.com>
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

Milan Broz [mbroz@redhat.com] wrote:
> malahal@us.ibm.com wrote:
> > Lupe Christoph [lupe@lupe-christoph.de] wrote:
> >> I'm unable to find any information on how the size of the mirror log is
> >> determined. Right now I only have four volumes of 1GB each to test this,
> >> obviously too little. We will be getting a few 128GB volumes soon, but I
> >> would rather have a formula than some test results...
> >>
> >> I presume the size will depend on the number of mirror regions, but how
> >> much log does a region require?
> > 
> > Currently the log size is fixed at 1 PE (4MB by default). It is always a
> > 1 PE.
> 
> Since LVM2 2.02.44 release mirror log size is properly calculated and can
> be higher, it is not fixed to 1 PE anymore.
> 
> 
> Milan

Thank you Milan. I was looking at the 2.02.43 that I was working with.

--Malahal.
