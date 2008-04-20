Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3KGh8r8032710
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 12:43:08 -0400
Received: from smtp01.atlngahp.sys.nuvox.net (smtp-out1.atlngahp.sys.nuvox.net
	[70.43.63.18])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3KGgumj007927
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 12:42:56 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp01.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3KGgsGS025169
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 12:42:54 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id CCFF836E8A9
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 12:42:53 -0400 (EDT)
Message-ID: <480B728C.9010708@Media-Brokers.com>
Date: Sun, 20 Apr 2008 12:42:52 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480A3291.7070702@Media-Brokers.com>
	<480AB63C.4070605@gmail.com>
In-Reply-To: <480AB63C.4070605@gmail.com>
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

On 4/19/2008, David Robinson (zxvdr.au@gmail.com) wrote:
>> Since I'm no longer using the second partition at all, wouldn't it 
>> be simpler/cleaner to just delete the second partition entirely 
>> (using fdisk) and then just resize /dev/sdb1 to include the new free 
>> space using vgextend?
>>
>> Or will that not work?

> That will work. You'll need to run pvresize after resizing the 
> partition, and you wouldn't need to use vgextend.

Thanks for taking the time to hold my hand a little through this David...

OT: this list seems a little on the dead side... is there a more active 
LVM oriented list that you are aware of?

Anyway...

Ok, so I guess the only question I have is - does it matter?

Is my following evaluation correct? :

It is much simpler - because I can do this without rebooting - to just do:

vgextend vg2 /dev/sdb2, then

lvextend -L+100G /dev/vg2/var, then

resize_reiserfs -f /dev/vg2/var

than it is to:

delete /dev/sdb2, reboot, then

resize /dev/sdb1, reboot, then

run pvresize, *then*

run lvextend...

So, again - does it really matter? Is having my vg2 in one big LVM 
partition 'better' than having it consist of two different partitions?

I'm thinking it does *not* matter, so will most likely go with the 
first/easiest option, unless you (or someone else) provides a good 
reason to take option 2...

Thanks again,

-- 

Best regards,

Charles
