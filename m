Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3LA724N020482
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:07:02 -0400
Received: from smtp01.atlngahp.sys.nuvox.net (smtp-out1.atlngahp.sys.nuvox.net
	[70.43.63.18])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3LA6eTr023122
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:06:40 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp01.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3LA6avW024825
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:06:36 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 2011935F4DA
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:06:36 -0400 (EDT)
Message-ID: <480C672C.4050407@Media-Brokers.com>
Date: Mon, 21 Apr 2008 06:06:36 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480A3291.7070702@Media-Brokers.com>
	<480AB63C.4070605@gmail.com>	<480B728C.9010708@Media-Brokers.com>
	<1208737330.13193.66.camel@corn.betterworld.us>
In-Reply-To: <1208737330.13193.66.camel@corn.betterworld.us>
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

On 4/20/2008, Ross Boylan (ross@biostat.ucsf.edu) wrote:
>> vgextend vg2 /dev/sdb2, then
>> 
>> lvextend -L+100G /dev/vg2/var, then
>> 
>> resize_reiserfs -f /dev/vg2/var

> In your first example you umount'd before resizing. In this example 
> you don't. reiser doesn't require taking the volume offline before 
> resizing, so I don't think you need umount in any case.

Right... although, if I'm not mistaken, you do have to umount if you are 
*shrinking*...

And I'm assuming thats what the -f is for when doing it on a live 
filesystem?

But I prefer to umount anyway... just feels safer to me...

-- 

Best regards,

Charles
