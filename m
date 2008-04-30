Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3U3pcc3029608
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 23:51:38 -0400
Received: from vms042pub.verizon.net (vms042pub.verizon.net [206.46.252.42])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3U3pQuN029648
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 23:51:26 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0400608DDBZN20@vms042.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 29 Apr 2008 22:51:12 -0500 (CDT)
Date: Tue, 29 Apr 2008 23:51:11 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4817D97D.8060805@verizon.net>
Message-id: <4817ECAF.4020806@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
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

So I got the vgreduce to work:

reboot into rescue and issue it as the very first command:
lvm vgreduce VolGroup00 --removemissing
lvm vgdisplay -v VolGroup00
<no error this time>
but I do see that my LogVol00 is missing (root disk) (this is what got 
corrupted)
lvm lvchange -ay /dev/VolGroup00/LogVol01
<no errors, good>
vgdisplay now shows LogVol01 as available, yea!
so now what about the missing LogVol00?
what I want to try is replacing it at exactly the same extents with a 
new LogVol00
lvm lvcreate --extents 284 --name=/dev/VolGroup00/LogVol00 VolGroup00
<it succeeds>
vgdisplay now shows both log vols with exactly the same size as 
originally before the problem.
vgchange -ay
<succeeds and activates VG and both LV)
mount -t ext3 /dev/mapper/VolGroup00-LogVol00  /mnt/sysimage
<fails: invalid argument>
so now I think that something needs to be done with uuid but I'm not 
familiar with how to do this.
even if I have no access to data on the logvol, if I can mount it I can 
restore it.
Anyone know how to make the new LogVol00 mount?

Gerry
