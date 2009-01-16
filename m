Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0GMLApw005774
	for <linux-lvm@redhat.com>; Fri, 16 Jan 2009 17:21:10 -0500
Received: from mrout3.yahoo.com (mrout3.yahoo.com [216.145.54.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0GMKsjg025102
	for <linux-lvm@redhat.com>; Fri, 16 Jan 2009 17:20:54 -0500
Message-Id: <AAFA5C94-E986-4CE5-9842-D94C70BA87F1@yahoo-inc.com>
From: "Wayne H. Badger" <badger@yahoo-inc.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Fri, 16 Jan 2009 16:20:41 -0600
Subject: [linux-lvm] LVM and snapshot performance
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
To: linux-lvm@redhat.com

We have a 2TB LV and create a 32GB snapshot and then modify a few GB  
on the LV.  The snapshot never fills up and the writes finish fairly  
quickly.  The problem occurs when we try to remove the snapshot  
immediately after completing the file modifications.  The lvremove  
takes a long time to complete, sometimes a couple of hours.  The disk  
raid that backs the LV is capable of 300MB/s, so writing everything  
should not take that long.  I have run some performance tests and  
determined that write performance is only about 25% of the raw  
throughput available on the disks, but that doesn't explain the really  
long time required to finish the lvremove.

The lvremove is not really doing anything -- the backtrace doesn't  
change and lvremove is in an uninterruptible sleep.  During this time,  
iowait time (via iostat) goes up as far as 75% (average of 8 cpus).   
The lvremove has always completed and the slow behavior is very  
repeatable.  There does appear to be a threshold beyond which the slow  
behavior occurs.  If only a small amount of data is written, then the  
lvremove completes quickly.  Also, if I wait for a long period of time  
(the caches sync?), then the lvremove completes quickly.

We are running 2.6.9-67.0.22.EL and the LVM2 version is  
lvm2-2.02.37-3.el4.

I've looked through recent linux-lvm archives and haven't seen  
anything that specifically addresses this issue.

Any clues or even pointers of where to look?  Have changes been made  
in later kernels to address this issue?

Thanks,
Wayne

--
Wayne H. Badger
badger@yahoo-inc.com
