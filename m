Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8O1R28t009396
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 21:27:02 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8O1Qnk6005551
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 21:26:49 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8O1Ketq016085
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 19:20:40 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8O1QnZj251898
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 19:26:49 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8O1Qmv6029636
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 19:26:49 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8O1QmbH029616
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 19:26:48 -0600
Date: Wed, 23 Sep 2009 18:26:48 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] LVM mirror resync
Message-ID: <20090924012648.GB16777@us.ibm.com>
References: <29ae894c0909230507g70719ab2ga2810256d10ae667@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ae894c0909230507g70719ab2ga2810256d10ae667@mail.gmail.com>
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
> My questions are:
> 
> 1) Am I using the right method to simulate a drive failure by echoing
> a scsi delete ? How would behave the scsi layer in case a disk came to
> physically disappear ?

You are using a right method. You could pull the cables physically but
it is not going to make any difference to LVM mirror behaviour.

> 2) If the above method is correct, isn't the role of the mirror log to
> keep track of region changes  in case of a drive failure to be able to
> incrementally resync the mirror when the missing drive is back to
> operation?

Yes, but the implementation is not complete yet! Without the mirror
log (corelog), every reboot needs a complete resync. Mirror log is used
to avoid that but nothing more at this point!

>  Missing drive is not replaced, the UUID is the same, the problem
> could have occured at scsi connectivity not on the physical media (SAN
> failure for instance).
> 
> 3) if so, why does disappear the log device from the VG though being
> on a physically present device ?

If you really look at your LV, it is no more a mirror. It is just a
linear LV! So your failed mirror leg as well as your mirror log are not
used. "dmeventd" will remove the failed mirror leg from the VG. It
probably removed the now unused mirror log also.

> 4) when the missing drive is back again,
>     4-1)  why does it appear as not belonging to its original VG ?

Because it was removed from the VG in the first place. The metadata on
other disks is the latest and is used.

>     4-2) why doesn't it get automatically resync'ed by dmeventd ? .

It doesn't know any better! It doesn't know that it was a mirror.

> The recover process seems to be to reconstruct from scratch the mirror
> treating the failed and back again drive as a totally new drive.

Yes! I heard that mdadm (raid1) can do (optimal resyncs) what you want
but I have no direct experience. You may want to try that if you need
this feature.
