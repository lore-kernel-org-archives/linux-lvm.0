Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l94HwOTd005065
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 13:58:24 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l94Hw6dv002196
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 13:58:16 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.11.20060308/8.13.8) with ESMTP id
	l94GnYEa024343
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 12:49:34 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l94HvxtS361544
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 11:57:59 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l94Hvww2000402
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 11:57:58 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	l94Hvwq2000398
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 11:57:58 -0600
Date: Thu, 4 Oct 2007 10:57:57 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Poison pills
Message-ID: <20071004175757.GA16363@us.ibm.com>
References: <20071003214759.GA10385@us.ibm.com>
	<Pine.LNX.4.44.0710041211540.814-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0710041211540.814-100000@bmsred.bmsi.com>
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

You may be able to place the flakey target on top of loop device to simulate device failure.

-Malahal.

Stuart D. Gathman [stuart@bmsi.com] wrote:
> On Wed, 3 Oct 2007 malahal@us.ibm.com wrote:
> 
> > It would be a lot cheaper if you can test it with loop devices!
> 
> Loop devices don't let you disconnect them while active (or at least they
> complain and I've never tried to override them).  The torture test is
> removing the drive while active in the VG, file system mounted, etc.
> 
> > Stuart D. Gathman [stuart@bmsi.com] wrote:
> > > I think an inexpensive torture test of this logic is to get 3 or 4 external USB
> > > drives, put them all in a VG, and start playing games with hotplugging them.
> > > (E.g. unplug drive, vgreduce, plug drive back in).
> 
> -- 
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
