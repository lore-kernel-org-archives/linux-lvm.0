Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j117LKO17906
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:21:20 -0500
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j117LJrB009699
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:21:19 -0500
Received: from pd2mr8so.prod.shaw.ca (pd2mr8so-qfe3.prod.shaw.ca [10.0.141.11])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0IB80053Z1PVMNB0@l-daemon> for linux-lvm@redhat.com; Tue,
	01 Feb 2005 00:20:19 -0700 (MST)
Received: from pn2ml1so.prod.shaw.ca ([10.0.121.145])
	by pd2mr8so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IB800LUB1PIHC20@pd2mr8so.prod.shaw.ca> for
	linux-lvm@redhat.com; Tue, 01 Feb 2005 00:20:06 -0700 (MST)
Received: from [68.146.228.127]
	(S010600e018f9c2be.cg.shawcable.net [68.146.228.127])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IB800J1C1PI1N@l-daemon> for linux-lvm@redhat.com; Tue,
	01 Feb 2005 00:20:06 -0700 (MST)
Date: Tue, 01 Feb 2005 00:20:06 -0700
From: Gerald Schepens <schepens@shaw.ca>
Subject: Re: [linux-lvm] Building lvm2 against 2.6.10...
In-reply-to: <20050201070014.GA14642@percy.comedia.it>
Message-id: <41FF2DA6.4030809@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <41FC9F47.4030001@shaw.ca>
	<20050130095955.GL21542@percy.comedia.it> <41FDCEF5.1010600@shaw.ca>
	<20050201070014.GA14642@percy.comedia.it>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

My distro is Red Hat 9.

I do have the device mapper built. Under 2.6.10, it's called dm-mod.

I took interest in your comment about header files. Where do you get 
your /usr/include files if not from the kernel? Do they come with your 
distro? (Maybe Red Hat 9 is just too old.)

Luca Berra wrote:

> On Sun, Jan 30, 2005 at 11:23:49PM -0700, Gerald Schepens wrote:
>
>> Luca Berra wrote:
>>
>>> On Sun, Jan 30, 2005 at 01:48:07AM -0700, Gerald Schepens wrote:
>>>
>>>> The configure script fails for lvm2 with the following...
>>>>
>>>> checking linux/fs.h usability... no
>>>> checking linux/fs.h presence... no
>>>> checking for linux/fs.h... no
>>>> configure: error: bailing out
>>>>
>>>> There isn't much of use in the config.log.
>>>
>>>
>>> well, there should be something, maybe something referring to pgoff_t?
>>>
>>> check you have defined pgoff_t in /usr/include/linux/types.h
>>>
>>
>> Actually, I just wasn't looking far enough up in the config.log. I 
>> found a few of the problems but I haven't been able to get the thing 
>> to compile. Here's the skinny:
>>
>> - The asm directory doesn't exist in the linux-2.6.10 subdirectory. 
>> There are only asm-ppc, asm-x86_64, asm-i386, etc. So I made a 
>> symlink to the appropriate one in /usr/include.
>
>
> i don't know which linux distro you are using, but relying on the kernel
> for includes is bad practice. anyway if you do you better do at least a
> make oldconfig in the kernel tree.
>
>> - There is no header file that I could find anyway, called 
>> libdevmapper.h. I symlinked it to device-mapper.h.
>
> you have to build and install the device mapper.
>
>> - Now, there's some kind of problem with the definition of sector_t.
>
>
> sorry my scrying orb is out of order.
>
> L.
>
