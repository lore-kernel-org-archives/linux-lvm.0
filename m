Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0MMjccc031654
	for <linux-lvm@redhat.com>; Thu, 22 Jan 2009 17:45:38 -0500
Received: from mrout1-b.corp.re1.yahoo.com (mrout1-b.corp.re1.yahoo.com
	[69.147.107.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0MMjHnV014313
	for <linux-lvm@redhat.com>; Thu, 22 Jan 2009 17:45:18 -0500
Received: from hangbegin-lm.champ.corp.yahoo.com
	(hangbegin-lm.champ.corp.yahoo.com [10.74.91.8])
	by mrout1-b.corp.re1.yahoo.com (8.13.8/8.13.8/y.out) with ESMTP id
	n0MMilno060283
	for <linux-lvm@redhat.com>; Thu, 22 Jan 2009 14:44:47 -0800 (PST)
Message-Id: <FE6006AF-4E4B-47D1-AF02-B7C356A43E3F@yahoo-inc.com>
From: "Wayne H. Badger" <badger@yahoo-inc.com>
In-Reply-To: <20090116223649.GC1804@agk.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [linux-lvm] LVM and snapshot performance
Date: Thu, 22 Jan 2009 16:44:46 -0600
References: <AAFA5C94-E986-4CE5-9842-D94C70BA87F1@yahoo-inc.com>
	<20090116223649.GC1804@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Jan 16, 2009, at 4:36 PM, Alasdair G Kergon wrote:
> 1. You don't say what filesystem/journal configuration is involved.

We're using an ext2 fs.  I have tried with ext3 with journaling and I  
get the same result.

> 2. Is it a system where you can run test kernels or is it too 'live'  
> for that?

I can run tests.

> 3. Try all the syncing and cache flushing options before issuing the  
> lvremove.

I drop caches before running the test.  A sync immediately after  
writing the files results in the same hang.

> 4. Could it depend on the amount of io load over a short period  
> before the
> lvremove runs, rather than something cumulative?

I do notice that smaller data writes result in a quicker lvremove, one  
that is commensurate with the amount of data written.  It seems as  
though there is a threshold over which the slow result occurs.  Also,  
waiting a long time after the writes complete clears the problem and  
the lvremove occurs quickly.  It seems to be related to a burst of  
data of a certain size.

> 5. What more can you find out from ps/iostat/sysrq/lvm logging about  
> what the
> system is doing during the lvremove?

iostat shows that there is not a whole lot of I/O going on.  There are  
writes going on pretty continually during the slowdown time, but the  
disk is certainly not pegged.

ps shows that the lvremove is stuck in an uninterruptible sleep.

> 6. What devices/drivers are involved in the stack?  (We had a  
> perhaps-related
> issue show up with loop.)

We're using an HP P400 smart array controller with RAID5.  There are 4  
750GB SATA disks hanging off the controller.

Wayne
