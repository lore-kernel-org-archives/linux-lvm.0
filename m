Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41FmVo4025049
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 11:48:31 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41Fm7Mc010417
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 11:48:12 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m41FjI3Q016962
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 11:45:18 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m41Fm18W127760
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 09:48:01 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m41Fm1rM014576
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 09:48:01 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m41Fm1HK014560
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 09:48:01 -0600
Date: Thu, 1 May 2008 08:48:00 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
Message-ID: <20080501154800.GA5941@us.ibm.com>
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4818F2FC.5050907@verizon.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Gerry Reno [greno@verizon.net] wrote:
> Milan Broz wrote:
>> ... After reboot you have no ramdisk, and the Volume Group is incomplete
>> (because you didn't removed PV on ramdisk).
>>   
> And this is no different than if snapshot was on any other device such as 
> esata-hdd, usb-hdd or usb stick.  LVM should handle this.  If the snapshot 
> device goes away, then just vgreduce it on the reboot.
> Trying to retrofit snapshot into existing systems is far easier if you can 
> use ramdisk, esata-hdd, usb-hdd, usb-stick because most systems have 
> allocated all space and rather than struggling through trying to compact 
> and reduce VG, LV, PV, partition, filesystem to gain space it is much 
> easier to use other devices.  And again this is something that LVM should 
> be able to handle.
>> If there is only snapshot, you can recover it, if some operation placed
>> here part of another volume, you will lose data.
>>   
> part of another volume placed where?  on the snapshot?  I don't understand 
> this part.

LVM is not going to distinguish between your /dev/ram1 and other PV's.
So, if you happen to do any 'lvextend/pvmove/lvcreate/anyother'
operations, LVM may place such data on your ram disk. The only operation
that you do after placing /dev/ram1 under LVM is snapshot creation, I
don't see big problem though. You should be very careful to delete the
ram disk PV before you do any operation that involves allocating space.

--Malahal.
