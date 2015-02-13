Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1D69SZd021877
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2015 01:09:28 -0500
Received: from alukardd.org (alukardd.org [188.134.93.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1D69PdI001986
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2015 01:09:27 -0500
Received: from alukardd.org ([172.17.0.101]:40357 helo=mail.alukardd.org)
	by alukardd.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84) (envelope-from <alukardd@alukardd.org>)
	id 1YM9RL-0001Sh-Bc
	for linux-lvm@redhat.com; Fri, 13 Feb 2015 09:09:24 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 13 Feb 2015 09:09:23 +0300
From: Alexey <alukardd@alukardd.org>
Message-ID: <c5674e3a97f4adb29874f7384d0726fb@alukardd.org>
Subject: [linux-lvm] temporary uninterruptible sleep on thin pool under
	massive write
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

Hello.

I have a problem with LVM thin pool. I have several VG in my 
installation, each VG contains one TP, in each TP there is several thin 
LV. Each VG have only one PV created on SSD INTEL SSDSC2BB48 D201.

For reproduce the bug I start dd: dd if=/dev/zero of=/dev/vg3/testdd 
bs=4M count=1000
The dd process dealing its job without any problem, but if we see "ps", 
the state of the dd process will be "D+". During "D+" state dd works 
fine and write data to disk, BUT any other attempts  to use the same VG 
as dd for read or write operations is impossible until dd will not stop.
Any other VG works fine during this problem.

I tried to run dd with ionice: ionice -c idle dd if=/dev/zero 
of=/dev/vg3/testdd bs=4M count=1000. It didn't help.

# lvm version
   LVM version:     2.02.106(2) (2014-04-10)
   Library version: 1.02.85 (2014-04-10)
   Driver version:  4.27.0

I'll try Linux 3.10.61 from kernel.org and 3.10 from CentOS (RHEL_MAJOR 
= 7, RHEL_MINOR = 0, RHEL_RELEASE = 123.9.3).


Regards,
Alexey Mochkin
