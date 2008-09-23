Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8N61cVa020956
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 02:01:38 -0400
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8N61L2u023285
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 02:01:23 -0400
Received: from [125.60.243.116] (helo=[10.92.1.100])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.68)
	(envelope-from <echo@echoreply.us>) id 1Ki0xN-0002sG-Mm
	for linux-lvm@redhat.com; Tue, 23 Sep 2008 06:01:06 +0000
From: Tim Post <echo@echoreply.us>
Date: Tue, 23 Sep 2008 14:01:10 +0800
Message-Id: <1222149670.5363.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Help, lvremove stuck in disk sleep for over 2 hours
Reply-To: echo@echoreply.us,
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

Hello,

I have a lvremove process that has been stuck in state D (Disk sleep)
for over 2 hours, I am attaching a dump of its status at the end of this
e-mail.

Is there something that I can do to try and wake this up? A reboot on
this particular machine would be very, very bad. Processes in this state
can't be killed by signals. 

The LV that its trying to remove is named 6-e-7-sda1 and is in the
volume group named 'shelf1'.

If I list /dev/shelf1 , I see the LV as a broken symbolic link, also
verified that the LV is gone from /dev/mapper. I'm very concerned about
corrupting data on that VG so I'm hoping to get some advice on what to
do next.

LVM version:     2.02.26 (2007-06-15)
Library version: 1.02.20 (2007-06-15)
Driver version:  4.12.0
Using Ubuntu Hardy server, the VG is backed by an Areca ARC-1120 RAID 1

All other LVs in that group that are backing virtual machines seem to be
fine.

Is there any other information that I can provide?

Regards,
--Tim

Output below:

root@horizon5:/proc/10300# cat status
Name:   lvremove
State:  D (disk sleep)
Tgid:   10300
Pid:    10300
PPid:   1
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 256
Groups: 0
VmPeak:    33704 kB
VmSize:    33704 kB
VmLck:     33704 kB
VmHWM:     15280 kB
VmRSS:     15280 kB
VmData:    10652 kB
VmStk:       272 kB
VmExe:       516 kB
VmLib:      2472 kB
VmPTE:        80 kB
Threads:        1
SigQ:   5/127286
SigPnd: 0000000000000100
ShdPnd: 0000000000024103
SigBlk: fffffffe7ffbfeff
SigIgn: 0000000000000000
SigCgt: 0000000180000000
CapInh: 0000000000000000
CapPrm: 00000000fffffeff
CapEff: 00000000fffffeff
voluntary_ctxt_switches:        120
nonvoluntary_ctxt_switches:     3
