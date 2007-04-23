Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3NA6PeI015657
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 06:06:25 -0400
Received: from sandbox.cz (sandbox.cz [87.236.197.188])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3NA6MQG012900
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 06:06:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by sandbox.cz (Postfix) with ESMTP id 2310129F28
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 12:06:16 +0200 (CEST)
Received: from sandbox.cz ([127.0.0.1])
	by localhost (sandbox.cz [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aFR+r3ACWMtT for <linux-lvm@redhat.com>;
	Mon, 23 Apr 2007 12:06:13 +0200 (CEST)
Received: from boudicka.no-ip.org (linux.mfservis.cz [212.71.131.91])
	by sandbox.cz (Postfix) with ESMTP id 7E99729F22
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 12:06:09 +0200 (CEST)
Message-ID: <462C852E.8010300@sandbox.cz>
Date: Mon, 23 Apr 2007 12:06:38 +0200
From: PeS <pes@sandbox.cz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to resize a PV located on a SAN LUN
References: <20070420114742.GA6661@mail.mhnet.de>
	<1177089048.10232.6.camel@zhadum.wg.at>
In-Reply-To: <1177089048.10232.6.camel@zhadum.wg.at>
Content-Transfer-Encoding: 7bit
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

Thomas Hager wrote:
> On Fri, 2007-04-20 at 13:47 +0200, Micha Holzmann wrote:
>> Hello,
> hi,
> 
>> Now i had to increase the size of partition of sda12 which is a LVM.
> why would you want to do that? if your vg is running out of free
> extents, why not just add a new LUN from the SAN and extend the vg with
> it?

Maybe, because their SAN configuration get bloated with smaller LUNs? 
When SAN enables extending size, why not use it?

>> I am not sure which is the right way. Within the storage managment
>> software i can increase the size of the LUN. After rebooting the machine
>> the additional space is appended at the end of partitions and it is
>> marked as free. How can i now increase the LVM partition. Which
>> tool/programm i do need for this task?
> you can't really increase the physical volume, because there's a swap
> partition between your physical volume and the free space.
> use fdisk to partition the free space as /dev/sda14, create a physical
> volume on the new partition (pvcreate /dev/sda14) and extend the
> volume group with the new physical volume (vgextend yourvg /dev/sda14).

As it's swap partition, he can recreate it. So create new swap partition 
/dev/sda14 at the end of extended disk. Then mkswap /dev/sda14, swapon 
/dev/sda14, swapoff /dev/sda13. Delete /dev/sda13, add size to 
/dev/sda12 using fdisk. Then use pvresize /dev/sda12 (it'll autodetect 
new size). And after this, you can see free PE in vg.

Or better, if you can disable swap partition for some time, switch it 
off, delete sda13, resize sda12, pvresize sda12 and create new LV for 
swap inside VG. With this, next time you add some space, you won't 
move/delete swap partition, just resize(fdisk) and pvresize sda12.

> hth,
> tom.

Hope this helps,
PeS
