Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1P54Wb2015975
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 00:04:33 -0500
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1P53Mll025895
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 00:03:27 -0500
Received: from [192.168.1.2] ([96.255.155.44]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFL007JQVD80US1@vms173019.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 24 Feb 2009 23:03:18 -0600 (CST)
Message-id: <49A4CE09.8070101@smart.net>
Date: Tue, 24 Feb 2009 23:50:17 -0500
From: "Daniel B." <dsb@smart.net>
MIME-version: 1.0
Subject: Re: [linux-lvm] re --corelog: does synchronization re-copy all data?
References: <49A0A252.30803@smart.net> <20090223071132.GA9670@us.ibm.com>
In-reply-to: <20090223071132.GA9670@us.ibm.com>
Content-transfer-encoding: 7bit
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
To: linux-lvm@redhat.com

malahal@us.ibm.com wrote:
> Daniel B. [dsb@smart.net] wrote:

>> More generally, can LVM perform RAID1-style mirroring with only
>> two disks (without having to re-copy everything each boot)
>> (and, of course, being recoverable in case either disk fails)?
> 
> You should be able to force LVM to create a log device on one of your
> two devices (--alloc anywhere)

So what happens if the disk containing the log dies?  Does LVM
keep running (presenting the logical volume implemented on the
physical volumes on the still-working disk)?

(And what happens at reboot time (with the failed disk still in
place)?)

Thanks,
Daniel
-- 
Daniel B.
dsb@smart.net
