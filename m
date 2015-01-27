Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RIElpA009640
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 13:14:47 -0500
Received: from b.a.painless.aa.net.uk (b.a.painless.aa.net.uk [81.187.30.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RIEhVh029245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 13:14:45 -0500
Received: from [90.155.89.110] (helo=home.marksyms.me.uk)
	by a.painless.aa.net.uk with esmtp (Exim 4.77)
	(envelope-from <mark@marksyms.me.uk>) id 1YGAet-0000hz-8w
	for linux-lvm@redhat.com; Tue, 27 Jan 2015 18:14:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by home.marksyms.me.uk (Postfix) with ESMTP id E6A871BA255
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 18:14:38 +0000 (GMT)
Received: from home.marksyms.me.uk ([127.0.0.1])
	by localhost (home.marksyms.me.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIOVHSMbd-Ov for <linux-lvm@redhat.com>;
	Tue, 27 Jan 2015 18:14:37 +0000 (GMT)
Received: from [192.168.11.47] (unknown [192.168.11.47])
	by home.marksyms.me.uk (Postfix) with ESMTPSA id 54C051BA239
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 18:14:37 +0000 (GMT)
Message-ID: <54C7D5A8.3080805@marksyms.me.uk>
Date: Tue, 27 Jan 2015 18:15:04 +0000
From: Mark Syms <mark@marksyms.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Checking alignment on existing volumes
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
To: linux-lvm@redhat.com

Hi,

Is it possible to check the alignment of the various pieces involved in 
a LVM2, MDADM RAID5 system to ensure that things are going to 4k boundaries?

I have a system with 4 2TB drives (which are 4k natural block and use 
GPT) which has Raid 1 and Raid 5 mdadm arrays on it (raid1 for /boot, 
everything else on the raid5). The raid5 array is used as an LVM2 PV 
which then has multiple LVs on it. The partitions for the raid were 
created with parted and are aligned to 4k and report as such with a 
align-check optimal.

I get some confusing performance results if I use ioping -WWWs to test 
write speed to a test volume (shown at the bottom). Periodically thing 
block for 1-2 seconds which makes the performance quite unpredictable.

I've tried tweaking the dirty ratios and used a modified form of the 
second script from this forum post 
(http://ubuntuforums.org/showthread.php?t=1494846) to set the raid 
stripe cache size and read ahead but without much success.

Running  "pvs -o +pe_start", gives

   PV         VG   Fmt  Attr PSize PFree 1st PE
   /dev/md1   vol1 lvm2 a--  5.44t 4.08t   1.50m

which if I'm reading it right (as the man page isn't much help in terms 
of information) says that the PV is aligned at a 1.5m boundary and so 
should be on a 4k boundary?

Any suggestions for further things to try would be much appreciated, 
please reply to me directly as I'm not subscribed to the list.

Thanks,

Mark.

-----------------------------------

10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=6 time=159.7 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=7 time=146.9 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=8 time=144.1 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=9 time=144.6 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=10 time=144.6 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=11 time=147.8 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=12 time=161.7 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=13 time=1.9 s
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=14 time=175.8 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=15 time=163.0 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=16 time=140.4 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=17 time=182.7 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=18 time=155.3 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=19 time=173.8 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=20 time=2.2 s
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=21 time=158.5 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=22 time=144.5 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=23 time=166.3 ms
10.0 MiB from /dev/vol1/test (device 100.0 GiB): request=24 time=147.1 ms
