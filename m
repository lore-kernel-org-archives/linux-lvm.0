Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBIBs3126115
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:54:03 -0500
Received: from skippy.fini.net (skippy.fini.net [205.166.143.75])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBIBrvwb019337
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:53:58 -0500
Received: from skippy.fini.net (localhost.localdomain [127.0.0.1])
	by skippy.fini.net (8.13.4/8.13.4) with ESMTP id jBIBriPS021872
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:53:49 -0500
Received: from localhost (chicks@localhost)
	by skippy.fini.net (8.13.4/8.13.4/Submit) with ESMTP id jBIBriCG021868
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:53:44 -0500
Date: Sun, 18 Dec 2005 06:53:44 -0500 (EST)
From: Christopher Hicks <chicks@chicks.net>
Message-ID: <Pine.LNX.4.63.0512180645020.20680@skippy.fini.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM corruption on rocketraid 1540 in AMD64 CentOS
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm list <linux-lvm@redhat.com>

I've got a pair of RocketRaid 1540's based on the HPT374 chip.  Every time 
I setup an LVM which includes drives on the RR1540 and reboot, the LVM 
becomes corrupt.  I'm able before reboot to read and write files to my 
heart's content, but then I reboot and its toast.  I was able to reboot 
fine with LVM partitions on the same box as long as none of the PV's were 
on the HPT374.  My experiments where on an AMD64 machine running CentOS 
4 and I'm not sure what to try next.  I figured trying FC4 on x86 32-bit 
hardware should be the next step to see if its an architecture issue.  Is 
this a known issue?  Any suggestions for why?  Or any suggestions for what 
to try?  I'd really like to get these controllers back in the server 
they belong in.  :)

-- 
</chris>

The significant problems we face cannot be solved by the same level of
thinking that created them.

-- Albert Einstein
