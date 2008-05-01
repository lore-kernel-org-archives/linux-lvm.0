Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41GUq6q028694
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 12:30:52 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m41GUqBL000512
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 12:30:52 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m41GUq80000507
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 12:30:52 -0400
Date: Thu, 1 May 2008 12:30:52 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <20080501154800.GA5941@us.ibm.com>
Message-ID: <Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>



On Thu, 1 May 2008, malahal@us.ibm.com wrote:

> Gerry Reno [greno@verizon.net] wrote:
>> Milan Broz wrote:
>>> ... After reboot you have no ramdisk, and the Volume Group is incomplete
>>> (because you didn't removed PV on ramdisk).
>>>
>> And this is no different than if snapshot was on any other device such as
>> esata-hdd, usb-hdd or usb stick.  LVM should handle this.  If the snapshot
>> device goes away, then just vgreduce it on the reboot.

If you mount the origin device with missing snapshot, you destroy the 
snapshot (even if you don't touch it). The snapshot can no longer be 
repaired.

So it is safer to not activate device in this case then destroy data.

Imagine, for example, you have origin and snapshot, you reconfigure disks 
in some weird way that the snapshot disk is inaccessible, you boot, and 
the system automatically starts without the snapshot. And you lose any 
data that you stored on that snapshot.

>> Trying to retrofit snapshot into existing systems is far easier if you can
>> use ramdisk, esata-hdd, usb-hdd, usb-stick because most systems have
>> allocated all space and rather than struggling through trying to compact
>> and reduce VG, LV, PV, partition, filesystem to gain space it is much
>> easier to use other devices.  And again this is something that LVM should
>> be able to handle.

You can with dmsetup (but it has deadlocks). Maybe someone could write 
non-deadlocky snapshot-managing tool that wouldn't depend on lvm vgs, pvs 
and lvs.

Mikulas
