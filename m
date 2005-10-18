Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9IJptV11356
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 15:51:55 -0400
Received: from hetfield.patsoffice.com (092.106-113-64.ftth.swbr.surewest.net
	[64.113.106.92])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9IJpmwZ026363
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 15:51:48 -0400
Received: from [192.168.0.11] (unknown [192.168.0.11])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by hetfield.patsoffice.com (Postfix) with ESMTP id 78E08CB37B
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 12:51:11 -0700 (PDT)
From: "Patrick Lawrence (LVM List)" <5e67ea4d1e39ed0d23e6@patsoffice.com>
Date: Tue, 18 Oct 2005 12:50:57 -0700
Message-Id: <1129665057.4262.7.camel@cantrell.patsoffice.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with LVM2 and device-mapper
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
To: linux-lvm@redhat.com

Hello,

I am using CentOS 4 and just did an upgrade from 4.1 to 4.2 on my x86_64
home server.  After a reboot, one of my vol groups stopped working.
It's a volume group spread across 2 disks and when I try to activate
that volgroup I get the following:

<snip>
[root@hetfield mapper]# vgchange -ay VolGroup02
   device-mapper ioctl cmd 9 failed: Invalid argument
   Couldn't load device 'VolGroup02-DVD'.
   1 logical volume(s) in volume group "VolGroup02" now active
<snip>

and the relevant portion of the /var/log/messages has:

<snip>
Oct 17 08:45:07 hetfield kernel: device-mapper: dm-linear: Device lookup
failed
Oct 17 08:45:07 hetfield kernel: device-mapper: error adding target to
table
<snip>

My other two volgroups are working fine.  It's just this third one that 
has problems.

I did quite a bit of googling yesterday, but I didn't come up with much 
although I have to confess that I know jack about the device mapper...

Is there anything I can provide to diagnose the problem further?  Since
CentOS tracks RHEL4 very closely, I suspect this affects RHEL4 as well.

Regards,

Pat
