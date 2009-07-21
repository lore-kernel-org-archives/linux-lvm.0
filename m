Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LKl00J003796
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:47:00 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LKkhS2005651
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:46:46 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1MTMEU-0001fd-Jg
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 22:46:42 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1MTMEB-0005qx-Hs
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 22:46:23 +0200
Message-ID: <4A662918.6050109@whgl.uni-frankfurt.de>
Date: Tue, 21 Jul 2009 22:46:16 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing
	logical	volume, help!
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>	<20090721195830.GA30206@esri.com>	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>	<20090721200728.GA30327@esri.com>	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
In-Reply-To: <20090721203532.GA30997@esri.com>
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

Ray Van Dolson schrieb:
> On Tue, Jul 21, 2009 at 01:29:23PM -0700, Adam Olsen wrote:
>> On Tue, Jul 21, 2009 at 2:07 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
>>> Hmm... can you do an fdisk on your LV now?  That error doesn't look
>>> good though.
>> Nope, still says "unable to read"
>>
>>> Are you able to run fdisk on each of the member physical volumes
>>> successfully?
>> I'm not sure how to do that.  For example:
>>
>> imgserv:/storage/# fsck /dev/sda3
>> fsck 1.41.3 (12-Oct-2008)
>> fsck: fsck.lvm2pv: not found
>> fsck: Error 2 while executing fsck.lvm2pv for /dev/sda3
>>
>> Though, it looks like fsck.lvm2pv is not something that has actually
>> been created yet.
> 
> Nono, don't do that... fsck is for filesystems :)  Just run fdisk
> /dev/sda, run 'p' (for print) and see if you can see your LVM
> partition.
> 
> Just a poor man's way to check that /dev/sda is OK.  Do this for the
> other PV members.
> 
> Do not run fsck on it, that'll hose the data (if it even runs at all).
> 
> Ray
> 

fdisk -l /dev/...

Should do the job aswell, if it's only about printing the partition table

-Sven
