Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3DEacdd010984
	for <linux-lvm@redhat.com>; Mon, 13 Apr 2009 10:36:39 -0400
Received: from arvo.suso.org (arvo.suso.org [66.244.94.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3DEaEQT002716
	for <linux-lvm@redhat.com>; Mon, 13 Apr 2009 10:36:14 -0400
Date: Mon, 13 Apr 2009 10:37:21 +0000
From: Mark Krenz <mark@suso.org>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"?
Message-ID: <20090413103719.GB8147@arvo.suso.org>
References: <49DCA275.8070203@Calva.COM> <49DF02A7.50606@Calva.COM>
	<20090410101959.GA21846@us.ibm.com> <49DF2403.10009@Calva.COM>
	<49E32F57.8020105@redhat.com>
	<37d33d830904130730j6cb7bc16y50a2a6ac682dc5d@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37d33d830904130730j6cb7bc16y50a2a6ac682dc5d@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Apr 13, 2009 at 02:30:27PM GMT, Sandeep K Sinha [sandeepksinha@gmail.com] said the following:
> >
> >> To increase the chances of surviving a double-disk failure it would be
> >> better to raid-0 a bunch of raid-1's.
> >
> > This is RAID1+0 (RAID10/stripe of mirrors) - it's usually preferable to
> > 0+1 not only because of the improved redundancy but also the individual
> 
> I disagree.
> 
> Look at this:
> http://www.pcguide.com/ref/hdd/perf/raid/levels/multXY-c.html

  I misread what Bryn had said at first as well, but re-reading it, he
means that RAID1+0 does better at recovery than RAID0+1, which does make
sense.  In RAID0+1, depending on how many mirror arrays you have and how
smart your RAID controller is, you could have twice as many disk
accesses happening during a disk recovery.  The URL that you pointed too
doesn't really talk about performance during a recovery anyways.


-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
