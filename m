Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0V6NuO01400
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2005 01:23:56 -0500
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0V6Nt1k029086
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2005 01:23:55 -0500
Received: from pd4mr1so.prod.shaw.ca
	(pd4mr1so-qfe3.prod.shaw.ca [10.0.141.212]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IB6001NW4FQCE40@l-daemon> for linux-lvm@redhat.com; Sun,
	30 Jan 2005 23:23:50 -0700 (MST)
Received: from pn2ml9so.prod.shaw.ca ([10.0.121.7])
	by pd4mr1so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IB60033L4FPQRE0@pd4mr1so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sun, 30 Jan 2005 23:23:50 -0700 (MST)
Received: from [68.146.228.127]
	(S010600e018f9c2be.cg.shawcable.net [68.146.228.127])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IB60000Z4FPI8@l-daemon> for linux-lvm@redhat.com; Sun,
	30 Jan 2005 23:23:50 -0700 (MST)
Date: Sun, 30 Jan 2005 23:23:49 -0700
From: Gerald Schepens <schepens@shaw.ca>
Subject: Re: [linux-lvm] Building lvm2 against 2.6.10...
In-reply-to: <20050130095955.GL21542@percy.comedia.it>
Message-id: <41FDCEF5.1010600@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <41FC9F47.4030001@shaw.ca>
	<20050130095955.GL21542@percy.comedia.it>
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

Luca Berra wrote:

> On Sun, Jan 30, 2005 at 01:48:07AM -0700, Gerald Schepens wrote:
>
>> The configure script fails for lvm2 with the following...
>>
>> checking linux/fs.h usability... no
>> checking linux/fs.h presence... no
>> checking for linux/fs.h... no
>> configure: error: bailing out
>>
>> There isn't much of use in the config.log.
>
> well, there should be something, maybe something referring to pgoff_t?
>
> check you have defined pgoff_t in /usr/include/linux/types.h
>

Actually, I just wasn't looking far enough up in the config.log. I found 
a few of the problems but I haven't been able to get the thing to 
compile. Here's the skinny:

- The asm directory doesn't exist in the linux-2.6.10 subdirectory. 
There are only asm-ppc, asm-x86_64, asm-i386, etc. So I made a symlink 
to the appropriate one in /usr/include.

- There is no header file that I could find anyway, called 
libdevmapper.h. I symlinked it to device-mapper.h.

- Now, there's some kind of problem with the definition of sector_t.

Probably all things that need to be addressed in the future with regard 
to 2.6.10... unless, based on the things I've said here, my machine 
sounds like I've got installation issues.
