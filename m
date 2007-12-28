Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBSE0ICi002232
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2007 09:00:18 -0500
Received: from relais.videotron.ca (relais.videotron.ca [24.201.245.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBSDxjrV024175
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2007 08:59:45 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from [192.168.1.109] ([74.57.215.142]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JTR0098YIVKFL80@VL-MH-MR002.ip.videotron.ca> for
	linux-lvm@redhat.com; Fri, 28 Dec 2007 08:59:44 -0500 (EST)
Message-id: <47750150.2070509@terrascale.net>
Date: Fri, 28 Dec 2007 08:59:44 -0500
From: Steeve McCauley <steeve@terrascale.net>
Subject: Re: [linux-lvm] LVM tuning
References: <000c01c8492d$8873de30$eef8a8c0@pingwinek>
In-reply-to: <000c01c8492d$8873de30$eef8a8c0@pingwinek>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


Look at tuning the physical block devices in /sys/block/sd?/queue,
you can select the type of scheduler, read ahead, etc.

admin wrote:
> Hi,
> I would like to tune my lvm to get better performance, already search on 
> google and nothing. Did someone do this before??
>  
>  
> Best Regards
> Bart
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
