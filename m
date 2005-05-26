Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QBoXO25563
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 07:50:33 -0400
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4QBoRtM027405
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 07:50:27 -0400
Received: from power.usa.hp.com (amps.usa.hp.com [16.119.180.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by palrel10.hp.com (Postfix) with ESMTP id 9D404106E
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 04:50:21 -0700 (PDT)
Received: from [127.0.0.1] ([15.228.168.250])
	by power.usa.hp.com (8.12.11/) with ESMTP id j4QBoGr7691555
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 07:50:19 -0400 (EDT)
Message-ID: <4295B7F7.9060802@hp.com>
Date: Thu, 26 May 2005 07:50:15 -0400
From: Howard Rifkin <howard.rifkin@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Daemon or Thread with 5 minute interval
Reply-To: howard.rifkin@hp.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have been working on a project that analyzes "noise" in Linux clusters 
running large parallel jobs. Where noise is caused by daemons or kernel 
threads periodically waking up and slowing down a process of a parallel 
job enough so that is misses a rendezvous with the other processes and 
so slows down the entire job. Using an internal tool I have been able to 
track down several daemons that have been a large source of noise but, 
after turning them all off I am left with a large noise spike that 
occurs every 5 minutes. I have tried turning off most of the most common 
daemons such as cron, ntp, syslog, ect. but, I am still left with this 
spike. Not being a kernel expert myself I have not been able to 
experiment with kernel threads. So, my question is does anyone know of a 
kernel thread or daemon in the 2.4 kernel that wakes up every 5 minutes?

Thanks

Howard
