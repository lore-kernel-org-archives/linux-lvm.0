Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LG9Fa29400
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 12:09:15 -0400
Received: from gpu.utcc.utoronto.ca (gpu.utcc.utoronto.ca [128.100.100.1])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i6LG98Xn020883
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 12:09:09 -0400
Date: Wed, 21 Jul 2004 12:08:59 -0400
Sender: Derek Yeung <dky@utcc.utoronto.ca>
From: d3yuen@artsmail.uwaterloo.ca
Message-ID: <Pine.LNX.4.44.0407211150390.12142-100000@gpu.utcc>
MIME-Version: 1.0
Subject: [linux-lvm] How to rename a VG that contains the root?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello!


I'd like to change the name of a volume group that contains the root
partition.  I spent some time searching on google for some notes that ,
but to no avail.  So i looked at the man page for vgrename and renamed my
volume group.  I changed entries in both fstab and grub.conf, but now the
machine wouldn't boot. The machine boots to a point and then i see this
error message:

Freeing unused kernel memory: 
Kernel panic: No init found.  Try passing init= option to kernel.  

I suspect that i need to reinstall (reload?) the boot loader (i use grub), 
but i don't remember how to do that too..  


I'm a bit lost -- could someone tell me what is the proper procedure to 
change the name of a volume group, please?  

What should i keep in mind if i needed to change the name of a volume
group that contains root?




Any suggestions is very greatly appreciated.


Thanks very much, 
/dky
