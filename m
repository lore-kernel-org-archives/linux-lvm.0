Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1170LO14427
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:00:21 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1170FfX008776
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:00:16 -0500
Date: Tue, 1 Feb 2005 08:00:15 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Building lvm2 against 2.6.10...
Message-ID: <20050201070014.GA14642@percy.comedia.it>
References: <41FC9F47.4030001@shaw.ca>
	<20050130095955.GL21542@percy.comedia.it>
	<41FDCEF5.1010600@shaw.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41FDCEF5.1010600@shaw.ca>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jan 30, 2005 at 11:23:49PM -0700, Gerald Schepens wrote:
>Luca Berra wrote:
>
>>On Sun, Jan 30, 2005 at 01:48:07AM -0700, Gerald Schepens wrote:
>>
>>>The configure script fails for lvm2 with the following...
>>>
>>>checking linux/fs.h usability... no
>>>checking linux/fs.h presence... no
>>>checking for linux/fs.h... no
>>>configure: error: bailing out
>>>
>>>There isn't much of use in the config.log.
>>
>>well, there should be something, maybe something referring to pgoff_t?
>>
>>check you have defined pgoff_t in /usr/include/linux/types.h
>>
>
>Actually, I just wasn't looking far enough up in the config.log. I found 
>a few of the problems but I haven't been able to get the thing to 
>compile. Here's the skinny:
>
>- The asm directory doesn't exist in the linux-2.6.10 subdirectory. 
>There are only asm-ppc, asm-x86_64, asm-i386, etc. So I made a symlink 
>to the appropriate one in /usr/include.

i don't know which linux distro you are using, but relying on the kernel
for includes is bad practice. anyway if you do you better do at least a
make oldconfig in the kernel tree.

>- There is no header file that I could find anyway, called 
>libdevmapper.h. I symlinked it to device-mapper.h.
you have to build and install the device mapper.

>- Now, there's some kind of problem with the definition of sector_t.

sorry my scrying orb is out of order.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
