Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3U2TlTE029895
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 22:29:47 -0400
Received: from vms040pub.verizon.net (vms040pub.verizon.net [206.46.252.40])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3U2Ta6G017498
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 22:29:36 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms040.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0400AKW9RWBUS0@vms040.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 29 Apr 2008 21:33:33 -0500 (CDT)
Date: Tue, 29 Apr 2008 22:29:17 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4817C2FD.1010909@verizon.net>
Message-id: <4817D97D.8060805@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net>
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

In rescue, I tried running:
===============================
 lvm vgchange -P -ay
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'blahblah'
  Couldn't find device with uuid 'blahblah'
  Couldn't find device with uuid 'blahblah'
  Couldn't find device with uuid 'blahblah'
  Device /dev/ioerror not found.
  device-mapper reload ioctl failed: invalid argument
  device-mapper reload ioctl failed: invalid argument
  Couldn't find device with uuid 'blahblah'
  Couldn't find device with uuid 'blahblah'
2 logical volume(s) in volume group "VolGroup00" now active.

lvm vgdisplay -v VolGroup00
Segmentation fault
===============================

In fact every 'lvm' command you try to run after that now gives a 
Segmentation fault.

What I want to do is to try:
lvm vgreduce VolGroup00 --removemissing

which I think might make the volume consistent again but I cannot even 
run the command without segfault.
Any ideas on how to get rid of the segfaulting?

Gerry
