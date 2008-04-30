Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UMUklt020065
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 18:30:46 -0400
Received: from vms040pub.verizon.net (vms040pub.verizon.net [206.46.252.40])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UMUY43019145
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 18:30:34 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms040.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0500J33TDPFP93@vms040.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 30 Apr 2008 17:34:37 -0500 (CDT)
Date: Wed, 30 Apr 2008 18:30:20 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4818E262.4070105@redhat.com>
Message-id: <4818F2FC.5050907@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net>	<4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
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

Milan Broz wrote:
> ... After reboot you have no ramdisk, and the Volume Group is incomplete
> (because you didn't removed PV on ramdisk).
>   
And this is no different than if snapshot was on any other device such 
as esata-hdd, usb-hdd or usb stick.  LVM should handle this.  If the 
snapshot device goes away, then just vgreduce it on the reboot.
Trying to retrofit snapshot into existing systems is far easier if you 
can use ramdisk, esata-hdd, usb-hdd, usb-stick because most systems have 
allocated all space and rather than struggling through trying to compact 
and reduce VG, LV, PV, partition, filesystem to gain space it is much 
easier to use other devices.  And again this is something that LVM 
should be able to handle.
> If there is only snapshot, you can recover it, if some operation placed
> here part of another volume, you will lose data.
>   
part of another volume placed where?  on the snapshot?  I don't 
understand this part.


Regards,
Gerry
