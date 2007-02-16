Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1G9jOFf004077
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 04:45:24 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1G9jMAx032712
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 04:45:22 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 5A87C54128
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 10:45:16 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05125-11 for <linux-lvm@redhat.com>;
	Fri, 16 Feb 2007 10:45:01 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 10:45:01 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 89C4394EE
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 10:44:55 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (192.168.113.3 [192.168.113.3]) (amavisd-new, port 10025)
	with ESMTP id IlGj2TPnavbY for <linux-lvm@redhat.com>;
	Fri, 16 Feb 2007 10:45:03 +0100 (CET)
Received: from [81.173.238.168] (xdsl-81-173-238-168.netcologne.de
	[81.173.238.168]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 10:44:53 +0100 (CET)
Message-ID: <45D57D16.8060902@wpkg.org>
Date: Fri, 16 Feb 2007 10:44:54 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
References: <45D448F5.3000301@wpkg.org> <45D47AF5.2040106@wpkg.org>
	<20070216074737.GA14119@percy.comedia.it>
In-Reply-To: <20070216074737.GA14119@percy.comedia.it>
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
To: linux-lvm@redhat.com

Luca Berra schrieb:
> On Thu, Feb 15, 2007 at 04:23:33PM +0100, Tomasz Chmielewski wrote:
>> Tomasz Chmielewski schrieb:
>>> Recently, I used "vgdisplay", and noticed that it gives a "checksum 
>>> error":
>>>
>>> # vgdisplay
>>>   /dev/sda2: Checksum error
> ....
>>>
>>> Should I be scared? What does it mean? What should I do about it? I 
>>> wouldn't like to loose the data.
>>>
>>> If it helps, my setup looks like that:
>>>
>>> HDD1-sda2-\
>>> HDD2-sdb2-|__RAID-10--LVM-2
>>> HDD3-sdc2-|
>>> HDD4-sdd2-/
>>>
>>> I'm running 2.6.17.8 kernel.
>>
> ...
>>
>> So this basically means, that LVM was set up on /dev/sda2 some time 
>> ago, but it was never removed from there - instead, RAID-10 was set up 
>> on that partition?
> 
> I don't think so. if sda2 is part of a raid10 md array probably the
> beginning sector of the md device maps to the beginning sector of the
> real device, hence lvm will find an lvm signature on /dev/sda2.

Is there a way to check if it's really the case?

There's something wrong with /dev/sda2 - lvmdiskscan claims it's a 
371.58 GB LVM physical volume, while /dev/md2 is the physical volume I use.

   /dev/sda2                     [      371.58 GB] LVM physical volume
   /dev/md2                      [      743.16 GB] LVM physical volume


>> Should I do something to fix the things? What?
> yes, re-enable md_component_detection in lvm.conf, why did you disable
> that?

Certainly I didn't touch anything in /etc/lvm/*.
If I look into /etc/lvm/lvm.conf, it says:

devices {
(...)
     # By default, LVM2 will ignore devices used as components of
     # software RAID (md) devices by looking for md superblocks.
     # 1 enables; 0 disables.
     md_component_detection = 1
}

It's enabled.

So the problem is somewhere else. Where?


BTW, the machine is running Debian etch (ARM port).

"smartctl" says all four disks are fine (they are quite new, too), so 
it's definitely not a hardware problem.


I guess one way to fix it would be mark all partitions faulty on 
/dev/sda, and then, to recreate the RAIDs.
But I'm curious to know how could I handle such a situation if I didn't 
have RAID.



-- 
Tomasz Chmielewski
http://wpkg.org
