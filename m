Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QCQdP31709
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 08:26:41 -0400
Received: from amiindia.co.in (illchn-static-203.199.198.234.vsnl.net.in
	[203.199.198.234] (may be forged))
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j4QCQxij026319
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 08:27:03 -0400
Message-ID: <074301c561ed$a61e1560$8300000a@johnpaul>
From: "johnpaul" <johnpaulmp@amiindia.co.in>
References: <4295B7F7.9060802@hp.com>
Subject: Re: [linux-lvm] Daemon or Thread with 5 minute interval
Date: Thu, 26 May 2005 17:52:52 +0530
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: howard.rifkin@hp.com, LVM general discussion and development <linux-lvm@redhat.com>

Hi

Can you find the new process's name by getting the ps ax command  or Stop
the crond and see what happens

Regards
John

----- Original Message ----- 
From: "Howard Rifkin" <howard.rifkin@hp.com>
To: <linux-lvm@redhat.com>
Sent: Thursday, May 26, 2005 5:20 PM
Subject: [linux-lvm] Daemon or Thread with 5 minute interval


> I have been working on a project that analyzes "noise" in Linux clusters
> running large parallel jobs. Where noise is caused by daemons or kernel
> threads periodically waking up and slowing down a process of a parallel
> job enough so that is misses a rendezvous with the other processes and
> so slows down the entire job. Using an internal tool I have been able to
> track down several daemons that have been a large source of noise but,
> after turning them all off I am left with a large noise spike that
> occurs every 5 minutes. I have tried turning off most of the most common
> daemons such as cron, ntp, syslog, ect. but, I am still left with this
> spike. Not being a kernel expert myself I have not been able to
> experiment with kernel threads. So, my question is does anyone know of a
> kernel thread or daemon in the 2.4 kernel that wakes up every 5 minutes?
>
> Thanks
>
> Howard
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
