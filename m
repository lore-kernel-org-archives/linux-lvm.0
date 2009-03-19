Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2JILXbG010462
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 14:21:33 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2JILDal010146
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 14:21:13 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n2JIJrFo025155
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:19:53 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n2JILB25087802
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:21:12 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n2JILBAP006595
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:21:11 -0600
Received: from [9.47.17.98] (chandra-ubuntu.beaverton.ibm.com [9.47.17.98])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n2JILAxX006512
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:21:11 -0600
Subject: Re: [linux-lvm] multipath question
From: Chandra Seetharaman <sekharan@us.ibm.com>
In-Reply-To: <49C29649.7040402@sivell.com>
References: <49C29649.7040402@sivell.com>
Date: Thu, 19 Mar 2009 11:24:13 -0700
Message-Id: <1237487053.26341.12.camel@chandra-ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sekharan@linux.vnet.ibm.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Thu, 2009-03-19 at 13:00 -0600, vu pham wrote:
> I set up multipath on /dev/sda and /dev/sdb which are mapped from a 
> remote single disk, which has two partitions.
> 
> Below are some output.
> [root@vm5 mpath]# ls -l
> total 0
> lrwxrwxrwx 1 root root 7 Mar 19 10:34 mpath0 -> ../dm-2
> lrwxrwxrwx 1 root root 7 Mar 19 10:34 mpath0p1 -> ../dm-3
> lrwxrwxrwx 1 root root 7 Mar 19 10:34 mpath0p2 -> ../dm-4
>
> [root@vm5 mpath]# multipath -ll
> mpath0 (16465616462656166313a3100000000000000000000000000) dm-2 
> IET,VIRTUAL-DISK
> [size=5.0G][features=0][hwhandler=0]
> \_ round-robin 0 [prio=0][active]
>   \_ 0:0:0:1 sda 8:0   [active][ready]
> \_ round-robin 0 [prio=0][enabled]
>   \_ 1:0:0:1 sdb 8:16  [active][ready]
> [root@vm5 mpath]#
> 
> 
>  From the multipath command, I know dm-2 is mapped from two devices 
> /dev/sda and /dev/sdb as expected.
> 
> But how can I know if dm-3 is mapped from /dev/sda1 and /dev/sdb1, and 
> dm-4 from /dev/sda2 and /dev/sdb2 ?
> 
> The command "multipath -ll" only gives info on mpath0 or dm-2.
> 
> I tried  multipath -ll /dev/mpath/mpath0p1 but does not show anything.

mpath0 is analogous to sda and mpath0p1, mpath0p2 are analogous to sda1,
sda2.

since there is "mpath0" in mpath0p1 and mpath0p2, you can be sure that
they are built off sda and sdb (in effect mpath0p1 is made of sda1 and
sdb1 and so on)...

> 
> Thanks,
> 
> Vu
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
