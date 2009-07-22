Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6MFh4ar003199
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 11:43:04 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6MFgmUv025013
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 11:42:49 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1MTdxw-0005Ah-27
	for linux-lvm@redhat.com; Wed, 22 Jul 2009 17:42:48 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1MTdxR-0002qv-1U
	for linux-lvm@redhat.com; Wed, 22 Jul 2009 17:42:17 +0200
Message-ID: <4A673358.2050104@whgl.uni-frankfurt.de>
Date: Wed, 22 Jul 2009 17:42:16 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com> <4A66A30F.1020906@cox.net>
	<2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
	<4A66A873.8050100@cox.net>
	<2473b43f0907212301g605fd40cw894d9266b9877b41@mail.gmail.com>
In-Reply-To: <2473b43f0907212301g605fd40cw894d9266b9877b41@mail.gmail.com>
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

All 'logical' block devices behave pretty much like physical ones.

So you are free to put partition tables on top of lvs or dmcrypt block 
devices, you can aswell put each other on top of each other. It just 
adds possible layers of failure and or overhead.

Since LVs give you the opportunity to be created in whatever size you 
wish, in many usage cases it is perfectly normal and straight forward to 
put a filesystem ontop of an LV instead of a partition table.

To the other guy: Whenever you export some LV as LUN or Blockdevice via 
network as example, you will end up with a partition table on top of the 
logical blockdevice, which is prefectly normal and okay. i.e. if you'd 
want to export some LV via iSCSI to a windows box, you are pretty much 
required to have either a partition table ontop of the lv, or some other 
disk slicing scheme (EFI Partitions, dynamic volume signatures, whatsoever).

Just for your Information.

Adam, there is a blkid command coming with the e2fsprogs, it will print 
all UUIDs+type of all your physical and logical volumes.

I.E.: /dev/mdXXX: UUID="<yourUUID" TYPE="LVM2_member"

Just another option to get an overview of the current situation maybe, 
if you cannot find the UUIDs otherwise.

Regards

-Sven


Adam Olsen schrieb:
> On Tue, Jul 21, 2009 at 11:49 PM, Ron Johnson<ron.l.johnson@cox.net> wrote:
>> Why didn't I have to?  This has always worked for me:
>>
>> # mkfs.${TYPE} /dev/some_vg/some_lv
> 
> Perhaps you're not required to.  I just always assumed you did, so I
> always have.  It does work, and works how you'd expect it to.
> 
