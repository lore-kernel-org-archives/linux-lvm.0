Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41NpA9X032159
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 19:51:10 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41NowFR004151
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 19:50:59 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700L7WRKCFDO0@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 18:50:37 -0500 (CDT)
Date: Thu, 01 May 2008 19:50:35 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <481A4039.3050208@verizon.net>
Message-id: <481A574B.50705@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <481A1D32.6020705@Media-Brokers.com> <481A1FAF.5050303@verizon.net>
	<481A221D.80209@Media-Brokers.com> <481A262C.7080908@verizon.net>
	<20080501202534.GU18935@agk.fab.redhat.com>	<481A286E.80309@verizon.net>
	<481A2947.9070907@Media-Brokers.com>	<481A29DD.6040108@verizon.net>
	<481A2BB4.7080504@Media-Brokers.com>	<481A2EB3.40703@verizon.net>
	<20080501215952.GV18935@agk.fab.redhat.com>
	<481A4039.3050208@verizon.net>
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

Gerry Reno wrote:
> Alasdair G Kergon wrote:
>> It's up to your initrd and/or initscripts whether or
>> not and how to use those facilities.
>>
>>   
> Alasdair,
>  Is it possible to define an init script that would run early enough 
> (before LVM tries to activate the volumes) so that I could vgreduce 
> the old snapshot?
>  Or does this require a new initrd?
>
I started looking at this and then found that Fedora appears to have the 
device mapper and snapshot support as modules:

/lib/modules/2.6.20-1.2952.fc6xen/kernel/drivers/md/dm-snapshot.ko
/lib/modules/2.6.20-1.2952.fc6xen/kernel/drivers/md/dm-mod.ko

So what is going to happen if you have a snapshot of root partition 
active and then a reboot happens (sound familiar?).  The kernel on 
restart can no longer read device mapper or snapshot module or root 
partition and it will panic and who knows what else will happen.  
Corruption maybe???

Gerry
